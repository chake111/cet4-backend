-- ============================================================
-- 2025年6月大学英语四级真题第3套 种子数据
-- 生成时间：2026-04-27
-- 包含：Writing(1题) + Reading_A(10题) + Reading_B(10题)
--      + Reading_C(10题) + Translation(1题)
--
-- 说明：
-- PDF中标注：由于多题多卷，官方第三套真题的听力试题与第二套真题一致，
-- 只是选项顺序不同，因此本套试卷不再提供听力部分。
-- 当前仅提供听力音频链接，未提供第1-25题题干、选项与答案，
-- 因此本文件暂不插入 listening 题目。
-- 听力链接：
-- https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set3/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3
-- ============================================================

USE cet4_platform;

-- ============================================================
-- Step 1: 插入 exam 表
-- ============================================================
INSERT INTO `exam` (`title`, `year`, `month`, `set_no`, `duration`, `total_score`, `status`)
VALUES ('2025年6月大学英语四级真题第3套', 2025, 6, 3, 130, 710, 1);

SET @exam_id = LAST_INSERT_ID();

-- ============================================================
-- Step 2: Part I Writing 写作题
-- ============================================================
INSERT INTO `question`
    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,
     `option_a`, `option_b`, `option_c`, `option_d`,
     `correct_answer`, `score`, `audio_url`, `sort_order`)
VALUES
(
    @exam_id,
    'writing',
    1,
    'writing',
    'Directions: Suppose your university is organizing a forum on the development of students'' cross-cultural communication abilities. You are now to write an essay to express your view. You will have 30 minutes to write the essay. You should write at least 120 words but no more than 180 words.',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    1
);

INSERT INTO `question`
    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,
     `option_a`, `option_b`, `option_c`, `option_d`,
     `correct_answer`, `score`, `audio_url`, `sort_order`)
VALUES
(
    @exam_id,
    'listening',
    1,
    'single_choice',
    'Questions 1 and 2 are based on the news report you have just heard.',
    NULL,
    'They are young teenagers from Atlanta.',
    'They won this year''s 7 Mile Bridge Run.',
    'They completed the race in less than 40 minutes.',
    'They are both students at Marathon High School.',
    'B',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    100
),
(
    @exam_id,
    'listening',
    2,
    'single_choice',
    'Questions 1 and 2 are based on the news report you have just heard.',
    NULL,
    'It drew competitors from more than 40 countries.',
    'It is watched live online by fans all over the world.',
    'It closed the city of Big Pine Key to traffic for three hours.',
    'It is one of the most popular running events in the southeastern U.S.',
    'D',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    101
),
(
    @exam_id,
    'listening',
    3,
    'single_choice',
    'Questions 3 and 4 are based on the news report you have just heard.',
    NULL,
    'He was once a full-time ambassador.',
    'He was soon to retire from the army.',
    'He became an astronaut in 2015.',
    'He used to be a helicopter pilot.',
    'D',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    102
),
(
    @exam_id,
    'listening',
    4,
    'single_choice',
    'Questions 3 and 4 are based on the news report you have just heard.',
    NULL,
    'It has been unbelievably exciting and rewarding.',
    'It has been extraordinarily tough and demanding.',
    'It has contributed a great deal to human flights to space.',
    'It has given him exceptional privilege as an ambassador.',
    'A',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    103
),
(
    @exam_id,
    'listening',
    5,
    'single_choice',
    'Questions 5 to 7 are based on the news report you have just heard.',
    NULL,
    'They are known for their loyalty to their owners.',
    'They are brought in by the store''s customers.',
    'They are regular visitors to the store.',
    'They are pets kept by the store staff.',
    'C',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    104
),
(
    @exam_id,
    'listening',
    6,
    'single_choice',
    'Questions 5 to 7 are based on the news report you have just heard.',
    NULL,
    'It might be a nuisance to the loyal shoppers.',
    'It might be 12 months old.',
    'It might have been abandoned by its owner.',
    'It might have got lost.',
    'D',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    105
),
(
    @exam_id,
    'listening',
    7,
    'single_choice',
    'Questions 5 to 7 are based on the news report you have just heard.',
    NULL,
    'Feed the cats.',
    'Remove any store signs.',
    'Sit in the shop aisles.',
    'Bring in pets with them.',
    'A',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    106
),
(
    @exam_id,
    'listening',
    8,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'Sharing her room with friends.',
    'Cutting down her living expenses.',
    'Living off campus.',
    'Moving to the city center.',
    'C',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    107
),
(
    @exam_id,
    'listening',
    9,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'The facilities available.',
    'Various costs involved.',
    'Changes in living conditions.',
    'The distance to her home.',
    'B',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    108
),
(
    @exam_id,
    'listening',
    10,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'Went through much trouble.',
    'Commuted to save money.',
    'Studied on the bus.',
    'Lived on campus.',
    'C',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    109
),
(
    @exam_id,
    'listening',
    11,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'Discuss the matter with the woman''s mother.',
    'Make a decision within a few days.',
    'Try his best to persuade his wife.',
    'Weigh the benefits against the disadvantages.',
    'A',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    110
),
(
    @exam_id,
    'listening',
    12,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'Interviewing the man.',
    'Looking for Lawrence.',
    'Choosing a present for her nephew.',
    'Helping the man with his shopping.',
    'C',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    111
),
(
    @exam_id,
    'listening',
    13,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'Quite educational.',
    'Incredibly popular.',
    'Driven by batteries.',
    'Obviously childish.',
    'B',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    112
),
(
    @exam_id,
    'listening',
    14,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'One he loves for helping exercise his mind.',
    'One he can play together with his sister.',
    'One he finds interesting and challenging.',
    'One he can play either alone or in a group.',
    'B',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    113
),
(
    @exam_id,
    'listening',
    15,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'It has been enjoyed by kids for decades.',
    'It always reminds people of times of war.',
    'It has been played both indoors and outdoors.',
    'It distinguishes itself as one of the oldest games.',
    'A',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    114
),
(
    @exam_id,
    'listening',
    16,
    'single_choice',
    'Questions 16 to 18 are based on the passage you have just heard.',
    NULL,
    'A display of a variety of products increases consumers'' interest.',
    'Too many choices decrease one''s desire to buy.',
    'Fewer choices lead to lower customer satisfaction.',
    'Customers given more choices are more likely to get confused.',
    'B',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    115
),
(
    @exam_id,
    'listening',
    17,
    'single_choice',
    'Questions 16 to 18 are based on the passage you have just heard.',
    NULL,
    'What kind of display results in more sales.',
    'What kind of display creates more interest.',
    'What kind of display attracts a greater crowd of customers.',
    'What kind of display leads to greater customer satisfaction.',
    'A',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    116
),
(
    @exam_id,
    'listening',
    18,
    'single_choice',
    'Questions 16 to 18 are based on the passage you have just heard.',
    NULL,
    'There are situations where customers buy nothing.',
    'There are tricks to increase customer satisfaction.',
    'There are ways to predict customer preferences.',
    'There are rules that motivate customers to buy.',
    'D',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    117
),
(
    @exam_id,
    'listening',
    19,
    'single_choice',
    'Questions 19 to 21 are based on the passage you have just heard.',
    NULL,
    'Stressful.',
    'Burdensome.',
    'Worthwhile.',
    'Energy-boosting.',
    'C',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    118
),
(
    @exam_id,
    'listening',
    20,
    'single_choice',
    'Questions 19 to 21 are based on the passage you have just heard.',
    NULL,
    'By linking it with employees'' salary.',
    'By taking it as the New Year resolution.',
    'By improving work schedules.',
    'By making it part of the job.',
    'D',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    119
),
(
    @exam_id,
    'listening',
    21,
    'single_choice',
    'Questions 19 to 21 are based on the passage you have just heard.',
    NULL,
    'It was very important to their well-being.',
    'It had taken little of their spare time.',
    'It was an outlet for their personal fulfillment.',
    'It helped improve their working environment.',
    'A',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    120
),
(
    @exam_id,
    'listening',
    22,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'It amounts to 2,000 tons daily.',
    'It mostly comes from supermarkets.',
    'It is estimated at 11% of the UK''s total food supply.',
    'It has a lot to do with independent luxury food suppliers.',
    'B',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    121
),
(
    @exam_id,
    'listening',
    23,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'It rents bicycles to deliver food.',
    'It sells sought-after coffee beans.',
    'It delivers luxury hand-made food.',
    'It recycles waste food from the city.',
    'C',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    122
),
(
    @exam_id,
    'listening',
    24,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'It pays special attention to the size and shape of its products.',
    'It tries to escape the constraints of the current food system.',
    'It cooperates closely with local producers.',
    'It aims to provide high-quality products.',
    'D',
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    123
),
(
    @exam_id,
    'listening',
    25,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'To ensure a regular supply.',
    'To maintain a unique menu.',
    'To make up for the waste products.',
    'To meet customers'' urgent demand.',
    NULL,
    7,
    'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set2/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC2%E5%A5%97.mp3',
    124
);


-- ============================================================
-- Step 3: Part III Reading Comprehension Section A 选词填空
-- 第26-35题
-- 答案：26-G 27-F 28-H 29-C 30-E 31-A 32-I 33-K 34-O 35-J
-- ============================================================

INSERT INTO `question`
    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,
     `option_a`, `option_b`, `option_c`, `option_d`,
     `correct_answer`, `score`, `audio_url`, `sort_order`)
VALUES
(
    @exam_id,
    'reading_a',
    26,
    'blank_filling',
    '选词填空',
    '{"article": "The human brain has the ability to constantly form new networks and connections between brain cells. This means the brain has an almost magical ability to change. This characteristic is {26} apparent in a new study, focusing on people who underwent a hemispherectomy, a surgical procedure in which half of the brain is removed to treat illness.\n\nThe findings showed that, despite missing half of this critical {27}, participants could function well. This was because the {28} half of their brain strengthened. In fact, researchers found that connections—and thus communication—between parts of different brain networks are actually stronger in people who had hemispherectomies than in people with intact brains. This {29} that the brain is able to compensate for loss of certain brain structure.\n\nThere are many other cases in the medical {30} that document the brain''s amazing ability to {31}. For example, a young boy had a significant portion of his brain removed for medical reasons, which included the part of the brain {32} for sight. But a few years after his surgery, scientists found that he could {33} see. They determined that this was because other parts of his brain took over the missing part''s {34} tasks. Another study involved people who could smell, despite missing the region in the brain that processes information about smells. Though they are not sure how these individuals {35} the ability to smell, scientists believe it is possible that another part of the brain took on that task.", "word_bank": ["adapt", "hardly", "indicates", "insist", "literature", "organ", "particularly", "remaining", "responsible", "retained", "still", "strategy", "transformed", "underlines", "visual"]}',
    NULL, NULL, NULL, NULL,
    'particularly',
    7,
    NULL,
    200
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'The findings showed that, despite missing half of this critical {27}, participants could function well.',
    NULL,
    NULL, NULL, NULL, NULL,
    'organ',
    7,
    NULL,
    201
),
(
    @exam_id,
    'reading_a',
    28,
    'blank_filling',
    'This was because the {28} half of their brain strengthened.',
    NULL,
    NULL, NULL, NULL, NULL,
    'remaining',
    7,
    NULL,
    202
),
(
    @exam_id,
    'reading_a',
    29,
    'blank_filling',
    'This {29} that the brain is able to compensate for loss of certain brain structure.',
    NULL,
    NULL, NULL, NULL, NULL,
    'indicates',
    7,
    NULL,
    203
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'There are many other cases in the medical {30} that document the brain''s amazing ability to adapt.',
    NULL,
    NULL, NULL, NULL, NULL,
    'literature',
    7,
    NULL,
    204
),
(
    @exam_id,
    'reading_a',
    31,
    'blank_filling',
    'There are many other cases in the medical literature that document the brain''s amazing ability to {31}.',
    NULL,
    NULL, NULL, NULL, NULL,
    'adapt',
    7,
    NULL,
    205
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'For example, a young boy had a significant portion of his brain removed for medical reasons, which included the part of the brain {32} for sight.',
    NULL,
    NULL, NULL, NULL, NULL,
    'responsible',
    7,
    NULL,
    206
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'But a few years after his surgery, scientists found that he could {33} see.',
    NULL,
    NULL, NULL, NULL, NULL,
    'still',
    7,
    NULL,
    207
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'They determined that this was because other parts of his brain took over the missing part''s {34} tasks.',
    NULL,
    NULL, NULL, NULL, NULL,
    'visual',
    7,
    NULL,
    208
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'Though they are not sure how these individuals {35} the ability to smell, scientists believe it is possible that another part of the brain took on that task.',
    NULL,
    NULL, NULL, NULL, NULL,
    'retained',
    7,
    NULL,
    209
);

-- ============================================================
-- Step 4: Part III Reading Comprehension Section B 段落匹配
-- 第36-45题
-- 答案：36-C 37-H 38-E 39-N 40-F 41-B 42-M 43-G 44-D 45-L
-- ============================================================

INSERT INTO `question`
    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,
     `option_a`, `option_b`, `option_c`, `option_d`,
     `correct_answer`, `score`, `audio_url`, `sort_order`)
VALUES
(
    @exam_id,
    'reading_b',
    36,
    'matching',
    'The age-long mystery has now been resolved as to how phantom traffic jams are caused.',
    '“Phantom” Traffic Jams Are Real—And Scientists Know How to Stop Them\n\nA) Traffic jams are a common problem of most big cities, either in developed or in developing countries, but one kind of traffic jams in particular can be especially frustrating. These are generally known as “phantom” traffic jams, in which dense traffic crawls to a halt for no apparent reason at all.\n\nB) “When caught in such a traffic jam, it is common for drivers to assume that there must be an accident, or construction or something,” said Massachusetts Institute of Technology computer science professor Berthold Horn. “And then you drive and drive and drive... and there isn''t anything there.”\n\nC) The exact cause of these phantom traffic jams has long remained a mystery. But now, new research has found the cause and researchers may have come up with a solution for this frustrating traffic pattern: maintaining equal spacing between cars on the road, rather than driving so closely behind another vehicle that a collision is likely if that vehicle brakes suddenly.\n\nD) Horn said phantom traffic jams are an emergent property of the flow of vehicles down a highway. A phantom jam begins when a car in dense traffic slows down even slightly, which causes the car behind that vehicle to slow even more—and the slowing action spreads backward through the lane of traffic like a wave, getting worse the farther it spreads. Eventually, the cars far behind are forced to stop completely or risk hitting the slower vehicles ahead—and so the traffic grinds to a halt over nothing, Horn said.\n\nE) Horn has been working on the problem of phantom traffic jams for years, and he has come up with a solution: By splitting the difference between the cars in front and the cars behind, the spacing of cars in a stream of traffic can act as a damper on phantom traffic jams. That is, it can prevent the slow-down effect from being amplified by the cars that follow behind, he said. In essence, each driver would constantly make adjustments to keep their car roughly halfway between the car in front and the car behind.\n\nF) Horn calls this method of vehicle spacing bilateral control, and he said it could be achieved with relatively simple modifications to the adaptive cruise control that many new cars already have. Adaptive cruise control is a driver assistance technology that sets a maximum speed for vehicles and automatically slows the speed of the car when traffic is sensed in front of the vehicle. The technology is also known as autonomous cruise control. Such modifications, Horn said, could help fight phantom jams within a few years, maybe decades before an alternative solution, such as networked self-driving cars, becomes a reality on the roads.\n\nG) Traffic jams are caused by a number of factors, such as roads that are poorly designed or over-capacity, localized factors like city traffic-lighting patterns, and events like accidents and construction. But phantom traffic jams can make all those problems worse, Horn said. And the researchers in the new study have calculated that solving phantom jams could save at least some of the estimated 121 billion dollars per year that traffic jams are estimated to cost the U.S. economy, Horn told Live Science.\n\nH) New research by Horn and MIT postdoctoral associate Liang Wang, published in the journal IEEE Transactions on Intelligent Transportation Systems, shows how bilateral control can fight the problem. The researchers made computer models of real-world traffic conditions, showing how a typical U.S. freeway could benefit from cars using bilateral control. That would be in place when human drivers fail to slow down, thus avoiding tailgating the car in front, Horn said. “Under reasonable conditions today, you might get 1,800 cars per lane per hour throughput,” he added. “But with bilateral control, you could almost double that.”\n\nI) The main alternative to increasing traffic throughput per lane has been to build more lanes and more highways, and putting in new roads is very expensive, he said. “If we can increase the throughput on major highways, even if it''s only by 50 percent, that would be a big deal,” Horn said.\n\nJ) With the help of engineering students at high schools in Maine, Horn and Wang have also built a robot simulation that shows how bilateral control can suppress phantom traffic jams. Increasing the spacing of vehicles dampens the effect of slowdowns by cars in front of a given car, so that the slowing is not worsened until it becomes a phantom jam, the researchers said.\n\nK) A video from the project shows a train of autonomous robots running along a track without bilateral control; they eventually back up in phantom jams. But when the robots are switched over to bilateral control, each autonomous robot tries to keep itself halfway between the robot in front and the one behind; the phantom jams disappear as a result, Horn said.\n\nL) Since starting his research on phantom traffic jams, Horn has learned that schools of fish and flocks of birds and bats use similar spacing strategies to avoid hitting each other while swimming or flying in densely packed groups. In particular, studies of millions of bats emerging at dusk from caves in Southeast Asia showed that each bat used a form of bilateral control to reduce the likelihood of collisions with other bats in the densely packed swarm, Horn said.\n\nM) Unlike bats, birds and fish, however, humans have difficulty judging distances behind them. To address that weakness, Horn is now working with the car company Toyota to enable a form of bilateral control via modifications to existing adaptive cruise control systems, which use forward-facing sensors to judge the distance to the vehicle ahead. The bilateral control approach would include adding rear-facing sensors to determine the distance to the vehicle following a car.\n\nN) But until those systems become standard, human drivers can help reduce phantom traffic jams simply by not following the car in front so closely. As Horn argues, “There''s absolutely no advantage of tailgating the car in front of you.”',
    NULL, NULL, NULL, NULL,
    'C',
    7,
    NULL,
    300
),
(
    @exam_id,
    'reading_b',
    37,
    'matching',
    'It is possible to nearly double the hourly throughput per lane by adopting bilateral control.',
    NULL,
    NULL, NULL, NULL, NULL,
    'H',
    7,
    NULL,
    301
),
(
    @exam_id,
    'reading_b',
    38,
    'matching',
    'According to Horn, drivers making constant adjustments for equal spacing between cars in a flow of traffic can help reduce phantom traffic jams.',
    NULL,
    NULL, NULL, NULL, NULL,
    'E',
    7,
    NULL,
    302
),
(
    @exam_id,
    'reading_b',
    39,
    'matching',
    'Before systems for bilateral control are installed, drivers should not follow the car in front too closely so as to reduce phantom traffic jams.',
    NULL,
    NULL, NULL, NULL, NULL,
    'N',
    7,
    NULL,
    303
),
(
    @exam_id,
    'reading_b',
    40,
    'matching',
    'Horn said with some simple modifications to the existing equipment in new vehicles, their spacing bilateral control could be accomplished.',
    NULL,
    NULL, NULL, NULL, NULL,
    'F',
    7,
    NULL,
    304
),
(
    @exam_id,
    'reading_b',
    41,
    'matching',
    'Drivers caught up in phantom traffic jams are likely to think an accident has happened or some construction is going on.',
    NULL,
    NULL, NULL, NULL, NULL,
    'B',
    7,
    NULL,
    305
),
(
    @exam_id,
    'reading_b',
    42,
    'matching',
    'Two sets of sensors would be used to help drivers determine the distances between cars.',
    NULL,
    NULL, NULL, NULL, NULL,
    'M',
    7,
    NULL,
    306
),
(
    @exam_id,
    'reading_b',
    43,
    'matching',
    'Solving the problem of phantom jams could save America billions of dollars every year.',
    NULL,
    NULL, NULL, NULL, NULL,
    'G',
    7,
    NULL,
    307
),
(
    @exam_id,
    'reading_b',
    44,
    'matching',
    'In a phantom traffic jam, the cars in the same lane slow down one after another, creating a wave-like effect.',
    NULL,
    NULL, NULL, NULL, NULL,
    'D',
    7,
    NULL,
    308
),
(
    @exam_id,
    'reading_b',
    45,
    'matching',
    'Horn has found that certain creatures use strategies similar to bilateral control to avoid hitting each other while moving in dense crowds.',
    NULL,
    NULL, NULL, NULL, NULL,
    'L',
    7,
    NULL,
    309
);

-- ============================================================
-- Step 5: Part III Reading Comprehension Section C 仔细阅读
-- 第46-55题
-- 答案：46-B 47-C 48-D 49-A 50-C / 51-C 52-A 53-B 54-D 55-A
-- ============================================================

INSERT INTO `question`
    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,
     `option_a`, `option_b`, `option_c`, `option_d`,
     `correct_answer`, `score`, `audio_url`, `sort_order`)
VALUES
(
    @exam_id,
    'reading_c',
    46,
    'single_choice',
    'What do we learn about American society from the first paragraph?',
    'Our society places a high value on physical beauty. Americans spend an average of over 722 dollars each year on their appearance. One in ten Americans has tried to look like a star.\n\nThere''s nothing wrong with trying to look our best, but excessive focus on physical appearance misses the soulful aspects of what it means to be beautiful. Trying to look like the magazine pictures can take us on a long ride away from what beauty is really about.\n\nMany of us spend far too much time, energy, and money trying to polish an image of what we think will bring attention, love, and connection. In the process, we may fail to attend to ourselves in a way that would move us toward deeper intimacy, fulfillment, and meaning.\n\nIt may sound trite, but beauty is only skin deep; it''s not what brings love toward us. Just read about the latest Hollywood starlets whose seeming love turns into resentment and bitter court battles.\n\nOuter beauty can be as much of a curse as a blessing. We may develop a habit of being so focused on maintaining a perfect appearance that we never cultivate the inner qualities necessary to sustain and deepen intimacy and connection. As I describe in my book, The Authentic Heart, it is the courage to be authentic that connects us in a deeper way.\n\nWhile our initial attraction may be based, in part, on physical chemistry, it is the meeting of our inner worlds that creates the lasting intimacy and spiritual connection for which we long. If we redirect our attention toward cultivating inner qualities, we might find a magnetic attraction that moves us from something superficial to something that connects us to our depths.\n\nThe path toward cultivating inner beauty is really simple. But what is simple is not always easy. Not everyone will see us and appreciate us as we take the courageous risk to allow ourselves to be seen as we really are. But if they don''t, it is their loss, not ours. Eventually we''ll find those compatible souls who appreciate us as we are.',
    'It sees lots of personal income wasted on beauty products.',
    'It considers one''s physical appearance very important.',
    'It places a high value on the physical fitness of stars.',
    'It expects every individual to look their very best.',
    'B',
    7,
    NULL,
    400
),
(
    @exam_id,
    'reading_c',
    47,
    'single_choice',
    'What happens when people strive to look better?',
    NULL,
    'They have to get prepared for resentment and bitter court battles.',
    'They are better able to gain attention, love, and personal connection.',
    'They may neglect to cultivate the inner qualities that matter more.',
    'They feel much of their precious time, energy and resources is wasted.',
    'C',
    7,
    NULL,
    401
),
(
    @exam_id,
    'reading_c',
    48,
    'single_choice',
    'What does the author say about outer beauty?',
    NULL,
    'It may be inherited or cultivated.',
    'It may lead to bad as well as good habits.',
    'It may create connection or isolation.',
    'It may do as much harm as good.',
    'D',
    7,
    NULL,
    402
),
(
    @exam_id,
    'reading_c',
    49,
    'single_choice',
    'What brings about spiritual connection?',
    NULL,
    'Meeting of minds.',
    'Attraction at first sight.',
    'Physical chemistry.',
    'Frequent interaction.',
    'A',
    7,
    NULL,
    403
),
(
    @exam_id,
    'reading_c',
    50,
    'single_choice',
    'What happens when we take the path toward cultivating inner beauty?',
    NULL,
    'We may find a route toward other people''s souls.',
    'We may be appreciated more by people around us.',
    'We will meet people who value us for who we are.',
    'We will be discouraged from revealing our true selves.',
    'C',
    7,
    NULL,
    404
),
(
    @exam_id,
    'reading_c',
    51,
    'single_choice',
    'What can we expect of plant-based meats?',
    'Plant-based meats are coming soon to a dinner table near you, but do they deserve a spot on your plate? If you tried a vegetable burger years ago and dismissed it as rubbery and flavorless, it''s a good time to give meatless meat another chance. Newer varieties imitate the look, flavor, and texture of meat. Analysts don''t expect the meat-free movement to slow anytime soon; a 2021 report predicts the market will skyrocket to 74 billion dollars by 2030—a 957 percent surge.\n\nPlant-based meats are no longer just for vegetarians. Companies such as Impossible Foods and Beyond Meat—the current superstars of the alternative protein sector—are pursuing consumers who enjoy meat but want to reduce their meat consumption for animal rights, health, or environmental reasons. So far, it''s a winning strategy: More than nine out of ten consumers who buy Beyond Burger and Impossible Foods products also eat meat.\n\nMany vegetarians don''t actually care for food that resembles meat. When reporter Joan Solsman, a longtime vegetarian, tried a dish from Impossible Foods, she felt so sick that she couldn''t finish it. “Maybe the best sign that Impossible Foods has cracked the code to realistic fake meat is that I couldn''t stand to take another bite,” she wrote.\n\nMeatless meats are generally a healthier choice than beef because they are cholesterol-free, plus they''re a good source of vitamins, minerals, protein, and fiber.\n\nIf meatless meat can help you stick to a plant-based diet, that in itself can lead to better health. Not only has red meat been linked to cancer, but studies show that people who ditch meat have lower blood pressure, lower average blood sugar, and lower cholesterol levels.\n\nHowever, just because it''s plant-based doesn''t mean it''s health food. Most imitation meats are highly processed and contain high amounts of sodium compared to traditional beef.\n\nThese new generations of alternate meat get all the attention, but don''t forget about whole grains and vegetables. Beans are an especially excellent protein substitute. They''re nutritious, inexpensive, and far more sustainable than any of the processed meatless substitutes on the market today.',
    'An increasing interest in their analyses.',
    'An enormous effort in their promotion.',
    'A huge boost in their consumption.',
    'A noticeable surge in their varieties.',
    'C',
    7,
    NULL,
    405
),
(
    @exam_id,
    'reading_c',
    52,
    'single_choice',
    'What do we learn about consumers buying Beyond Burger and Impossible Foods products?',
    NULL,
    'They are mostly non-vegetarians.',
    'They are mostly animal-rights advocates.',
    'Most of them refrain from eating meat for health reasons.',
    'Most of them eat meatless meat to protect the environment.',
    'A',
    7,
    NULL,
    406
),
(
    @exam_id,
    'reading_c',
    53,
    'single_choice',
    'What can we conclude about Impossible Foods'' products from Joan Solsman''s remark?',
    NULL,
    'They more often appeal to meat-eaters.',
    'They very much resemble animal meat.',
    'Some have become its signature dishes.',
    'Most of them are sold as true fake meat.',
    'B',
    7,
    NULL,
    407
),
(
    @exam_id,
    'reading_c',
    54,
    'single_choice',
    'Why can the habit of eating a plant-based diet lead to better health?',
    NULL,
    'It frees people from any known link to cancer.',
    'It provides all the nutrients for staying healthy.',
    'It helps maintain normal blood pressure and blood sugar.',
    'It reduces various health risks posed by meat consumption.',
    'D',
    7,
    NULL,
    408
),
(
    @exam_id,
    'reading_c',
    55,
    'single_choice',
    'What does the author recommend we eat at the end of the passage?',
    NULL,
    'Naturally produced foods.',
    'Processed protein substitutes.',
    'Red meats like traditional beef.',
    'New generations of alternate meat.',
    'A',
    7,
    NULL,
    409
);

-- ============================================================
-- Step 6: Part IV Translation 翻译题
-- ============================================================

INSERT INTO `question`
    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,
     `option_a`, `option_b`, `option_c`, `option_d`,
     `correct_answer`, `score`, `audio_url`, `sort_order`)
VALUES
(
    @exam_id,
    'translation',
    56,
    'translation',
    '近年来，中国越来越多的城市着力打造“15分钟便民生活圈(convenient living circles)”。社区居民步行15分钟就能享受到日常所需的公共服务。生活圈内建有便利店、公园、健身场地、图书馆、学校、社区食堂、诊所等。生活圈的建立能够为居民提供更加便利、舒适、友好、愉悦的生活环境，更好地满足城市居民多元化的日常生活服务需求，提升居民的生活品质和幸福感。',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    500
);

-- ============================================================
-- 插入统计：
--   writing     : 1题
--   reading_a   : 10题，26-35
--   reading_b   : 10题，36-45
--   reading_c   : 10题，46-55
--   translation : 1题，56
--   合计        : 32题
--
-- 未插入：
--   listening   : 25题，1-25
--   原因：当前第3套PDF未提供听力题干、选项与答案。
-- ============================================================
