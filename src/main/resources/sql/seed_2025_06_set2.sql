-- ============================================================
-- 2025年6月大学英语四级真题第2套 导入数据
-- 生成时间：2026-04-27
-- 包含：Writing(1题) + Listening(25题) + Reading_A(10题) + Reading_B(10题)
--      + Reading_C(10题) + Translation(1题)
-- 合计：57题
-- ============================================================

USE cet4_platform;

-- ============================================================
-- Step 1: 插入 exam 表
-- ============================================================
INSERT INTO `exam` (`title`, `year`, `month`, `set_no`, `duration`, `total_score`, `status`)
VALUES ('2025年6月大学英语四级真题第2套', 2025, 6, 2, 130, 710, 1);

SET @exam_id = LAST_INSERT_ID();

-- ============================================================
-- Step 2: Part I Writing（写作题，第1题）
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
    'Directions: Suppose your university is conducting a survey to collect students'' opinions on the appropriate use of AI technology in assisting learning. You are now to write an essay to express your view. You will have 30 minutes to write the essay. You should write at least 120 words but no more than 180 words.',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    1
);

-- ============================================================
-- Step 3: Part II Listening Comprehension（听力，第1~25题）
-- 全部听力题共用同一 audio_url
-- ============================================================
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
-- Step 5: Part III Reading Comprehension Section A（第26~35题，选词填空）
-- 词库：
-- A) caught B) cinema C) engaging D) graphically E) highly
-- F) incentive G) instincts H) offences I) punished J) referred
-- K) stood L) symbolic M) tuned N) visually O) worshipped
--
-- 答案：
-- 26-J(referred) 27-B(cinema) 28-C(engaging) 29-I(punished)
-- 30-L(symbolic) 31-H(offences) 32-A(caught) 33-E(highly)
-- 34-K(stood) 35-O(worshipped)
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
    '{\"article\": \"Sir Alfred Hitchcock was an English movie director and producer. Famously {26} to as \\\"The Master of Suspense\\\", Hitchcock is one of the most influential filmmakers in the history of {27}. He was an extraordinary director who entertained his audience with {28} and gripping suspense movies.\\n\\nHis fascination with crime began at an early age when he was {29} by his father who made him spend a few minutes inside a prison for his misconduct. Hence, his movies are {30} of the guilt and innocence of the wrongdoer and the victim. He had a gift for creating stories that consisted of deceit, robbery, murder, corruption, and other criminal {31} with incredible plot twists in the storyline. The principal characters in his movies were often ordinary people {32} in unwanted and unavoidable situations.\\n\\nHe was {33} productive and his amazing body of work is considered fascinating by the critics. Most of his movies have {34} the test of time and are considered to be masterpieces. He is also remembered by other filmmakers, for he continues to inspire them to be passionate about their work. He is also {35} by people around the world for his entertaining and exciting stories.\", \"word_bank\": [\"caught\", \"cinema\", \"engaging\", \"graphically\", \"highly\", \"incentive\", \"instincts\", \"offences\", \"punished\", \"referred\", \"stood\", \"symbolic\", \"tuned\", \"visually\", \"worshipped\"]}',
    NULL, NULL, NULL, NULL,
    'referred',
    7,
    NULL,
    13
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'Hitchcock is one of the most influential filmmakers in the history of {27}.',
    NULL,
    NULL, NULL, NULL, NULL,
    'cinema',
    7,
    NULL,
    14
),
(
    @exam_id,
    'reading_a',
    28,
    'blank_filling',
    'He was an extraordinary director who entertained his audience with {28} and gripping suspense movies.',
    NULL,
    NULL, NULL, NULL, NULL,
    'engaging',
    7,
    NULL,
    15
),
(
    @exam_id,
    'reading_a',
    29,
    'blank_filling',
    'His fascination with crime began at an early age when he was {29} by his father who made him spend a few minutes inside a prison for his misconduct.',
    NULL,
    NULL, NULL, NULL, NULL,
    'punished',
    7,
    NULL,
    16
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'Hence, his movies are {30} of the guilt and innocence of the wrongdoer and the victim.',
    NULL,
    NULL, NULL, NULL, NULL,
    'symbolic',
    7,
    NULL,
    17
),
(
    @exam_id,
    'reading_a',
    31,
    'blank_filling',
    'He had a gift for creating stories that consisted of deceit, robbery, murder, corruption, and other criminal {31} with incredible plot twists in the storyline.',
    NULL,
    NULL, NULL, NULL, NULL,
    'offences',
    7,
    NULL,
    18
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'The principal characters in his movies were often ordinary people {32} in unwanted and unavoidable situations.',
    NULL,
    NULL, NULL, NULL, NULL,
    'caught',
    7,
    NULL,
    19
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'He was {33} productive and his amazing body of work is considered fascinating by the critics.',
    NULL,
    NULL, NULL, NULL, NULL,
    'highly',
    7,
    NULL,
    20
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'Most of his movies have {34} the test of time and are considered to be masterpieces.',
    NULL,
    NULL, NULL, NULL, NULL,
    'stood',
    7,
    NULL,
    21
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'He is also {35} by people around the world for his entertaining and exciting stories.',
    NULL,
    NULL, NULL, NULL, NULL,
    'worshipped',
    7,
    NULL,
    22
);

-- ============================================================
-- Step 5: Part III Section B（段落匹配，第36~45题）
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
    'Fruit juice is different from whole fruit in that it contains much less fibre.',
    'Is juicing actually good for you?

A) Freshly juiced fruit has become a basic dietary item—especially for busy, health-conscious consumers who can save time on making (and perhaps even chewing) their food without missing out on nutrients. Fruit juice also has been linked to claims that it can help you both lose weight and stay healthy. All of which, of course, has made it highly profitable. The global fruit and vegetable juices market was valued at $154 billion in 2016 and is expected to grow.

B) But is juicing really as healthy as we think? Most foods containing fructose—a naturally occurring sugar found in all fruits and fruit juices—don''t seem to have harmful effects as long as they''re not contributing to excess daily calories. This is because the fibre found in whole fruits is intact, and the sugar is contained within the fruit''s cells. It takes our digestive system a while to break these cells down and for fructose to enter the bloodstream.

C) But this is not the case with fruit juice. Unlike whole fruit, fruit juice has most of the fibre removed. This is why the fructose in fruit juices counts as ''free sugars''—which also include honey and the sugars added to foods.

D) Juices containing vegetables can provide more nutrients and less sugar than juices made up of just fruit—but they still lack valuable fibre. Diets high in fibre have been linked to a lower risk of developing heart disease, stroke, high blood pressure and diabetes, and it''s recommended adults consume 30g per day.

E) Aside from the link to type 2 diabetes, many studies agree that fruit juice is harmful if it contributes to an excess in calories.

F) He found negative effects on blood sugar and insulin levels when food provided excess calories from sugars, including fruit juice. However, when the calories weren''t in excess overall, there were some advantages to consuming whole fruit—and even fruit juice. Sievenpiper concludes that the recommended 150ml of fruit juice per day, which is an average serving, is reasonable.

G) So while we know that fruit juice can cause diabetes if it''s part of a diet that has more calories overall, it''s less clear how juice affects the long-term health of those who aren''t overweight. But we have a higher risk of consuming more than the recommended daily number of calories on the days we drink juice. Numerous studies have shown that drinking fruit juice doesn''t make us consume any less of other foods throughout the day.

H) As it is easy to consume large amounts of fruit juice quite quickly, extra calories are taken in. And extra calories can contribute to weight gain. One way we can improve the effects of fruit juice on our health is making sure we select ripe fruit to retain as much of its goodness as possible.

I) Another reason for fruit juice''s recent popularity is the argument that it can help to remove poisonous or harmful substances from the body. However, "the whole concept of a juice diet helping to remove poisonous or harmful substances from the body is completely false."

J) And juice isn''t a cure-all for getting your nutrients, either. "There are a lot of nutrients contained in the parts of the fruits, such as in apple skins, that are excluded when you juice them," says Heather Ferris.

K) Plus, she adds, it''s not an ideal way to reach the advised "five a day"... It provides us with vitamins—but fruit juice is far from a quick fix.',
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
    'Some people believe a juice diet helps to rid our body of harmful or poisonous substances.',
    NULL,
    NULL, NULL, NULL, NULL,
    'I',
    7,
    NULL,
    301
),
(
    @exam_id,
    'reading_b',
    38,
    'matching',
    'A lot of research comes to the same conclusion that fruit juice does harm to the human body when it leads to surplus calories.',
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
    'The claimed health benefits of fruit and vegetable juices have rendered the industry very profitable.',
    NULL,
    NULL, NULL, NULL, NULL,
    'A',
    7,
    NULL,
    303
),
(
    @exam_id,
    'reading_b',
    40,
    'matching',
    'To increase the benefits of fruit juice to our health, we''d better choose ripe fruit to make juice.',
    NULL,
    NULL, NULL, NULL, NULL,
    'H',
    7,
    NULL,
    304
),
(
    @exam_id,
    'reading_b',
    41,
    'matching',
    'Diets containing large amounts of fibre reduce the risk of heart disease, diabetes and other health hazards.',
    NULL,
    NULL, NULL, NULL, NULL,
    'D',
    7,
    NULL,
    305
),
(
    @exam_id,
    'reading_b',
    42,
    'matching',
    'According to a research paper, drinking fruit juice is beneficial on condition that it is consumed in reasonable amounts.',
    NULL,
    NULL, NULL, NULL, NULL,
    'F',
    7,
    NULL,
    306
),
(
    @exam_id,
    'reading_b',
    43,
    'matching',
    'One expert claims that juicing wastes a lot of nutrients contained in fruits.',
    NULL,
    NULL, NULL, NULL, NULL,
    'J',
    7,
    NULL,
    307
),
(
    @exam_id,
    'reading_b',
    44,
    'matching',
    'It takes some time for fruit''s cells to be digested and for fructose to be absorbed.',
    NULL,
    NULL, NULL, NULL, NULL,
    'B',
    7,
    NULL,
    308
),
(
    @exam_id,
    'reading_b',
    45,
    'matching',
    'A lot of research has demonstrated that drinking fruit juice does not reduce our daily consumption of other foods.',
    NULL,
    NULL, NULL, NULL, NULL,
    'G',
    7,
    NULL,
    309
);

-- ============================================================
-- Step 6: Part III Section C（仔细阅读，第46~55题）
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
    'What does science suggest the right dress may do?',
    'We all take a little extra effort to look nice for special occasions. But most of us have conflicting feelings about dressing up and feel guilty about taking the time to focus on clothes. Science now suggests the right dress may give ourselves the extra edge in our professional and personal lives.

We hear sayings like "dress for the job you want; not the job you have". Most people don''t really believe in them, but research into the impact of clothes on behavior now suggests that there may actually be a grain of truth in these sayings. Science says that the clothes we wear affect our behavior, our mood and even the way we interact with others because of the symbolic meaning that we assign to different types of clothing.

We consider some clothes to be powerful, some to be fun, and so on. We even evaluate people whom we have just met based on their clothes. We also evaluate ourselves based on what we are wearing because of the way they make us feel. This means that the experience of wearing something affects our attitudes and our choice of behavior.

There''s a reason tailored jackets are associated with being ''dressed for success''. It seems that wearing formal office wear puts us in the right frame of mind to conduct business. Wearing power clothing makes us feel more confident and even increases hormones needed for displaying dominance. This in turn helps us become better negotiators and abstract thinkers.

While a good suit works wonders for our performance in the boardroom, wearing formal wear isn''t a great idea when we want to socialize. Studies have found that people tend to be less open and less able to relax when they wear formal clothes.

On the other hand, a casual dress helps us become more friendly and creative. These findings support the idea of wearing business casuals on a Friday; since colleagues are most likely to take out time to socialize on the last work day of the week.',
    'Add to our advantage in work and life.',
    'Enable us to look a lot more attractive.',
    'Help us to enjoy a fuller personal life.',
    'Provide extra energy for what we do.',
    'A',
    7,
    NULL,
    400
),
(
    @exam_id,
    'reading_c',
    47,
    'single_choice',
    'Why does science say the clothes one wears may affect their interaction with others?',
    NULL,
    'Clothes usually represent one''s social and economic status.',
    'Clothes largely determine one''s likability by people around.',
    'Different types of clothing markedly reflect different personalities.',
    'Different types of clothing convey different messages symbolically.',
    'D',
    7,
    NULL,
    401
),
(
    @exam_id,
    'reading_c',
    48,
    'single_choice',
    'How do the clothes we wear sway our evaluation of ourselves?',
    NULL,
    'By exerting an effect on our power of judgment.',
    'By impacting how we feel about ourselves.',
    'By affecting what we take as the basis for assessment.',
    'By influencing our interpretation of symbolic messages.',
    'B',
    7,
    NULL,
    402
),
(
    @exam_id,
    'reading_c',
    49,
    'single_choice',
    'Why does the author say tailored jackets are associated with being "dressed for success"?',
    NULL,
    'They are necessary for formal business dealings.',
    'They may help people concentrate on their business.',
    'They are vital to keeping a dominant position in business transactions.',
    'They may enable people to have the right mentality for doing business.',
    'D',
    7,
    NULL,
    403
),
(
    @exam_id,
    'reading_c',
    50,
    'single_choice',
    'What are people advised to do when they want to socialize?',
    NULL,
    'Focus on clothing.',
    'Wear a good suit.',
    'Dress casually.',
    'Look unusual.',
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
    'What does the author think of classical music and opera in today''s world?',
    'With the rise of pop music, jazz, and electronic music, both opera and classical music started to fade away from the public eye. Some people are beginning to wonder whether opera and classical music are still relevant to the modern world of music. Granted, you will not typically see today''s teenagers lending their ears to Bach anytime soon, but there are some major indicators that both opera and classical music are now still quite alive.

The most major indicator of classical music''s importance in society today is the fact that much of the popular music that is currently being produced uses similar beats, harmonies, and melodies as those that were used in some of classical music''s best works. Even so, it can be difficult for those who do not study music theory to see this as an indicator, since it is subtle and just shows the impact symphonic orchestras have had on society''s taste in music.

A better example for the relevance of opera and classical music can be seen in the invention of the rock opera. Opera, in its simplest definition, is telling a story using music as its form. The art of telling a story using music has not faded in the least bit. In fact, sometimes actual orchestras are used for major parts of the opera itself. Some of the world''s greatest hits have been parts of rock operas.

Fans of classical music can also tell you that there are few types of music that are more expressive. So, it should come as no surprise to anyone that classical music pieces are still used as background music in modern movies. Symphonic orchestra compositions have also been created solely for the purpose of being included in major motion pictures. These are often very well received amongst mainstream music fans.

Classical music and opera are the very foundation of what our modern music is based upon. Considering the huge impact they have had on our current society, it is without doubt that we can expect them to continue to remain important for centuries to come.',
    'They still make their presence felt.',
    'They have given way to electronic music.',
    'They will not fade away from the public eye.',
    'They are no longer relevant to teenagers'' lives.',
    'A',
    7,
    NULL,
    405
),
(
    @exam_id,
    'reading_c',
    52,
    'single_choice',
    'What do we learn about much of the popular music currently produced?',
    NULL,
    'It can be difficult for many classical music fans to appreciate.',
    'It can be seen as an indicator of refinement on classical music.',
    'It caters to society''s taste in music in a more subtle way than classical music.',
    'It contains elements similar to those in some masterpieces of classical music.',
    'D',
    7,
    NULL,
    406
),
(
    @exam_id,
    'reading_c',
    53,
    'single_choice',
    'Why does the author mention the invention of the rock opera?',
    NULL,
    'To illustrate how to tell a story using music.',
    'To present the simplest definition of opera.',
    'To show the relevance of opera and classical music.',
    'To justify the necessity of using orchestras in opera.',
    'C',
    7,
    NULL,
    407
),
(
    @exam_id,
    'reading_c',
    54,
    'single_choice',
    'Why are classical music pieces still used as background music in modern movies?',
    NULL,
    'There are few types of music for movie producers to choose from.',
    'They are considered to be the most expressive type of music.',
    'They are well received by movie fans from all over the world.',
    'They are essential for movies to become the world''s greatest hits.',
    'B',
    7,
    NULL,
    408
),
(
    @exam_id,
    'reading_c',
    55,
    'single_choice',
    'What do we learn about our modern music?',
    NULL,
    'It could not have come into being without classical music and opera as its foundation.',
    'It cannot outcompete classical music and opera in its impact on our current society.',
    'It will not enjoy as much popularity as classical music and opera among music fans.',
    'It might not be able to rival classical music and opera in importance for centuries to come.',
    'A',
    7,
    NULL,
    409
);

-- ============================================================
-- Step 7: Part IV Translation（翻译题，第56题）
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
    '近年来，中国东北地区正在大力开发冰雪资源。例如，哈尔滨利用丰富的冰雪资源打造了极具地方特色的“冰雪大世界”，让游客在欣赏冰雪之美的同时也能体验当地独特的民俗文化。如今，曾令人畏惧的冰天雪地正吸引着四面八方的游客，成为深受欢迎的旅游胜地。冰雪旅游业正为当地的经济发展做出越来越大的贡献。',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    500
);

-- ============================================================
-- 导入统计：
--   writing     : 1题
--   listening   : 25题
--   reading_a   : 10题
--   reading_b   : 10题
--   reading_c   : 10题
--   translation : 1题
--   合计        : 57题
--
-- 注意：
--   1. 第25题在用户提供的答案串中未明确给出，因此上一段 SQL 中 correct_answer 保持为 NULL。
--   2. 如需补全第25题答案，可后续执行：
--      UPDATE `question`
--      SET `correct_answer` = '答案字母'
--      WHERE `exam_id` = @exam_id AND `question_no` = 25 AND `part` = 'listening';
-- ============================================================
