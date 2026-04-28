-- ============================================================
-- 2025年12月大学英语四级真题第3套 种子数据
-- 生成时间：2026-04-27
-- 包含：Writing(1题) + Listening(25题，使用第2套听力题)
--      + Reading_A(10题) + Reading_B(10题)
--      + Reading_C(10题) + Translation(1题)
-- 合计：57题
--
-- 说明：
-- 第3套PDF标注：由于多题多卷，官方第三套真题的听力试题与第二套真题一致，
-- 只是选项顺序不同，因此本套试卷不再提供听力部分。
-- 本SQL按用户要求：听力题使用第2套听力题。
-- ============================================================

SET NAMES utf8mb4;
USE cet4_platform;

-- ============================================================
-- Step 1: 插入 exam 表
-- ============================================================
INSERT INTO `exam` (`title`, `year`, `month`, `set_no`, `duration`, `total_score`, `status`)
VALUES ('2025年12月大学英语四级真题第3套', 2025, 12, 3, 130, 710, 1);

SET @exam_id = LAST_INSERT_ID();

SET @audio_url = 'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/12/set3/2025%E5%B9%B412%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B%E7%AC%AC2%E5%A5%97.mp3';

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
    'Directions: Suppose your university is organizing a forum on how students can make the best use of on-campus resources for academic development. You are now to write an essay to express your view. You will have 30 minutes to write the essay. You should write at least 120 words but no more than 180 words.',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    1
);

-- ============================================================
-- Step 3: Part II Listening Comprehension 听力题
-- 使用2025年12月第2套听力题
-- 第1-25题
-- 答案：1-A 2-C 3-B 4-C 5-B 6-D 7-A 8-B 9-A 10-B
--      11-A 12-C 13-B 14-C 15-D 16-A 17-C 18-B
--      19-D 20-C 21-B 22-D 23-D 24-B 25-A
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
    'It has gone up sharply.',
    'It has been fluctuating.',
    'It has risen because of bird flu.',
    'It has been consumers'' concern.',
    'A',
    7,
    @audio_url,
    100
),
(
    @exam_id,
    'listening',
    2,
    'single_choice',
    'Questions 1 and 2 are based on the news report you have just heard.',
    NULL,
    'They don''t want to abandon their eggs.',
    'They don''t know they will be heavily fined.',
    'They don''t know they are forbidden to bring eggs.',
    'They don''t declare their eggs during the inspection.',
    'C',
    7,
    @audio_url,
    101
),
(
    @exam_id,
    'listening',
    3,
    'single_choice',
    'Questions 3 and 4 are based on the news report you have just heard.',
    NULL,
    'It is no longer critical of younger customers.',
    'It has banned kids under 10 from dining there.',
    'It is no longer as noisy and crowded as before.',
    'It has implemented a decision to expand business.',
    'B',
    7,
    @audio_url,
    102
),
(
    @exam_id,
    'listening',
    4,
    'single_choice',
    'Questions 3 and 4 are based on the news report you have just heard.',
    NULL,
    'It is fully aware of frequent customers'' feelings.',
    'It caters to the tastes of different customers.',
    'It is entitled to adopt any rules it wants.',
    'It should announce its decisions online.',
    'C',
    7,
    @audio_url,
    103
),
(
    @exam_id,
    'listening',
    5,
    'single_choice',
    'Questions 5 to 7 are based on the news report you have just heard.',
    NULL,
    'A missing pet.',
    'A grown-up snake.',
    'A huge animal skin.',
    'A snake specialist.',
    'B',
    7,
    @audio_url,
    104
),
(
    @exam_id,
    'listening',
    6,
    'single_choice',
    'Questions 5 to 7 are based on the news report you have just heard.',
    NULL,
    'In a government office.',
    'In a deserted house.',
    'At a local zoo.',
    'At a construction site.',
    'D',
    7,
    @audio_url,
    105
),
(
    @exam_id,
    'listening',
    7,
    'single_choice',
    'Questions 5 to 7 are based on the news report you have just heard.',
    NULL,
    'Figuring out where it came from.',
    'Curing it of any possible diseases.',
    'Protecting its babies against harm.',
    'Determining how to catch it safely.',
    'A',
    7,
    @audio_url,
    106
),
(
    @exam_id,
    'listening',
    8,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'The man doesn''t agree Hannah is poor.',
    'The man doesn''t believe what she says.',
    'The man doesn''t think she can be a millionaire.',
    'The man doesn''t consider her to be trustworthy.',
    'B',
    7,
    @audio_url,
    107
),
(
    @exam_id,
    'listening',
    9,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'She no longer has any money left.',
    'She has been betrayed by her family.',
    'She can no longer hold on to her job.',
    'She has been robbed of 5 million Euros.',
    'A',
    7,
    @audio_url,
    108
),
(
    @exam_id,
    'listening',
    10,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'Fortune.',
    'Family.',
    'Harmony.',
    'Happiness.',
    'B',
    7,
    @audio_url,
    109
),
(
    @exam_id,
    'listening',
    11,
    'single_choice',
    'Questions 8 to 11 are based on the conversation you have just heard.',
    NULL,
    'Divorce her.',
    'Leave home.',
    'Buy her a more expensive model.',
    'Let the best thing happen to them.',
    'A',
    7,
    @audio_url,
    110
),
(
    @exam_id,
    'listening',
    12,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'He is not outstanding in Science and Math.',
    'He does not have a strong academic record.',
    'He is not yet mature enough to live on his own.',
    'He does not like Westwood Elementary School.',
    'C',
    7,
    @audio_url,
    111
),
(
    @exam_id,
    'listening',
    13,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'It is too far away.',
    'It is newly opened.',
    'It lacks outdoor sports facilities.',
    'It has too few first-class teachers.',
    'B',
    7,
    @audio_url,
    112
),
(
    @exam_id,
    'listening',
    14,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'It has a beautiful campus.',
    'It is within walking distance.',
    'It has a wonderful arts program.',
    'It is helpful to Jake''s breathing problems.',
    'C',
    7,
    @audio_url,
    113
),
(
    @exam_id,
    'listening',
    15,
    'single_choice',
    'Questions 12 to 15 are based on the conversation you have just heard.',
    NULL,
    'Asking Jake which school he himself prefers to enroll in.',
    'Thinking twice about what is best for Jake''s education next year.',
    'Consulting her mother about which school Jake is to attend.',
    'Sending Jake to the school near the home of the man''s mother.',
    'D',
    7,
    @audio_url,
    114
),
(
    @exam_id,
    'listening',
    16,
    'single_choice',
    'Questions 16 to 18 are based on the passage you have just heard.',
    NULL,
    'It is time consuming.',
    'It is unfit for crucial issues.',
    'It relies too much on solid data.',
    'It dulls a leader''s sense of urgency.',
    'A',
    7,
    @audio_url,
    115
),
(
    @exam_id,
    'listening',
    17,
    'single_choice',
    'Questions 16 to 18 are based on the passage you have just heard.',
    NULL,
    'Depend on digital technology.',
    'Make assumptions and guesses.',
    'Ignore others'' thoughts and ideas.',
    'Lay emphasis on thinking flexibly.',
    'C',
    7,
    @audio_url,
    116
),
(
    @exam_id,
    'listening',
    18,
    'single_choice',
    'Questions 16 to 18 are based on the passage you have just heard.',
    NULL,
    'Maximizing the advantage of available resources.',
    'Minimizing the possibility of a wrong decision.',
    'Discovering new potential markets.',
    'Perfecting promotional strategies.',
    'B',
    7,
    @audio_url,
    117
),
(
    @exam_id,
    'listening',
    19,
    'single_choice',
    'Questions 19 to 21 are based on the passage you have just heard.',
    NULL,
    'She is one of the world''s best-known pianists.',
    'She celebrated her 110th birthday this April.',
    'She moved to the U.S. at a young age.',
    'She is the world''s oldest individual.',
    'D',
    7,
    @audio_url,
    118
),
(
    @exam_id,
    'listening',
    20,
    'single_choice',
    'Questions 19 to 21 are based on the passage you have just heard.',
    NULL,
    'Being always active on social media.',
    'Doing regular and vigorous exercise.',
    'Playing the piano from a young age.',
    'Following a specific diet every day.',
    'C',
    7,
    @audio_url,
    119
),
(
    @exam_id,
    'listening',
    21,
    'single_choice',
    'Questions 19 to 21 are based on the passage you have just heard.',
    NULL,
    'Eating as little as one can possibly manage.',
    'Having the ability to forget things selectively.',
    'Figuring out the positive properties of each food item.',
    'Knowing how to remember major events in one''s life.',
    'B',
    7,
    @audio_url,
    120
),
(
    @exam_id,
    'listening',
    22,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'The ability to learn.',
    'The first day of school.',
    'How teachers perceive them.',
    'Where they sit in the classroom.',
    'D',
    7,
    @audio_url,
    121
),
(
    @exam_id,
    'listening',
    23,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'They often received close attention from the instructors.',
    'They obtained the highest grade average in their class.',
    'They actually wanted a clear vision of the blackboard.',
    'They scored higher than students sitting behind them.',
    'D',
    7,
    @audio_url,
    122
),
(
    @exam_id,
    'listening',
    24,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'A higher grade average among all students of a class.',
    'A better connection between instructors and students.',
    'A stronger support for a student-centered teaching approach.',
    'A more favorable atmosphere for effective classroom learning.',
    'B',
    7,
    @audio_url,
    123
),
(
    @exam_id,
    'listening',
    25,
    'single_choice',
    'Questions 22 to 25 are based on the passage you have just heard.',
    NULL,
    'They may experience some unwanted stress.',
    'They may try hard to show their preparedness.',
    'They may receive extra attention from the instructor.',
    'They may feel helpless when called on by the instructor.',
    'A',
    7,
    @audio_url,
    124
);

-- ============================================================
-- Step 4: Part III Reading Comprehension Section A 选词填空
-- 第26-35题
-- 词库：
-- A) concerns      B) expansion     C) forth       D) geography
-- E) importance    F) imposed       G) inspired    H) national
-- I) partners      J) potential     K) pursues     L) rescues
-- M) rest          N) strengthened  O) together
--
-- 答案：26-M 27-G 28-H 29-E 30-N 31-O 32-A 33-I 34-D 35-K
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
    '{"article": "Earth Day is an annual celebration that honors the achievements of the environmental movement and raises awareness of the need to protect Earth''s natural resources for future generations. Earth Day is celebrated on April 22 in the United States and on either April 22 or the day the spring equinox occurs throughout the {26} of the world.

Environmental activism during the 1960s {27} Wisconsin Senator Gaylord Nelson to create a {28} celebration uniting the environmental movement. With the help of Denis Hayes, a graduate student at Harvard University, Nelson organized the first Earth Day on April 22, 1970, educating participants in the {29} of environmental protection. Attended by 20 million people across the United States, the event {30} support for legislation such as the Clean Air Act and the Endangered Species Act.

In 1990, Hayes organized a global Earth Day, with more than 200 million participants in 140 countries. Earth Day now brings {31} citizens and activists from around the world to raise awareness and take action regarding such environmental {32} as global warming and renewable energy.

Today, the Earth Day Network, which rallies more than 20,000 {33} and organizations in 190 countries, supports the Earth Day mission year-round. This mission is founded on the proposition that all people, regardless of race, gender, income, or {34}, have a moral right to a healthy, sustainable environment. The Earth Day Network {35} this mission through education, public policy, and activism campaigns.", "word_bank": ["concerns", "expansion", "forth", "geography", "importance", "imposed", "inspired", "national", "partners", "potential", "pursues", "rescues", "rest", "strengthened", "together"]}',
    NULL, NULL, NULL, NULL,
    'rest',
    7,
    NULL,
    200
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'Environmental activism during the 1960s {27} Wisconsin Senator Gaylord Nelson to create a national celebration uniting the environmental movement.',
    NULL,
    NULL, NULL, NULL, NULL,
    'inspired',
    7,
    NULL,
    201
),
(
    @exam_id,
    'reading_a',
    28,
    'blank_filling',
    'Wisconsin Senator Gaylord Nelson created a {28} celebration uniting the environmental movement.',
    NULL,
    NULL, NULL, NULL, NULL,
    'national',
    7,
    NULL,
    202
),
(
    @exam_id,
    'reading_a',
    29,
    'blank_filling',
    'Nelson organized the first Earth Day on April 22, 1970, educating participants in the {29} of environmental protection.',
    NULL,
    NULL, NULL, NULL, NULL,
    'importance',
    7,
    NULL,
    203
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'Attended by 20 million people across the United States, the event {30} support for legislation such as the Clean Air Act and the Endangered Species Act.',
    NULL,
    NULL, NULL, NULL, NULL,
    'strengthened',
    7,
    NULL,
    204
),
(
    @exam_id,
    'reading_a',
    31,
    'blank_filling',
    'Earth Day now brings {31} citizens and activists from around the world to raise awareness and take action.',
    NULL,
    NULL, NULL, NULL, NULL,
    'together',
    7,
    NULL,
    205
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'Earth Day now brings together citizens and activists from around the world to raise awareness and take action regarding such environmental {32} as global warming and renewable energy.',
    NULL,
    NULL, NULL, NULL, NULL,
    'concerns',
    7,
    NULL,
    206
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'Today, the Earth Day Network, which rallies more than 20,000 {33} and organizations in 190 countries, supports the Earth Day mission year-round.',
    NULL,
    NULL, NULL, NULL, NULL,
    'partners',
    7,
    NULL,
    207
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'This mission is founded on the proposition that all people, regardless of race, gender, income, or {34}, have a moral right to a healthy, sustainable environment.',
    NULL,
    NULL, NULL, NULL, NULL,
    'geography',
    7,
    NULL,
    208
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'The Earth Day Network {35} this mission through education, public policy, and activism campaigns.',
    NULL,
    NULL, NULL, NULL, NULL,
    'pursues',
    7,
    NULL,
    209
);
-- ============================================================
-- Step 5: Part III Reading Comprehension Section B 段落匹配
-- 第36-45题
-- 答案：36-D 37-A 38-J 39-F 40-C 41-I 42-G 43-B 44-L 45-H
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
    'Hiring managers believe unemployed workers over 45 lack good skills and are less adaptable.',
    'Looking for a job after 45

A) Ageism and long-term unemployment are most damaging for those in the second half of their careers. Changing careers is hard. Getting back into work after you''ve been laid off is even harder. Those over 45 make up the bulk of the long-term unemployed, in America and elsewhere. Hiring managers admit they are reluctant to hire those over 40 or 45, arguing they probably won''t be a good "fit," their experience won''t be relevant to the workplace, and they''ll be unable or unwilling to learn new skills.

B) But the one thing that can really make a difference? More education and training. These are the results from a new study by Generation, a nonprofit founded by former McKinsey consultants. They''ve just published a global survey on midcareer employment, based on surveys of over 5,000 workers and managers in seven countries.

C) “Older midcareer workers...make up the bulk of the long-term unemployed in many countries,” Generation''s analysts write in their report. Those over 45 comprise over 40% of the long-term unemployed, for example. And if you''re out of work past the age of 45, there''s nearly a two in three chance you''ll be out of work for over a year, they find. “Midcareer individuals are finding it harder to get jobs,” they write. “People age 45+ face persistent and rising pressure in the global job market. They are unemployed for much longer than the average, and their age is indeed one of the greatest barriers to their finding a job.”

D) A substantial part of this, they report, is “widespread ageism” on the part of hiring managers. Although such managers admit that post-45 hires turn out on average to be just as good as or better than younger workers, they still don''t want to hire them. “Hiring managers have a strong perception bias against 45+ job candidates—they believe that members of this age group have poor skills and low adaptability,” Generation''s analysts report.

E) The survey results are remarkable. Hiring managers are three times as likely to rate job applicants age 35-44 as a better “fit” than those over 45. They rate the post-45 job seekers lower on average on all three measures—even experience—than those ages 18 to 34. This is true even though nearly nine managers in 10 also said their post-45 workers were as good as or better than younger employees in the same jobs.

F) Their biggest fears about hiring those over 45? Managers said they worry that older hires will be reluctant to try new technologies, and will be unable to learn new skills. Besides, the majority of hiring managers are under 45—and seem reluctant to hire people older than themselves.

G) But here''s the good news. Older workers who''ve actively engaged in more education and training relevant to their jobs turn this pretty much on its head. Three-quarters of hiring managers said they''d be more likely to hire an over-45 who had relevant education, training or credentials. Among those over 45 who''d successfully switched careers, 74% said training helped them get their new job.

H) “Midcareer switchers overwhelmingly say that training enabled them to shift to a new career path,” the analysts write. And when they asked over-45 candidates about their attitudes, they found that “those who are excited by training are unemployed for less time, receive more job offers, and are more satisfied by the job offers they receive.”

I) Hiring managers said training was three times more likely to get them to hire applicants over age 45 than, say, government subsidies. What training are we talking about? Obviously it depends on the job. And, yes, managers are most likely to be impressed by industry qualifications you get in school. These things cost money, and time. But these aren''t the only things helpful. Those who had successfully changed careers after 45 told Generation that education and training had been a big help—and that included in-person, on-the-job training, “informal learning,” and online courses—with or without certification.

J) If they think we''re too old to learn new skills after we''re 45, just learning some new skills may have an effect on its own. There''s a downside to this. The people least interested in retraining are more likely to come from historically disadvantaged communities, more likely to have low incomes, and are more likely to have the least schooling after getting their high-school diploma or earlier. On average, post-45 job switchers with higher incomes participate in 2.5 training programs each. Those with lower incomes: 0.9 programs on average.

K) Many years ago, I wrote about a study which found that employers are much more likely to hire a college graduate who has some work experience in the industry than a college graduate who took the “right” degree. A bank is more likely to hire a literature graduate who spent their summers working in their local bank than a finance or economics graduate who spent their summers surfing or traveling around Italy. They''ve learned through long experience. The person who worked in the bank is more likely ready, willing and able to be part of the team and do the job from day 1.

L) We can rail against “ageism” all we like. It gets us nowhere. And it''s easy to forget that employers, like everyone else, are under time pressure and are just trying to solve problems. Any and all “training,” including inexpensive and informal training, is going to help resolve their worries about hiring someone over 45. And it has never been easier or cheaper to gain instruction in new skills, thanks to the internet. Online schools like Udemy and Lynda.com offer sweet deals at sign-up. And courses on YouTube are free.

M) Bottom line? Yes, it really can be difficult getting a new job after age 45, let alone changing careers. One of the best things we can do to help ourselves is to go online and learn new, relevant skills. Sadly, the people who most need the help are least likely to take it—which raises a challenge for society as a whole. Not only do we not want to see lives go to waste, but we all benefit if more people are working and fewer are unemployed.',
    NULL, NULL, NULL, NULL,
    'D',
    7,
    NULL,
    300
),
(
    @exam_id,
    'reading_b',
    37,
    'matching',
    'Switching to a new career is difficult and getting reemployed after a layoff is even tougher.',
    NULL,
    NULL, NULL, NULL, NULL,
    'A',
    7,
    NULL,
    301
),
(
    @exam_id,
    'reading_b',
    38,
    'matching',
    'People from poor neighborhoods tend to have the least interest in retraining.',
    NULL,
    NULL, NULL, NULL, NULL,
    'J',
    7,
    NULL,
    302
),
(
    @exam_id,
    'reading_b',
    39,
    'matching',
    'Hiring managers who are not yet 45 years old seem unwilling to hire people their senior.',
    NULL,
    NULL, NULL, NULL, NULL,
    'F',
    7,
    NULL,
    303
),
(
    @exam_id,
    'reading_b',
    40,
    'matching',
    'Some analysts find age 45+ jobless workers are most likely to be unemployed for more than a year.',
    NULL,
    NULL, NULL, NULL, NULL,
    'C',
    7,
    NULL,
    304
),
(
    @exam_id,
    'reading_b',
    41,
    'matching',
    'People who had succeeded in career change after 45 told a nonprofit organization they owed a great deal to the education and training they had received.',
    NULL,
    NULL, NULL, NULL, NULL,
    'I',
    7,
    NULL,
    305
),
(
    @exam_id,
    'reading_b',
    42,
    'matching',
    'Older workers who actively pursue more education and training have a good chance of being hired.',
    NULL,
    NULL, NULL, NULL, NULL,
    'G',
    7,
    NULL,
    306
),
(
    @exam_id,
    'reading_b',
    43,
    'matching',
    'A new study finds that more education and training helps midcareer individuals find a new job.',
    NULL,
    NULL, NULL, NULL, NULL,
    'B',
    7,
    NULL,
    307
),
(
    @exam_id,
    'reading_b',
    44,
    'matching',
    'Owing to the internet, it is now more convenient than ever to receive training in new skills.',
    NULL,
    NULL, NULL, NULL, NULL,
    'L',
    7,
    NULL,
    308
),
(
    @exam_id,
    'reading_b',
    45,
    'matching',
    'People over 45 stimulated by training suffer shorter periods of unemployment, get more job offers and have greater satisfaction in them.',
    NULL,
    NULL, NULL, NULL, NULL,
    'H',
    7,
    NULL,
    309
);

-- ============================================================
-- Step 6: Part III Reading Comprehension Section C 仔细阅读
-- 第46-55题
-- 答案：46-A 47-B 48-A 49-C 50-D / 51-A 52-D 53-C 54-B 55-D
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
    'What do we learn about New York''s Eleven Madison Park?',
    'New York''s Eleven Madison Park has become the first vegan restaurant to be awarded three Michelin stars.

The fine dining establishment received its first three-star Michelin rating in 2011 when the menu was famed for its fancy animal-based dishes.

However, last year, the restaurant''s co-owner and famous chef, Daniel Humm, made the bold decision to remove meat from the menu, citing our unsustainable food system. While cow milk is still served for tea and coffee, the menu is almost 100 percent vegan.

At the time, Humm acknowledged the move was risky, admitting that “it wasn''t clear if guests would come”, but called the gamble “a risk worth taking.”

“In view of the climate crisis, I didn''t want to open the same restaurant,” Humm told the Financial Times in an interview. “If we can show the possibilities of eating plant-based food in this setting, it can open a lot of doors” for others to follow.

Now, this impressive new accomplishment validates Eleven Madison Park''s decision to take meat off the menu and embrace plant-based foods, with Michelin''s 2022 New York guide branding it a “bold vision of luxury dining”.

“We took the jump to transform Eleven Madison Park into a plant-based fine dining restaurant knowing in our hearts this is what we believed in,” stated Humm on Instagram. “Last night, we were honored to be awarded three Michelin stars for the 11th year in a row. I am so grateful to the team members who contributed through its nearly 25-year history. We are also grateful to our guests and partners who believed in our vision and encouraged us to push harder.”

Three Michelin stars is the highest award, given to chefs who are at the peak of their profession. “Their cooking is elevated to an art form and some of their dishes are destined to become classics,” reads Michelin''s website, in a clear nod to plant-based foods'' growing significance in the culinary world.

“I think luxury companies have a real role to play and a responsibility,” says Humm. “The more creative we are, the more beautiful and delicious our future will be.”',
    'It is the first vegan restaurant to receive the highest Michelin rating.',
    'It is the first restaurant in the city to remove meat from its menu.',
    'It was famed throughout the U.S. for its fancy regional dishes.',
    'It was established as a three-star Michelin restaurant in 2011.',
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
    'Why did Daniel Humm decide to remove meat from the menu of his restaurant?',
    NULL,
    'To encourage more customers to be vegan.',
    'To contribute to a sustainable food system.',
    'To show the appeal of a plant-based menu.',
    'To strive for the three-star Michelin rating.',
    'B',
    7,
    NULL,
    401
),
(
    @exam_id,
    'reading_c',
    48,
    'single_choice',
    'What did Daniel Humm think of his move to a meat-free menu?',
    NULL,
    'It was a worthwhile effort even though he was unsure of its success.',
    'It would set a model for many more restaurants to follow.',
    'It was a mad gamble few chefs in the fine dining world would risk taking.',
    'It would prove a right step to take in today''s catering business.',
    'A',
    7,
    NULL,
    402
),
(
    @exam_id,
    'reading_c',
    49,
    'single_choice',
    'What does Michelin''s 2022 New York guide say about Eleven Madison Park''s decision?',
    NULL,
    'It elevates the restaurant''s cooking to an art form.',
    'It proves the validity of ratings awarded by Michelin.',
    'It shows a daring foresight regarding future fine dining.',
    'It is an effort to transform the restaurant into a luxury one.',
    'C',
    7,
    NULL,
    403
),
(
    @exam_id,
    'reading_c',
    50,
    'single_choice',
    'What does the awarding of three Michelin stars to Eleven Madison Park indicate?',
    NULL,
    'An optimistic vision of vegan foods becoming mainstream.',
    'A greater responsibility for the culinary world to undertake.',
    'A strong incentive for more restaurants to offer healthier foods to their customers.',
    'An explicit recognition of the rising importance of restaurants serving vegan foods.',
    'D',
    7,
    NULL,
    404
),
(
    @exam_id,
    'reading_c',
    51,
    'single_choice',
    'What does the passage say is of importance regarding genetic tests?',
    'With genetic testing becoming increasingly popular, many people are left wondering exactly how accurate it is. Whether you are taking a DNA test to build your extended DNA family tree, or want precise information on inborn health conditions, it is important to understand how accurate genetic tests are, and what information we can rely upon.

How accurate DNA tests are relies greatly upon the kind of test being taken, on the specific question you ask, and on how complex the genetics behind a trait is. For example, tests for traits that depend on a single gene provide much more reliable results, because you can see whether a disease-causing trait is present.

Ancestry tests claim to reveal our genetic identities. But saying you are 30 percent East Asian or American hardly reflects your real ancestry.

What about using DNA tests to discover distant family members? There are tools to compare one''s DNA with others'' to find distant relatives based on their genetic identification. These kinds of applications are generally accurate. It''s relatively easy to tell whether two DNA samples belong to close relatives. With distant relatives, results become hazier.

Genetic health tests claim to be able to detect certain hereditary diseases, or other health conditions. While certain rare diseases can be easily identified, most potential health conditions cannot be identified by genetic testing alone. The large majority of our traits and diseases also depend upon non-genetic factors, such as lifestyle, the environment, and many others.

Genetic tests for multi-factorial traits are often very tricky to interpret. Height, for example, depends on hundreds of genes, each contributing a little to the outcome, together with a bunch of environmental factors. A test can look at many genes at once, but it''s difficult to predict how they will play together. Then you should also account for non-genetic factors that are not written in the DNA.

Tests that offer to find your perfect romantic match and those claiming to predict personality or talents based on your DNA are pure nonsense. At the moment, the scientific bases for these applications are non-existent or incredibly weak.',
    'Knowing their accuracy.',
    'Evaluating their applicability.',
    'Utilizing the information they provide.',
    'Weighing the consequences they have.',
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
    'What kind of genetic tests tend to be comparatively reliable?',
    NULL,
    'Those complex enough to reveal the genetics behind a trait.',
    'Those looking for traits responsible for certain diseases.',
    'Those focusing on the specific questions being asked.',
    'Those looking for traits determined by a single gene.',
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
    'What do we learn about genetic health tests from the passage?',
    NULL,
    'They are unable to identify certain hereditary diseases by themselves.',
    'They are generally unable to separate genetic and non-genetic factors.',
    'They cannot independently identify the majority of potential diseases.',
    'They cannot tell apart the impact of lifestyle and that of the environment.',
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
    'What makes genetic tests for multi-factorial traits tricky to interpret?',
    NULL,
    'The challenge in determining the role of each individual gene.',
    'The difficulty of foretelling how the various genes will interact.',
    'The difficulty of telling genetic factors from environmental ones.',
    'The enormous work to identify the hundreds of genes involved.',
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
    'What does the passage say about DNA tests to predict personality or talents?',
    NULL,
    'They are solid scientific bases for application.',
    'They are helpful in finding a romantic match.',
    'They do not look promising at the moment.',
    'They do not make any sense at present.',
    'D',
    7,
    NULL,
    409
);

-- ============================================================
-- Step 7: Part IV Translation 翻译题
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
    '中国政府十分重视绿色经济的发展。通过加强森林资源保护、加大污染治理力度等一系列措施，许多地区的生态环境得到了显著改善。绿水青山(lucid waters and lush mountains)促进了当地的旅游、健康等产业的发展，创造了可观的经济效益。如今，生态环境与人类社会和谐共存的观念在中国已深入人心。绿色经济的推进不仅能为中国可持续发展做出贡献，也为全球环境保护提供了宝贵经验。',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    500
);

-- ============================================================
-- 插入统计：
--   writing     : 1题，题号1
--   listening   : 25题，题号1-25，使用第2套听力题
--   reading_a   : 10题，题号26-35
--   reading_b   : 10题，题号36-45
--   reading_c   : 10题，题号46-55
--   translation : 1题，题号56
--   合计        : 57题
-- ============================================================
