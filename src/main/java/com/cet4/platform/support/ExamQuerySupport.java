package com.cet4.platform.support;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cet4.platform.domain.ExamStatus;
import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.Question;
import com.cet4.platform.mapper.ExamMapper;
import com.cet4.platform.mapper.ExamRecordMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.vo.ExamRecordVO;
import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamQuerySupport {

    private final ExamMapper examMapper;
    private final QuestionMapper questionMapper;
    private final ExamRecordMapper examRecordMapper;

    public List<ExamVO> listPublishedExams() {
        return examMapper.selectList(new LambdaQueryWrapper<Exam>()
                        .eq(Exam::getStatus, 1)
                        .orderByDesc(Exam::getYear)
                        .orderByDesc(Exam::getMonth)
                        .orderByDesc(Exam::getSetNo))
                .stream()
                .map(ExamViewMapper::toExamVO)
                .toList();
    }

    public List<QuestionVO> listExamQuestions(Long examId) {
        return listQuestions(examId).stream()
                .map(ExamViewMapper::toQuestionVO)
                .toList();
    }

    public List<Question> listQuestions(Long examId) {
        return questionMapper.selectList(new LambdaQueryWrapper<Question>()
                .eq(Question::getExamId, examId)
                .orderByAsc(Question::getSortOrder));
    }

    public List<ExamRecordVO> listUserRecords(Long userId) {
        List<ExamRecord> records = examRecordMapper.selectList(
                new LambdaQueryWrapper<ExamRecord>()
                        .eq(ExamRecord::getUserId, userId)
                        .eq(ExamRecord::getStatus, ExamStatus.SUBMITTED)
                        .orderByDesc(ExamRecord::getCreatedAt));
        if (records.isEmpty()) {
            return List.of();
        }

        List<Long> examIds = records.stream()
                .map(ExamRecord::getExamId)
                .distinct()
                .toList();
        Map<Long, Exam> examsById = examMapper.selectBatchIds(examIds).stream()
                .collect(Collectors.toMap(Exam::getId, Function.identity()));

        return records.stream()
                .map(record -> toRecordVO(record, examsById.get(record.getExamId())))
                .toList();
    }

    private ExamRecordVO toRecordVO(ExamRecord record, Exam exam) {
        ExamRecordVO vo = new ExamRecordVO();
        vo.setRecordId(record.getId());
        vo.setTotalScore(record.getTotalScore());
        vo.setStatus(record.getStatus());
        vo.setStartTime(record.getStartTime());
        vo.setSubmitTime(record.getSubmitTime());

        if (exam != null) {
            vo.setTitle(exam.getTitle());
            vo.setYear(exam.getYear());
            vo.setMonth(exam.getMonth());
            vo.setSetNo(exam.getSetNo());
            vo.setFullScore(exam.getTotalScore());
        }

        return vo;
    }
}
