-- ============================================================
-- 2025年6月大学英语四级真题第3套 种子数据
-- 生成时间：2026-04-27
-- 包含：Writing(1题) + Reading_A(10题) + Reading_B(10题)
--       + Reading_C(10题) + Translation(1题)
-- 说明：PDF 中注明第三套听力与第二套一致但未提供听力题目，因此本文件不插入听力题。
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
    'Directions: Suppose your university is seeking students'' opinions on whether university canteens should be open to the public. You are now to write an essay to express your view. You will have 30 minutes for the task. You should write at least 120 words but no more than 180 words.',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    1
);

-- ============================================================
-- Step 3: Part III Reading Comprehension Section A（第26~35题，选词填空）
-- 词库：
-- A) compare B) contradicts C) conventional D) debate E) disruptions
-- F) drastically G) favorably H) guarantee I) introduction J) modifications
-- K) poses L) psychological M) react N) reverses O) seemingly
--
-- 答案：
-- 26-D(debate) 27-M(react) 28-G(favorably) 29-N(reverses)
-- 30-O(seemingly) 31-A(compare) 32-K(poses) 33-I(introduction)
-- 34-L(psychological) 35-E(disruptions)
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
    '{\"article\": \"Over the coming decades, millions of jobs will be threatened by robotics and artificial intelligence. Despite intensive academic {26} on these developments, there has been little study on how workers {27} to being replaced through technology.\\n\\nTo find out, business researchers at TUM and Erasmus University Rotterdam conducted 11 studies and surveys with over 2,000 persons from several countries.\\n\\nThe findings show: in principle, most people view it more {28} when workers are replaced by other people than by robots or intelligent software. This preference {29}, however, when it refers to people’s own jobs. When that is the case, the majority of workers find it less upsetting to see their own jobs go to robots than to other employees. In the long term, however, the same people see machines as more threatening to their future role in the workforce. These effects can also be observed among people who have recently become unemployed.\\n\\nThe researchers were able to identify the causes behind these {30} paradoxica results, too: People tend to {31} themselves less with machines than with other people. Consequently, being replaced by a robot or software {32} less of a threat to their feeling of self-worth. This reduced self-threat could even be observed when participants assumed that they were being replaced by other employees who relied on technological abilities such as artificial intelligence in their work.\\n\\n\\\"Even when unemployment results from the {33} of new technologies, people still judge it in a social context,\\\" says Christoph Fuchs, one of the authors of the study. \\\"It is important to understand these {34} effects when trying to manage the massive changes in the working world to minimize {35} in society.\\\"\", \"word_bank\": [\"compare\", \"contradicts\", \"conventional\", \"debate\", \"disruptions\", \"drastically\", \"favorably\", \"guarantee\", \"introduction\", \"modifications\", \"poses\", \"psychological\", \"react\", \"reverses\", \"seemingly\"]}',
    NULL, NULL, NULL, NULL,
    'debate',
    7,
    NULL,
    13
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'there has been little study on how workers {27} to being replaced through technology.',
    NULL,
    NULL, NULL, NULL, NULL,
    'react',
    7,
    NULL,
    14
),
(
    @exam_id,
    'reading_a',
    28,
    'blank_filling',
    'most people view it more {28} when workers are replaced by other people than by robots or intelligent software.',
    NULL,
    NULL, NULL, NULL, NULL,
    'favorably',
    7,
    NULL,
    15
),
(
    @exam_id,
    'reading_a',
    29,
    'blank_filling',
    'This preference {29}, however, when it refers to people’s own jobs.',
    NULL,
    NULL, NULL, NULL, NULL,
    'reverses',
    7,
    NULL,
    16
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'The researchers were able to identify the causes behind these {30} paradoxica results, too.',
    NULL,
    NULL, NULL, NULL, NULL,
    'seemingly',
    7,
    NULL,
    17
),
(
    @exam_id,
    'reading_a',
    31,
    'blank_filling',
    'People tend to {31} themselves less with machines than with other people.',
    NULL,
    NULL, NULL, NULL, NULL,
    'compare',
    7,
    NULL,
    18
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'Consequently, being replaced by a robot or software {32} less of a threat to their feeling of self-worth.',
    NULL,
    NULL, NULL, NULL, NULL,
    'poses',
    7,
    NULL,
    19
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'Even when unemployment results from the {33} of new technologies, people still judge it in a social context.',
    NULL,
    NULL, NULL, NULL, NULL,
    'introduction',
    7,
    NULL,
    20
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'It is important to understand these {34} effects when trying to manage the massive changes in the working world.',
    NULL,
    NULL, NULL, NULL, NULL,
    'psychological',
    7,
    NULL,
    21
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'It is important to understand these psychological effects when trying to manage the massive changes in the working world to minimize {35} in society.',
    NULL,
    NULL, NULL, NULL, NULL,
    'disruptions',
    7,
    NULL,
    22
);

-- ============================================================
-- Step 4: Part III Reading Comprehension Section B（第36~45题，段落匹配）
-- 答案：
-- 36-G 37-C 38-I 39-A 40-E 41-B 42-J 43-F 44-D 45-H
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
    'There is opposition to the practice of giving children assignments to take home before extreme weather forces a school closure.',
    'No escape as “snow day” becomes “e-learning day”

A) Certain institutions, such as schools are likely to close when bad weather, such as snow, flooding, or extreme heat or cold, causes travel difficulties, power outages or otherwise endangers public safety. When snowy weather arrives in the US, it means the chance of school children benefiting from the long-standing tradition of the “snow day”, when schools are forced to close and students get an unexpected day off.

B) The criterion for a snow day is primarily the inability of school buses to operate safely on their routes and danger to children who walk to school. Often, the school remains officially open even though buses do not run and classes are canceled. Severe weather that causes cancellation or delay is more likely in regions that are less able to handle the situation. Snow days are less common in more northern areas of the United States that are used to heavy winter snowfall because municipalities are well equipped to clear roads and remove snow. In areas less accustomed to snow, even small snowfalls of an inch or two may render roads unsafe.

C) Snow days are a familiar theme in American film and TV shows, with children getting the good news and then running outside for some seasonal snowman-building and snowball throwing, against a background of joyful pop music. But the tradition is now over for pupils in several US states such as South Carolina, Nevada, Georgia and Indiana. This academic year, many school boards have introduced policies which require students to work from home if the school is shut by snow or extreme weather. They are known as “e-learning days”, which certainly sounds less fun than a snow day.

D) Teachers are also losing their snow days and instead will be expected to be on hand to take a virtual register and answer students’ questions online. A pilot programme in a school district in Anderson County, South Carolina, has supplied students with electronic tablets loaded with assignments to complete in the event of a school closure. If it is successful, it could be rolled out across the state.

E) But some parents object to the new policy if the vigorous debate on the Facebook page of Anderson County school district is anything to go by. “When it snows, let the kids enjoy it.” said one commenter. Another said the decision would “ruin school even more”, and someone else called snow days “a fun part of childhood”. But supporters of the policy say it means children will miss fewer days of school. It will also bring to an end a less popular US high school tradition: the “make-up day” which requires students in many states to make up the time lost due to weather by working during school holidays.

F) Students in North Carolina already have several make-up days scheduled because of school closures during Hurricane Florence, which struck in September. Tom Wilson, the superintendent of Anderson County school district said the change away from snow days makes practical and financial sense. He said technology has changed every profession, so it makes sense to use it to “eliminate” make-up days. Adam Baker of the Department of Education in Indiana said e-learning days were proving a “great success”. He said most Indiana schools already use digital devices during lessons, so it was an “easy decision” to extend this to days when schools are closed. He denies the decision is depriving children of the chance to enjoy the snow. “Students are still able to enjoy snow days and outside time,” he said. “Many have PE and science assignments that have them out enjoying the weather.” But local school superintendents in Ohio are resisting proposals to adopt e-learning days. They fear that students without internet access at home will be disadvantaged by the policy, and superintendent Tom Roth is concerned that e-learning days will offer a lower quality of education.

G) There are also so-called “blizzard bags”, with assignments that children take home ahead of an expected snow closure. But Mr. Roth says it is not sufficient as a replacement. “I think we still need the class time to give our kids the education that they deserve.” he said. “You can''t get that with a blizzard bag or doing the work from home like that. It’s not going to be as effective.”

H) There is a long-running debate on whether missing days of school affects attainment. In England. there has been a focus on tackling absenteeism from school. The Department for Education published research in 2016 arguing that missing any days at school could have a negative impact on results. Even a few days lost in a year could be enough to miss out on getting a good exam grade, the DFE’s research concluded. This differed from the findings of a study from Harvard University in the US, which concluded that missing a few occasional days because of the weather did not damage learning.

I) The Harvard study examined seven years of school results data and could not find any impact from snow closures. What caused more disruption was when schools tried to stay open in bad weather even though many staff and pupils were absent. But weather can make a difference to school results, according to another piece of Harvard research published last summer. It''s hot weather that has the negative impact. The results of 10 million school students were examined over 13 years and researchers found a “significant” link between years with extremely hot weather and lower results.

J) It''s obvious that students should go to school every day to get the most out of education. In cases of extreme weather, students don''t always have that option. However, research shows that authorised absences from school such as during extreme weather are less problematic for students than absences that are not authorised. This is because unauthorised absences tend to reflect patterns and behaviours of student disengagement or the possible negative attitudes of parents towards education that students adopt and carry with them through schooling. The level of impact on students’ educational performance is all to do with the length of time that a student is absent from school and how regularly this occurs.',
    NULL, NULL, NULL, NULL,
    'G',
    7,
    NULL,
    23
),
(
    @exam_id,
    'reading_b',
    37,
    'matching',
    'New policies adopted by many US schools require students to do online learning at home in case of a school closure.',
    NULL,
    NULL, NULL, NULL, NULL,
    'C',
    7,
    NULL,
    24
),
(
    @exam_id,
    'reading_b',
    38,
    'matching',
    'According to some research, extreme hot weather negatively affects students’ performance.',
    NULL,
    NULL, NULL, NULL, NULL,
    'I',
    7,
    NULL,
    25
),
(
    @exam_id,
    'reading_b',
    39,
    'matching',
    'There is a time-honoured tradition in the US for school kids to stay at home on “snow days”.',
    NULL,
    NULL, NULL, NULL, NULL,
    'A',
    7,
    NULL,
    26
),
(
    @exam_id,
    'reading_b',
    40,
    'matching',
    'Debates on social media show some parents are opposed to ending the “snow day” tradition.',
    NULL,
    NULL, NULL, NULL, NULL,
    'E',
    7,
    NULL,
    27
),
(
    @exam_id,
    'reading_b',
    41,
    'matching',
    'In more northern regions of the US, school is less likely to be affected by snowy weather.',
    NULL,
    NULL, NULL, NULL, NULL,
    'B',
    7,
    NULL,
    28
),
(
    @exam_id,
    'reading_b',
    42,
    'matching',
    'Research indicates absences from school with permission do not cause as many problems as those without permission.',
    NULL,
    NULL, NULL, NULL, NULL,
    'J',
    7,
    NULL,
    29
),
(
    @exam_id,
    'reading_b',
    43,
    'matching',
    'There is objection to e-learning days owing to fear that students with no access to the Internet at home will suffer.',
    NULL,
    NULL, NULL, NULL, NULL,
    'F',
    7,
    NULL,
    30
),
(
    @exam_id,
    'reading_b',
    44,
    'matching',
    'In a pilot programme, students are given electronic devices to do assignments when schools are closed.',
    NULL,
    NULL, NULL, NULL, NULL,
    'D',
    7,
    NULL,
    31
),
(
    @exam_id,
    'reading_b',
    45,
    'matching',
    'A long-standing debate is going on over the impact of school absences on students’ academic performance.',
    NULL,
    NULL, NULL, NULL, NULL,
    'H',
    7,
    NULL,
    32
);

-- ============================================================
-- Step 5: Part III Reading Comprehension Section C（第46~55题，仔细阅读）
-- 答案：
-- 46-C 47-A 48-D 49-B 50-D 51-A 52-C 53-A 54-D 55-B
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
    'What does the author think of the book Dress Codes: How the Laws of Fashion Made History?',
    'It may sound surprising, but you don''t have to be interested in fashion, or even in history, to enjoy Dress Codes: How the Laws of Fashion Made History. I happen to be interested in both, and ended up enjoying the book for completely different reasons.

Richard Thompson Ford is a law professor, and you probably won''t forget that for even one page. His carefully reasoned arguments, packed with examples, sound almost like reading a court opinion, only maybe wordier. You will probably never think of fashion as a trifle again.

Ford''s thesis is that the best way to understand what particular fashions meant in any given era is to look at the restrictions placed on them. Through this lens, he shows us that the first laws passed in the 1200s to ensure that only the nobility were allowed to wear certain fabrics, colors and ornaments reflected the rise of the middle class, who were now able to imitate some of these fashions. The status of the upper classes was threatened: fashion was a tool to preserve it.

Ford takes the reader through the evolution of fashion while examining the underlying motivations of status: sex, power, and personality, which, he assumes, influenced all innovations in fashion in the past and which continue to influence us today. His writing is more than a little dense — dense with research, clauses, and precise adjectives and nouns. But there''s also humor and enough interesting episodes to make the writing appealing. No one is spared his sharp analysis: not the easy targets of 19th century women''s crippling fashions nor the modern uniforms of Silicon Valley T-shirts.

But the greatest strength of this book is its intellectual profoundness. Ford asks us to question unconscious beliefs, to realize that we almost never do so, to understand that the simplest choices are charged with meaning, and yet that meaning can and does change all the time. Consider the fact that a 1918 catalog insisted that boys and girls be dressed in the appropriate color. We believe our thinking today is evolved. Ford shows us it’s not.',
    'It is read by people for entirely different reasons.',
    'It is meant for those interested in fashion history.',
    'It makes enjoyable as well as informative reading.',
    'It converts fashion into something for deliberation.',
    'C',
    7,
    NULL,
    33
),
(
    @exam_id,
    'reading_c',
    47,
    'single_choice',
    'How can people best understand a particular fashion in an era, according to Ford?',
    NULL,
    'By examining the restraints imposed on it.',
    'By looking at what the nobility were wearing.',
    'By glancing at its fabrics, colors, and ornaments.',
    'By doing a survey of the upper and middle classes.',
    'A',
    7,
    NULL,
    34
),
(
    @exam_id,
    'reading_c',
    48,
    'single_choice',
    'What was the aim of the first laws passed regarding fashion in the 1200s?',
    NULL,
    'To facilitate the rise of the middle class.',
    'To loosen restrictions on dress codes.',
    'To help initiate some novel fashions.',
    'To preserve the status of the nobles.',
    'D',
    7,
    NULL,
    35
),
(
    @exam_id,
    'reading_c',
    49,
    'single_choice',
    'What does the author think of Ford''s writing?',
    NULL,
    'It uses comparison and contrast in describing fashions of different eras.',
    'It makes heavy reading but is not lacking in humor or appeal.',
    'It is filled with interesting episodes to spare readers intolerable boredom.',
    'It is characteristic of academics in presenting arguments.',
    'B',
    7,
    NULL,
    36
),
(
    @exam_id,
    'reading_c',
    50,
    'single_choice',
    'What does the author say is the greatest strength of Ford''s book?',
    NULL,
    'Plentiful information.',
    'Meaningful choices.',
    'Evolved thinking.',
    'Intellectual depth.',
    'D',
    7,
    NULL,
    37
),
(
    @exam_id,
    'reading_c',
    51,
    'single_choice',
    'What does the author say about the ability to be persuasive in the first paragraph?',
    'The art of persuasion means convincing others to agree with your point of view or to follow your course of action. For some of us, persuasion is an instinctive quality and the power of influencing comes naturally. For the rest of us, persuasion skills can be learned and developed over time.

Employers place a great value on employees with persuasion skills because they can impact several aspects of job performance. Besides, teamwork and leadership rely heavily on the power of persuasion to get things done. Without persuasion skills, employees may not be as committed to or convinced of the importance of an organization''s vision and long-term mission. Effective use of persuasion skills will not only help get your coworkers excited about your ideas, it’ll also help you motivate them to achieve a common goal.

In order to learn the art of persuasion at the workplace, you need to understand how to handle conflicts and reach agreements. Good communication is the first step in effective persuasion, but logic and reasoning are just as important. Before you can get somebody on-board with your goal, you should help them understand why they should pursue it. Using visual aids to back up your ideas can help communicate your ideas better and make compelling arguments so your listeners will come to a logical choice and become fully committed to your ideas and plans.

Successful persuasion skills are based on your ability to have positive interactions and maintain meaningful relationships with people. In order to sustain those relationships, you must be able to work in their best interests as well. Your coworkers are more likely to agree with you when they succeed alongside you. The more they achieve and the greater progress they make, the more they trust your judgement and strength.

We persuade and get persuaded every day — were either convincing or being convinced. A vast majority of people prefer collaboration and teamwork over traditional organizational structures, no one likes to be told what to do or to be pushed around. Therefore, organizations and leaders should adopt powerful persuasion skills to bring about necessary changes.',
    'People may either be born with it or be able to cultivate it.',
    'It proves crucial in making others follow one''s course of action.',
    'It refers to the natural and instinctive power of influencing one’s coworkers.',
    'People may view it as both a means to convince others and an art of communication.',
    'A',
    7,
    NULL,
    38
),
(
    @exam_id,
    'reading_c',
    52,
    'single_choice',
    'Why are persuasion skills greatly valued in the workplace?',
    NULL,
    'They enable employees to be convinced of their long-term gains.',
    'They enable employees to trust their leaders unconditionally.',
    'They help motivate coworkers to strive for a common goal.',
    'They help an organization to broaden its vision effectively.',
    'C',
    7,
    NULL,
    39
),
(
    @exam_id,
    'reading_c',
    53,
    'single_choice',
    'What should people do to learn the art of persuasion at the workplace?',
    NULL,
    'Acquire effective communication skills.',
    'Avoid getting involved in conflicts with others.',
    'Understand the reason for pursuing their goals.',
    'Commit themselves fully to their ideas and plans.',
    'A',
    7,
    NULL,
    40
),
(
    @exam_id,
    'reading_c',
    54,
    'single_choice',
    'When are you more likely to succeed in persuading your coworkers?',
    NULL,
    'When they are convinced you work in their interests while sacrificing your own.',
    'When they become aware of the potential strength of the judgements you make.',
    'When they become aware of the meaningful relationships you keep with them.',
    'When they are convinced they will make achievements together with you.',
    'D',
    7,
    NULL,
    41
),
(
    @exam_id,
    'reading_c',
    55,
    'single_choice',
    'Why are organizations and leaders advised to adopt powerful persuasion skills to bring about necessary changes?',
    NULL,
    'To convince employees of the value of collaboration.',
    'To allow for the preferences of most people of today.',
    'To improve on traditional organizational structures.',
    'To adapt to employees’ ever-changing working styles.',
    'B',
    7,
    NULL,
    42
);

-- ============================================================
-- Step 6: Part IV Translation（翻译题，第56题）
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
    '汉语中的“福”字(the character fu)表示幸福和好运，是中国传统文化中最常用的吉祥(auspicious)符号之一。人们通常将一个大大的福字写在红纸上，寓意期盼家庭社会安定、国家昌盛。春节贴福字是民间由来已久的习俗。为了欢庆春节，家家户户都会将福字贴在门上或墙上，表达对幸福生活的向往、对美好未来的期待。人们有时还将福字倒过来贴，表示幸福已到、好运已到。',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    43
);
