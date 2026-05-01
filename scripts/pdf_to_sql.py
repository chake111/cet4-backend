#!/usr/bin/env python3
"""Convert a CET-4 paper PDF into MySQL seed SQL for this project.

The parser is intentionally heuristic because CET-4 PDFs are laid out for print,
not data exchange. It extracts the common official-paper structure:

* Part I Writing
* Part II Listening, questions 1-25
* Part III Reading A/B/C, questions 26-55
* Part IV Translation, question 56
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


OBJECTIVE_SCORE = 7
SUBJECTIVE_SCORE = 106


@dataclass
class Question:
    part: str
    question_no: int
    question_type: str
    content: str
    passage: str | None = None
    option_a: str | None = None
    option_b: str | None = None
    option_c: str | None = None
    option_d: str | None = None
    correct_answer: str | None = None
    score: int = OBJECTIVE_SCORE
    audio_url: str | None = None
    sort_order: int = 0


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Convert a CET-4 paper PDF to SQL rows for exam/question tables."
    )
    parser.add_argument("pdf", type=Path, help="Input paper PDF.")
    parser.add_argument("-o", "--output", type=Path, help="Output .sql file. Defaults to stdout.")
    parser.add_argument("--database", default="cet4_platform", help="Database name used in USE statement.")
    parser.add_argument("--title", help="Exam title. Defaults to filename/year/month/set metadata.")
    parser.add_argument("--year", type=int, help="Exam year. Defaults to filename metadata.")
    parser.add_argument("--month", type=int, help="Exam month. Defaults to filename metadata.")
    parser.add_argument("--set-no", type=int, help="Exam set number. Defaults to filename metadata.")
    parser.add_argument("--duration", type=int, default=130, help="Exam duration in minutes.")
    parser.add_argument("--total-score", type=int, default=710, help="Exam total score.")
    parser.add_argument("--status", type=int, default=1, help="Exam status inserted into exam.status.")
    parser.add_argument("--audio-url", help="Listening audio URL for questions 1-25.")
    parser.add_argument(
        "--answers",
        help=(
            "Answer text or answer-file path. Supports '1=A 2=B', '1-5 A B A D C', "
            "and one-answer-per-line formats. Blank-filling letter answers are converted "
            "to words when the word bank is available."
        ),
    )
    args = parser.parse_args()

    if not args.pdf.exists():
        raise SystemExit(f"PDF not found: {args.pdf}")

    meta = infer_metadata(args.pdf)
    year = args.year or meta.get("year")
    month = args.month or meta.get("month")
    set_no = args.set_no or meta.get("set_no")
    missing = [name for name, value in (("year", year), ("month", month), ("set-no", set_no)) if value is None]
    if missing:
        raise SystemExit("Missing metadata: " + ", ".join(missing) + ". Pass them explicitly.")

    title = args.title or f"{year}年{month}月大学英语四级真题第{set_no}套"
    text = extract_pdf_text(args.pdf)
    answers = load_answers(args.answers) if args.answers else {}

    questions, warnings = parse_paper(text, answers, args.audio_url)
    sql = render_sql(
        title=title,
        year=int(year),
        month=int(month),
        set_no=int(set_no),
        duration=args.duration,
        total_score=args.total_score,
        status=args.status,
        database=args.database,
        questions=questions,
        warnings=warnings,
    )

    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(sql, encoding="utf-8", newline="\n")
    else:
        sys.stdout.write(sql)
    return 0


def infer_metadata(pdf_path: Path) -> dict[str, int]:
    stem = pdf_path.stem
    year_match = re.search(r"(20\d{2})", stem)
    month_match = re.search(r"(?:20\d{2})[.\-_年\s]*(\d{1,2})", stem)
    set_match = re.search(r"第\s*([0-9一二三四五六七八九十]+)\s*套", stem)
    meta: dict[str, int] = {}
    if year_match:
        meta["year"] = int(year_match.group(1))
    if month_match:
        meta["month"] = int(month_match.group(1))
    if set_match:
        meta["set_no"] = chinese_number_to_int(set_match.group(1))
    return meta


def chinese_number_to_int(value: str) -> int:
    if value.isdigit():
        return int(value)
    numbers = {
        "一": 1,
        "二": 2,
        "三": 3,
        "四": 4,
        "五": 5,
        "六": 6,
        "七": 7,
        "八": 8,
        "九": 9,
        "十": 10,
    }
    return numbers[value]


def extract_pdf_text(pdf_path: Path) -> str:
    try:
        import pdfplumber
    except ImportError as exc:
        raise SystemExit("Missing dependency: run `pip install pdfplumber` first.") from exc

    page_texts: list[str] = []
    with pdfplumber.open(str(pdf_path)) as pdf:
        for page in pdf.pages:
            page_text = page.extract_text(x_tolerance=1, y_tolerance=3) or ""
            page_texts.append(page_text)
    return normalize_text("\n".join(page_texts))


def normalize_text(text: str) -> str:
    replacements = {
        "\r": "\n",
        "\u00ad": "",
        "ﬁ": "fi",
        "ﬂ": "fl",
        "’": "'",
        "‘": "'",
        "“": '"',
        "”": '"',
        "，": ",",
        "？": "?",
    }
    for old, new in replacements.items():
        text = text.replace(old, new)
    text = re.sub(r"[ \t]+", " ", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def parse_paper(text: str, answers: dict[int, str], audio_url: str | None) -> tuple[list[Question], list[str]]:
    warnings: list[str] = []
    questions: list[Question] = []

    writing_block = between(text, r"Part\s+(?:I|Ⅰ|1)\s+Writing", r"Part\s+(?:II|Ⅱ|2)\s+Listening")
    writing = strip_directions(writing_block)
    if writing:
        questions.append(
            Question(
                part="writing",
                question_no=1,
                question_type="writing",
                content=writing,
                correct_answer=None,
                score=SUBJECTIVE_SCORE,
                sort_order=1,
            )
        )
    else:
        warnings.append("Writing part was not found.")

    listening_block = between(
        text,
        r"Part\s+(?:II|Ⅱ|2)\s+Listening",
        r"Part\s+(?:III|Ⅲ|in|3)\s+Reading",
    )
    listening_questions = parse_listening_questions(listening_block, answers, audio_url)
    questions.extend(listening_questions)
    warn_count(warnings, "listening", listening_questions, 25)

    reading_block = between(
        text,
        r"Part\s+(?:III|Ⅲ|in|3)\s+Reading",
        r"Part\s+(?:IV|Ⅳ|4)\s+Translation",
    )
    reading_a, word_bank = parse_reading_a(reading_block, answers)
    questions.extend(reading_a)
    warn_count(warnings, "reading_a", reading_a, 10)

    reading_b = parse_reading_b(reading_block, answers)
    questions.extend(reading_b)
    warn_count(warnings, "reading_b", reading_b, 10)

    reading_c = parse_reading_c(reading_block, answers)
    questions.extend(reading_c)
    warn_count(warnings, "reading_c", reading_c, 10)

    translation_block = between(text, r"Part\s+(?:IV|Ⅳ|4)\s+Translation", r"\Z")
    translation = strip_directions(translation_block)
    answer_sheet_marker = re.search(r"Answer Sheet 2\.\s*", translation, flags=re.IGNORECASE)
    if answer_sheet_marker:
        translation = translation[answer_sheet_marker.end() :]
    translation = remove_page_footers(translation).strip()
    if translation:
        questions.append(
            Question(
                part="translation",
                question_no=56,
                question_type="translation",
                content=translation,
                correct_answer=answers.get(56),
                score=SUBJECTIVE_SCORE,
                sort_order=500,
            )
        )
    else:
        warnings.append("Translation part was not found.")

    questions.sort(key=lambda item: item.sort_order)
    if word_bank and any(q.part == "reading_a" and q.correct_answer in word_bank for q in questions):
        warnings.append("Some Reading A answers may still be letters; check the generated SQL.")
    return questions, warnings


def warn_count(warnings: list[str], part: str, questions: list[Question], expected: int) -> None:
    if len(questions) != expected:
        warnings.append(f"{part} parsed {len(questions)} questions; expected {expected}.")


def between(text: str, start_pattern: str, end_pattern: str) -> str:
    start = re.search(start_pattern, text, flags=re.IGNORECASE)
    if not start:
        return ""
    end = re.search(end_pattern, text[start.end() :], flags=re.IGNORECASE)
    if not end:
        return text[start.end() :].strip()
    return text[start.end() : start.end() + end.start()].strip()


def strip_directions(block: str) -> str:
    block = remove_page_footers(block)
    block = re.sub(r"^\s*\([^)]*minutes\)\s*", "", block, flags=re.IGNORECASE)
    block = re.sub(r"^\s*Section\s+[A-C]\s*", "", block, flags=re.IGNORECASE)
    return collapse_ws(block).strip()


def remove_page_footers(text: str) -> str:
    lines = []
    for line in text.splitlines():
        stripped = line.strip()
        if re.search(r"20\d{2}年.*四\s*级\s*真\s*题", stripped):
            continue
        if re.fullmatch(r"[•・,\s\d]+", stripped):
            continue
        lines.append(line)
    return "\n".join(lines)


def parse_listening_questions(
    listening_block: str, answers: dict[int, str], audio_url: str | None
) -> list[Question]:
    questions: list[Question] = []
    prompt_pattern = re.compile(
        r"Questions?\s+\d+\s+(?:and|to)\s+\d+\s+are based on[^.]*\.",
        flags=re.IGNORECASE,
    )
    matches = list(prompt_pattern.finditer(listening_block))
    for index, match in enumerate(matches):
        prompt = collapse_ws(match.group(0))
        end = matches[index + 1].start() if index + 1 < len(matches) else len(listening_block)
        block = listening_block[match.end() : end]
        for parsed in parse_multiple_choice_block(block):
            question_no = parsed["question_no"]
            questions.append(
                Question(
                    part="listening",
                    question_no=question_no,
                    question_type="single_choice",
                    content=prompt,
                    option_a=parsed["options"].get("A"),
                    option_b=parsed["options"].get("B"),
                    option_c=parsed["options"].get("C"),
                    option_d=parsed["options"].get("D"),
                    correct_answer=normalize_answer(answers.get(question_no)),
                    score=OBJECTIVE_SCORE,
                    audio_url=audio_url,
                    sort_order=99 + question_no,
                )
            )
    return [q for q in questions if 1 <= q.question_no <= 25]


def parse_reading_a(reading_block: str, answers: dict[int, str]) -> tuple[list[Question], dict[str, str]]:
    section = between(reading_block, r"Section\s+A", r"Section\s+B")
    if not section:
        return [], {}

    bank_start = re.search(r"\bA\)\s*[A-Za-z]", section)
    if not bank_start:
        return [], {}
    article_raw = section[: bank_start.start()]
    bank_raw = section[bank_start.start() :]
    article = insert_blank_placeholders(format_body_text(remove_reading_a_directions(article_raw)), range(26, 36))
    word_bank = {
        letter.upper(): collapse_ws(word)
        for letter, word in re.findall(r"\b([A-O])\)\s*([A-Za-z][A-Za-z\-']*)", bank_raw)
    }
    passage_json = json.dumps(
        {"article": article, "word_bank": [word_bank[letter] for letter in sorted(word_bank)]},
        ensure_ascii=False,
    )

    questions: list[Question] = []
    for question_no in range(26, 36):
        raw_answer = normalize_answer(answers.get(question_no))
        correct_answer = word_bank.get(raw_answer or "", raw_answer)
        questions.append(
            Question(
                part="reading_a",
                question_no=question_no,
                question_type="blank_filling",
                content="选词填空" if question_no == 26 else sentence_for_blank(article, question_no),
                passage=passage_json if question_no == 26 else None,
                correct_answer=correct_answer,
                score=OBJECTIVE_SCORE,
                sort_order=200 + question_no - 26,
            )
        )
    return questions, word_bank


def remove_reading_a_directions(section: str) -> str:
    section = remove_page_footers(section)
    marker = re.search(r"more than once\.\s*", section, flags=re.IGNORECASE)
    if marker:
        section = section[marker.end() :]
    return section.strip()


def sentence_for_blank(article: str, question_no: int) -> str:
    target = str(question_no)
    escaped = re.escape(target)
    match = re.search(rf"[^.!?]*\{{{escaped}\}}[^.!?]*(?:[.!?]|$)", article)
    if not match:
        return f"Fill blank {{{question_no}}}."
    sentence = collapse_ws(match.group(0))
    return sentence


def parse_reading_b(reading_block: str, answers: dict[int, str]) -> list[Question]:
    section = between(reading_block, r"Section\s+B", r"Section\s+C")
    if not section:
        return []
    first_question = re.search(r"\b36\.\s*", section)
    if not first_question:
        return []
    article = remove_page_footers(section[: first_question.start()])
    article = re.sub(r"^Directions:.*?Answer Sheet 2\.", "", article, flags=re.IGNORECASE | re.DOTALL)
    article = format_labeled_passage(article)
    statement_block = section[first_question.start() :]

    questions: list[Question] = []
    for parsed in parse_statement_block(statement_block, 36, 45):
        question_no = parsed["question_no"]
        questions.append(
            Question(
                part="reading_b",
                question_no=question_no,
                question_type="matching",
                content=parsed["content"],
                passage=article if question_no == 36 else None,
                correct_answer=normalize_answer(answers.get(question_no)),
                score=OBJECTIVE_SCORE,
                sort_order=300 + question_no - 36,
            )
        )
    return questions


def parse_reading_c(reading_block: str, answers: dict[int, str]) -> list[Question]:
    section = between(reading_block, r"Section\s+C", r"\Z")
    if not section:
        return []

    passage_pattern = re.compile(r"Passage\s+(One|Two)", flags=re.IGNORECASE)
    passage_matches = list(passage_pattern.finditer(section))
    questions: list[Question] = []
    for index, match in enumerate(passage_matches):
        end = passage_matches[index + 1].start() if index + 1 < len(passage_matches) else len(section)
        passage_block = section[match.end() : end]
        first_question = re.search(r"\b(4[6-9]|5[0-5])\.\s*", passage_block)
        if not first_question:
            continue
        passage = cleanup_passage_intro(passage_block[: first_question.start()])
        question_block = passage_block[first_question.start() :]
        for parsed in parse_multiple_choice_block(question_block):
            question_no = parsed["question_no"]
            if not 46 <= question_no <= 55:
                continue
            questions.append(
                Question(
                    part="reading_c",
                    question_no=question_no,
                    question_type="single_choice",
                    content=parsed["stem"] or f"Question {question_no}.",
                    passage=passage if question_no in (46, 51) else None,
                    option_a=parsed["options"].get("A"),
                    option_b=parsed["options"].get("B"),
                    option_c=parsed["options"].get("C"),
                    option_d=parsed["options"].get("D"),
                    correct_answer=normalize_answer(answers.get(question_no)),
                    score=OBJECTIVE_SCORE,
                    sort_order=400 + question_no - 46,
                )
            )
    return questions


def cleanup_passage_intro(text: str) -> str:
    text = remove_page_footers(text)
    text = re.sub(r"Questions?\s+\d+\s+to\s+\d+\s+are based on the following passage\.", "", text, flags=re.I)
    return format_body_text(text)


def parse_multiple_choice_block(block: str) -> list[dict[str, object]]:
    entries = split_numbered_entries(block)
    parsed: list[dict[str, object]] = []
    for question_no, body in entries:
        body = trim_question_tail(body)
        option_matches = list(re.finditer(r"\b([A-D])\)\s*", body))
        if len(option_matches) < 4:
            continue
        stem = collapse_ws(body[: option_matches[0].start()])
        options: dict[str, str] = {}
        for index, match in enumerate(option_matches):
            end = option_matches[index + 1].start() if index + 1 < len(option_matches) else len(body)
            options[match.group(1)] = clean_option(body[match.end() : end])
        parsed.append({"question_no": question_no, "stem": stem, "options": options})
    return parsed


def trim_question_tail(body: str) -> str:
    tail = re.search(
        r"\n\s*(?:Section\s+[A-C]\b|Part\s+(?:I|II|III|IV|Ⅰ|Ⅱ|Ⅲ|Ⅳ|1|2|3|4)\b|Directions:)",
        body,
        flags=re.IGNORECASE,
    )
    if tail:
        return body[: tail.start()].strip()
    return body


def parse_statement_block(block: str, start_no: int, end_no: int) -> list[dict[str, object]]:
    return [
        {"question_no": question_no, "content": collapse_ws(body)}
        for question_no, body in split_numbered_entries(block)
        if start_no <= question_no <= end_no
    ]


def split_numbered_entries(block: str) -> list[tuple[int, str]]:
    matches = list(re.finditer(r"(?m)(?<!\d)\b(\d{1,2})\.\s*", block))
    entries: list[tuple[int, str]] = []
    for index, match in enumerate(matches):
        question_no = int(match.group(1))
        end = matches[index + 1].start() if index + 1 < len(matches) else len(block)
        entries.append((question_no, block[match.end() : end].strip()))
    return entries


def clean_option(value: str) -> str:
    value = remove_page_footers(value)
    value = format_inline_text(value)
    return value.strip(" .\n\t") + "." if value.strip() and not value.strip().endswith((".", "?", "!")) else value.strip()


def collapse_ws(value: str | None) -> str:
    if not value:
        return ""
    return re.sub(r"\s+", " ", value).strip()


def insert_blank_placeholders(text: str, question_numbers: Iterable[int]) -> str:
    for question_no in question_numbers:
        text = re.sub(rf"(?<![\d{{])\b{question_no}\b(?![\d}}])", "{" + str(question_no) + "}", text)
    return text


def format_labeled_passage(text: str) -> str:
    text = remove_page_footers(text)
    text = format_inline_text(collapse_ws(text))
    text = re.sub(r"\s*([A-Z]\))\s*", r"\n\n\1 ", text)
    return text.strip()


def format_body_text(text: str) -> str:
    text = remove_page_footers(text)
    text = collapse_ws(text)
    text = format_inline_text(text)
    text = re.sub(r"\s+([A-O]\))", r"\n\n\1", text)
    paragraph_starts = (
        "Unfortunately",
        "However",
        "This need",
        "As you become",
        "If we base",
        "Throughout life",
        "Of course",
        "In fact",
        "Conventional fixes",
        "A desire",
        "Openness",
        "Some folks",
        "While genes",
        "That's why",
        "This is",
        "Before",
        "Beginning",
        "In relation",
        "Today",
    )
    start_pattern = "|".join(re.escape(start) for start in paragraph_starts)
    text = re.sub(rf"(?<!\n)\s+(?=(?:{start_pattern})\b)", "\n\n", text)
    return text.strip()


def format_inline_text(text: str) -> str:
    text = re.sub(r"\s+", " ", text).strip()
    text = re.sub(r"\s*-\s*", "-", text)
    text = re.sub(r"\s*_+\s*", " ", text)
    text = re.sub(r"([,;:])(?=\S)", r"\1 ", text)
    text = re.sub(r"([.!?])(?=[A-Z\"'])", r"\1 ", text)
    text = re.sub(r"([.!?])\s+\"(?=\s|$)", r'\1"', text)
    text = re.sub(r"\)(?=[A-Za-z])", ") ", text)
    text = re.sub(r"([A-Z]\))(?=\S)", r"\1 ", text)
    text = re.sub(r"\bU\. S\.(?=[a-zA-Z])", "U. S. ", text)
    text = re.sub(r"\bDoAmericans\b", "Do Americans", text)
    text = re.sub(r"\bwordfor\b", "word for", text, flags=re.IGNORECASE)
    text = re.sub(r"\bpassageyou\b", "passage you", text, flags=re.IGNORECASE)
    text = re.sub(r"\borganiser'saddress\b", "organiser's address", text, flags=re.IGNORECASE)
    text = re.sub(r"\bPlayingnumber\b", "Playing number", text)
    text = re.sub(r"\bthebrain\b", "the brain", text, flags=re.IGNORECASE)
    text = re.sub(r"\bshouldnot\b", "should not", text, flags=re.IGNORECASE)
    text = re.sub(r"\bexperiencesas\b", "experiences as", text, flags=re.IGNORECASE)
    text = re.sub(r"\btorise\b", "to rise", text, flags=re.IGNORECASE)
    text = re.sub(r"\brestrainour\b", "restrain our", text, flags=re.IGNORECASE)
    text = re.sub(r"\bofdepression\b", "of depression", text, flags=re.IGNORECASE)
    text = re.sub(r"\bby(\d{4})\b", r"by \1", text)
    text = re.sub(r"\bothers'opinion\b", "others' opinion", text, flags=re.IGNORECASE)
    text = text.replace("chiché", "cliché")
    return text


def normalize_answer(value: str | None) -> str | None:
    if value is None:
        return None
    value = value.strip()
    if len(value) == 1:
        return value.upper()
    return value


def load_answers(answer_source: str) -> dict[int, str]:
    source_path = Path(answer_source)
    if source_path.exists():
        answer_text = source_path.read_text(encoding="utf-8")
    else:
        answer_text = answer_source

    answers: dict[int, str] = {}
    for line in answer_text.splitlines():
        line = line.split("#", 1)[0].split("--", 1)[0].strip()
        if not line:
            continue

        range_match = re.match(r"^(\d{1,2})\s*-\s*(\d{1,2})\s+(.+)$", line)
        if range_match:
            start = int(range_match.group(1))
            end = int(range_match.group(2))
            values = re.findall(r"[A-Oa-o]|[A-Za-z][A-Za-z\-']+", range_match.group(3))
            for question_no, answer in zip(range(start, end + 1), values):
                answers[question_no] = answer
            continue

        for question_no, answer in re.findall(r"(\d{1,2})\s*[:=\-]\s*([A-Oa-o]|[A-Za-z][A-Za-z\-']+)", line):
            answers[int(question_no)] = answer
    return answers


def render_sql(
    *,
    title: str,
    year: int,
    month: int,
    set_no: int,
    duration: int,
    total_score: int,
    status: int,
    database: str,
    questions: Iterable[Question],
    warnings: list[str],
) -> str:
    lines: list[str] = [
        "-- Generated by scripts/pdf_to_sql.py",
        "-- Review the output before importing; PDF text extraction can misread punctuation.",
    ]
    for warning in warnings:
        lines.append(f"-- WARNING: {warning}")
    lines.extend(
        [
            "",
            "SET NAMES utf8mb4;",
            f"USE `{database}`;",
            "",
            "INSERT INTO `exam` (`title`, `year`, `month`, `set_no`, `duration`, `total_score`, `status`)",
            f"VALUES ({sql_value(title)}, {year}, {month}, {set_no}, {duration}, {total_score}, {status});",
            "",
            "SET @exam_id = LAST_INSERT_ID();",
            "",
        ]
    )

    questions = list(questions)
    if not questions:
        lines.append("-- No questions parsed.")
        return "\n".join(lines) + "\n"

    lines.extend(
        [
            "INSERT INTO `question`",
            "    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,",
            "     `option_a`, `option_b`, `option_c`, `option_d`,",
            "     `correct_answer`, `score`, `audio_url`, `sort_order`)",
            "VALUES",
        ]
    )
    value_rows = [render_question_row(question) for question in questions]
    lines.append(",\n".join(value_rows) + ";")
    return "\n".join(lines) + "\n"


def render_question_row(question: Question) -> str:
    values = [
        "@exam_id",
        sql_value(question.part),
        str(question.question_no),
        sql_value(question.question_type),
        sql_value(question.content),
        sql_value(question.passage),
        sql_value(question.option_a),
        sql_value(question.option_b),
        sql_value(question.option_c),
        sql_value(question.option_d),
        sql_value(question.correct_answer),
        str(question.score),
        sql_value(question.audio_url),
        str(question.sort_order),
    ]
    return "(\n    " + ",\n    ".join(values) + "\n)"


def sql_value(value: str | None) -> str:
    if value is None or value == "":
        return "NULL"
    return "'" + value.replace("\\", "\\\\").replace("'", "''") + "'"


if __name__ == "__main__":
    raise SystemExit(main())
