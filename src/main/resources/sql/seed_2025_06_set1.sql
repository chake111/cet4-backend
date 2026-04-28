-- ============================================================
-- 2025年6月大学英语四级真题第1套 种子数据
-- 生成时间：2026-04-28
-- 包含：Writing(1题) + Listening(25题) + Reading_A(10题)
--      + Reading_B(10题) + Reading_C(10题) + Translation(1题)
-- 合计：57题
-- ============================================================

SET NAMES utf8mb4;
USE cet4_platform;

-- ============================================================
-- Step 1: 插入 exam 表
-- ============================================================
INSERT INTO `exam` (`title`, `year`, `month`, `set_no`, `duration`, `total_score`, `status`)
VALUES ('2025年6月大学英语四级真题第1套', 2025, 6, 1, 130, 710, 1);

SET @exam_id = LAST_INSERT_ID();

SET @audio_url = 'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set1/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC1%E5%A5%97.mp3';

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
    'Directions: Suppose your university is seeking students'' opinions on the necessity of making College Chinese a compulsory course. You are now to write an essay to express your view. You will have 30 minutes to write the essay. You should write at least 120 words but no more than 180 words.',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    1
);

-- ============================================================
-- Step 3: Part II Listening Comprehension 听力题
-- 第1-25题
-- 答案：
-- 1-5   A B A D C
-- 6-10  D B A C C
-- 11-15 B D B C D
-- 16-20 B A D C A
-- 21-25 D B C D A
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
    'By slapping some butter on it.',
    'By enhancing its nourishment.',
    'By growing it in South Dakota.',
    'By cooking it in vegetable oil.',
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
    'To introduce their corn to tourists.',
    'To attend an honorary ceremony.',
    'To share experience with other corn growers.',
    'To exhibit their corn at the state''s Corn Palace.',
    'B',
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
    'Stole mail several times.',
    'Forged postal keys illegally.',
    'Attacked postmen on multiple occasions.',
    'Broke a number of postal collection boxes.',
    'A',
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
    'A sentence for life.',
    'Loss of all their possessions.',
    'Twenty-three years'' hard labor.',
    'Up to fifteen years in prison.',
    'D',
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
    'It escapes regulation and misleads consumers.',
    'It ignores economically feasible recycling options.',
    'It creates waste and severely impacts the environment.',
    'It produces clothes affordable only to a tiny minority.',
    'C',
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
    'To cut consumers'' expenses in buying quality clothes.',
    'To enable the whole fast-fashion industry to be sustainable.',
    'To incentivize manufacturers to be more consumer-friendly.',
    'To urge manufacturers and consumers to reduce waste.',
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
    'Recognizing the impact on consumers.',
    'Identifying the source of the problem.',
    'Abandoning the current business model.',
    'Establishing powerful regulatory bodies.',
    'B',
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
    'The city''s rush-hour traffic is intolerable.',
    'She cannot avoid rush-hour traffic.',
    'The local government is inefficient.',
    'The city is too big to move around easily.',
    'A',
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
    'Upgrading subway carriages.',
    'Increasing the number of bus routes.',
    'Air conditioning the city''s subway.',
    'Learning from other big cities.',
    'C',
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
    'He suffers from rush-hour crowding too.',
    'He is fortunate to live very near to work.',
    'He takes a half-hour bus ride to work.',
    'He is going to move closer to his office.',
    'C',
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
    'Recommend to her a good house near his office.',
    'Send her his housing agent''s telephone number.',
    'Tell her exactly what kind of property to look for.',
    'Make sure the agent finds something good for her.',
    'B',
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
    'He was remembered for the scar on his cheek.',
    'He received a heart operation a few days ago.',
    'He used to wear a sad face in school.',
    'He had some plastic surgery done.',
    'D',
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
    'The man''s deep sympathy for Johnny.',
    'The man''s use of the expression "fixed".',
    'The man''s covering up of what happened.',
    'The man''s good memory of his childhood.',
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
    'It gave him a noticeable smartness.',
    'It made him appear even more manly.',
    'It seemed to give him a certain uniqueness.',
    'It seemed to make up for his physical defects.',
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
    'Liberal.',
    'Hostile.',
    'Indifferent.',
    'Critical.',
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
    'Through deliberation.',
    'Through evolution.',
    'Through invention.',
    'Through collaboration.',
    'B',
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
    'With people imitating sounds around them.',
    'With people interacting with animals close by.',
    'With people showing each other things nearby.',
    'With people trying to string sounds together.',
    'A',
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
    'Making sounds can free one''s hands for doing other things.',
    'Making sounds proves markedly easier than sign languages.',
    'Making sounds enables one to express their ideas more explicitly.',
    'Making sounds helps one communicate with people they can''t see.',
    'D',
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
    'Well disciplined.',
    'Quite confident.',
    'Somewhat selfish.',
    'Highly intelligent.',
    'C',
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
    'When they wanted to have a competitive team member.',
    'When they were looking for a cooperative workmate.',
    'When they found collaboration essential to them.',
    'When they were seeking someone to help them.',
    'A',
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
    'Avoid frightening competitors.',
    'Make clear their social goal.',
    'Adopt persuasive strategies.',
    'Consider the consequences.',
    'D',
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
    'Much evidence of humans capturing animals.',
    'More images of animals than humans.',
    'Fewer images of buildings than animals.',
    'Little proof of human fascination with animals.',
    'B',
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
    'They were open to the public.',
    'They were primarily native.',
    'They were kept by royalty.',
    'They were hardly injured.',
    'C',
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
    'To enable the public to watch animals close by.',
    'To introduce to Egyptians animals from Punt.',
    'To protect the endangered animals.',
    'To show off her riches and power.',
    'D',
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
    'It was part of the royal estate.',
    'It was a shelter for wild animals.',
    'It was the kingdom''s best-equipped zoo.',
    'It was the first public exhibit of animals.',
    'A',
    7,
    @audio_url,
    124
);

-- ============================================================
-- Step 4: Part III Reading Comprehension Section A 选词填空
-- 第26-35题
-- 词库：
-- A) accepted   B) audiences   C) building    D) complex
-- E) constitutes F) deputies    G) previously  H) revolving
-- I) samples    J) selected    K) solemn      L) struggle
-- M) suddenly   N) understand  O) vary
--
-- 答案：26-D 27-G 28-A 29-E 30-C 31-O 32-N 33-B 34-L 35-M
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
    '{"article": "Psychologists have long been interested in how we construct our identities and the sorts of strategies that we use to present ourselves in society. New findings suggest that the kinds of {26} and strategic self-presentation behaviour we see in adults appear at a much younger age than {27} known.

Research shows that a child''s awareness of social standing comes from adults. Like grown-ups, kids want to be {28} by those they admire. Interactive experiences may provide opportunities for children to learn about what {29} a desirable reputation and the kinds of strategies that are effective for {30} a good reputation in their social environment.

Five-year-olds aren''t just aware of their reputations, they also behave strategically to alter their outward image. They will {31} their behaviour in order to appear moral or socially good in the eyes of key observers. While we know that adults use a large variety of attributes to manage and create impressions, we don''t yet know whether children {32} and use the fact that different attributes are valuable at different times to different {33}. It''s important for us to further consider where in this process children succeed in controlling their reputation and where they {34}.

A question to think about is, “What happens even earlier than age five?” Children don''t just show up to the first day of kindergarten and have the idea of reputation pop {35} into existence. The logical question to ask is, “What happens even earlier?”", "word_bank": ["accepted", "audiences", "building", "complex", "constitutes", "deputies", "previously", "revolving", "samples", "selected", "solemn", "struggle", "suddenly", "understand", "vary"]}',
    NULL, NULL, NULL, NULL,
    'complex',
    7,
    NULL,
    200
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'New findings suggest that the kinds of complex and strategic self-presentation behaviour we see in adults appear at a much younger age than {27} known.',
    NULL,
    NULL, NULL, NULL, NULL,
    'previously',
    7,
    NULL,
    201
),
(
    @exam_id,
    'reading_a',
    28,
    'blank_filling',
    'Like grown-ups, kids want to be {28} by those they admire.',
    NULL,
    NULL, NULL, NULL, NULL,
    'accepted',
    7,
    NULL,
    202
),
(
    @exam_id,
    'reading_a',
    29,
    'blank_filling',
    'Interactive experiences may provide opportunities for children to learn about what {29} a desirable reputation.',
    NULL,
    NULL, NULL, NULL, NULL,
    'constitutes',
    7,
    NULL,
    203
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'Interactive experiences may provide opportunities for children to learn about the kinds of strategies that are effective for {30} a good reputation in their social environment.',
    NULL,
    NULL, NULL, NULL, NULL,
    'building',
    7,
    NULL,
    204
),
(
    @exam_id,
    'reading_a',
    31,
    'blank_filling',
    'They will {31} their behaviour in order to appear moral or socially good in the eyes of key observers.',
    NULL,
    NULL, NULL, NULL, NULL,
    'vary',
    7,
    NULL,
    205
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'We don''t yet know whether children {32} and use the fact that different attributes are valuable at different times to different audiences.',
    NULL,
    NULL, NULL, NULL, NULL,
    'understand',
    7,
    NULL,
    206
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'Different attributes are valuable at different times to different {33}.',
    NULL,
    NULL, NULL, NULL, NULL,
    'audiences',
    7,
    NULL,
    207
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'It''s important for us to further consider where in this process children succeed in controlling their reputation and where they {34}.',
    NULL,
    NULL, NULL, NULL, NULL,
    'struggle',
    7,
    NULL,
    208
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'Children don''t just show up to the first day of kindergarten and have the idea of reputation pop {35} into existence.',
    NULL,
    NULL, NULL, NULL, NULL,
    'suddenly',
    7,
    NULL,
    209
);

-- ============================================================
-- Step 5: Part III Reading Comprehension Section B 段落匹配
-- 第36-45题
-- 答案：36-H 37-C 38-L 39-A 40-M 41-G 42-K 43-D 44-J 45-B
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
    'During the course of preparing for Design Ventura, teachers receive training and support while students get tutoring from designers.',
    'Getting young minds into design

A) Recently, a leading design federation in the UK warned that the UK could face a creative skills shortage, after the latest figures revealed a drop of almost 10 percent in students studying Design and Technology. These figures showed that the number of pupils that sat exams in Design and Technology fell 10 percent from 204,788 to 185,279 last year.

B) Chief executive John Kampfner of the Creative Industries Federation thinks that this drop in figures has worrying implications for the skills pipeline in Britain''s hugely successful arts and creative industries. He said, “We already have skills shortages in many jobs such as animation and special effects.” He added: “Engineering, which requires a similar mix of creative and technical skills, also has recruitment problems.”

C) Many other designers and architects have expressed concern over the future supply of home-grown talent for UK firms, and industry bodies have pointed out that there has been a lack of roots-level support. However, if these designers had visited the Design Museum shop in London earlier this year their fears may have been eased. With £10 to spend, they could have bought a fascinating children''s toy called “Dazzle Racer”. An automotive cylinder, it included a wind-up, elastic-band-powered mechanism, minimal parts, all 100 percent recycled, and lots of stickers. It was good fun, simple, eye-catching and very original.

D) Well, you''d expect the Design Museum to commission and make some interesting items, but this one was different. Designed by a group of six Year 9 and Year 10 boys from Finchley Catholic High School, the toy was the winning entry in the museum''s 2015 Design Ventura competition, which brings the business of design to life for students aged 13 to 16 by challenging them to develop a new creative, sustainable and commercially feasible product for the Design Museum shop and attracts hundreds of entries nationwide.

E) “We did Design Ventura in my previous school,” says Liam Hourican, Finchley Catholic High School''s design technology curriculum leader. “Then when I changed schools four years ago, I introduced it here because it helps to develop so many skills.”

F) The theme for last year''s competition was “Move”, and Hourican began with three groups working in lunch breaks and after school before selecting the group with the most innovative idea. Each participating school may submit just one proposal. “It''s the taking part and doing the work which is important,” he says. “And I never dreamt we''d win.”

G) Catherine Ritman Smith, head of learning at the Design Museum, is expecting around 10,000 participants aged 13 to 16 to take part this year and says that the project funded by Deutsche Bank as part of its youth engagement programme Born To Be is the biggest event in the museum''s calendar. “We started Design Ventura with around 800 young people in 2010 and it has grown steadily since,” she says. “Teachers like it because the skills are all transferable and it helps to validate the value of design as a subject,” she explains, telling me that nearly 600 schools have taken part so far.

H) So how does the competition work? A single-word theme is announced in the summer. This year it is “Change”. Schools work with groups to produce imaginative design ideas for a product in simple materials that could sell for £10 in the Design Museum shop. Participating schools then register by November and eventually submit their design idea. Along the way there is training and support for teachers and tutoring for students from designers. An additional bonus is when the winners see their design on sale in the spring of the following year.

I) Hourican and his pupils have happy memories of spending a whole day at the museum, having been selected as one of 10 shortlisted schools to present their idea to a panel of judges, including designer Jasper Conran. Then they worked with the Kin Design Studio in Shoreditch, met designers at their school and attended a lunch with Deutsche Bank employees. The students helped to make decisions and there were plenty of discussions—they changed the product''s name, for example.

J) “One of the really useful things about this competition,” says Hourican, “is that there''s a commercial element because the product is going on sale for real and the boys had to learn about budgeting and marketing, as well as designing their game.” Profits go to charity. “The winning team chooses where it wants the profits to go,” says Ritman Smith. “The Finchley Catholic High School product raised about £1,000 for Great Ormond Street Hospital.” Winning entries in past years have included a make-your-own cloth kit called Dove Bunting and a threefold, wallet-sized travel game with goals at each end, called Badoiiing.

K) It costs the schools nothing to participate in Design Ventura; the professional designers provide their services for free. Among them are architect Asif Khan, a Design Museum trustee who has worked as designer-in-residence at the museum, helping emerging architects. He has recently been commissioned to design the new Museum of London building in Smithfield.

L) Another is television presenter and interior designer Naomi Cleaver, who is one of the competition''s judges. “I''m very keen to encourage young people,” she says, observing that design brings together other subjects such as literature, art, history, geography and science. “Now that design education is limited in the curriculum, I''m all in favour of competitions such as Design Ventura, which helps to bring the standard curriculum to life,” says Cleaver. “And the judging day is terrific fun. Some of these students are very imaginative. One group presented their idea in the form of a puppet show and we see some marvelous demonstration models. I''m always impressed by the levels of confidence and the support the students get from their teachers.”

M) Ritman Smith adds: “Design technology has become a tricky subject to make a case for, and we''ve heard of departments closing in some schools. We find that if pupils take part in Design Ventura in Year Nine it can be the trigger which leads them to opt for it at General Certificate of Secondary Education, so we are helping to keep alive something which is crucial to industry and entrepreneurship.”',
    NULL, NULL, NULL, NULL,
    'H',
    7,
    NULL,
    300
),
(
    @exam_id,
    'reading_b',
    37,
    'matching',
    'A visit to the Design Museum shop in London can reduce the designers'' fears about the future supply of talents educated in Britain.',
    NULL,
    NULL, NULL, NULL, NULL,
    'C',
    7,
    NULL,
    301
),
(
    @exam_id,
    'reading_b',
    38,
    'matching',
    'One of Design Ventura''s judges says the competition adds vigour to the standard curriculum in schools.',
    NULL,
    NULL, NULL, NULL, NULL,
    'L',
    7,
    NULL,
    302
),
(
    @exam_id,
    'reading_b',
    39,
    'matching',
    'Enrollment in Design and Technology decreased by nearly ten percent last year in the UK.',
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
    'Participation of ninth graders in Design Ventura can motivate them to choose design technology as their subject.',
    NULL,
    NULL, NULL, NULL, NULL,
    'M',
    7,
    NULL,
    304
),
(
    @exam_id,
    'reading_b',
    41,
    'matching',
    'Design Ventura is welcomed by teachers because it helps to prove the worth of design as a school subject.',
    NULL,
    NULL, NULL, NULL, NULL,
    'G',
    7,
    NULL,
    305
),
(
    @exam_id,
    'reading_b',
    42,
    'matching',
    'The schools don''t have to pay anything to take part in the Design Ventura competition.',
    NULL,
    NULL, NULL, NULL, NULL,
    'K',
    7,
    NULL,
    306
),
(
    @exam_id,
    'reading_b',
    43,
    'matching',
    'Participants in Design Ventura are challenged to create sustainable and marketable products.',
    NULL,
    NULL, NULL, NULL, NULL,
    'D',
    7,
    NULL,
    307
),
(
    @exam_id,
    'reading_b',
    44,
    'matching',
    'Students benefit from Design Ventura because they can learn about budgeting and marketing in addition to game design.',
    NULL,
    NULL, NULL, NULL, NULL,
    'J',
    7,
    NULL,
    308
),
(
    @exam_id,
    'reading_b',
    45,
    'matching',
    'According to an officer of the Creative Industries Federation, there is difficulty now in recruiting engineers in the UK.',
    NULL,
    NULL, NULL, NULL, NULL,
    'B',
    7,
    NULL,
    309
);

-- ============================================================
-- Step 6: Part III Reading Comprehension Section C 仔细阅读
-- 第46-55题
-- 答案：46-D 47-A 48-C 49-B 50-C / 51-A 52-C 53-B 54-D 55-B
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
    'What do we learn from new research about pandas?',
    'New research suggests that pandas may be at risk of dying out because they are too comfortable. Experts say too much happiness can stop the bears from searching for new mates.

Environmentalists have long believed that building roads or homes near the bears may threaten their survival by reducing or fragmenting their natural habitats. But the new research suggests that a “modest degree of discomfort and fragmentation” may actually help preserve panda populations.

The research was conducted by scientists from Michigan State University. It concluded that pandas fail to wander off in search of new mates if they find their habitat too comfortable, resulting in a lack of vital genetic diversity.

For their study outlined in a paper in the journal Conservation Biology, the team looked at genetic diversity and spread among a Chinese panda population. The ideal level of perfectly livable habitat was found to be only 80% of an area, with the remainder either too harsh or too affected by human activity.

The experts concluded that pandas should ideally “be happy enough to thrive, but not so content that they don''t want to move around and find new mates”.

Their conclusions about what The Guardian described as this “sweet spot” are in line with the so-called Goldilocks principle: that there can be just the right amount of something. The concept has been applied to a wide range of disciplines, from developmental psychology to economics and engineering.

Claudio Sillero, a professor of conservation biology at Oxford University, told the newspaper that the new findings could have implications beyond panda conservation.

“Most large animals that eat meat live in increasingly fragmented landscapes,” said Sillero, who was not involved in the research. “It may well be that the messy nature of their relationship with human efforts induces more animals to scatter or travel further, and might result in greater genetic connectivity and enhanced population persistence.”

The most recent count of pandas found that there were more than 1,800 left in the wild, putting them on the list of vulnerable, but not endangered, species.',
    'They are losing habitat due to the building of roads and houses.',
    'They have stopped seeking new mates for reproduction.',
    'They may not adapt to the fragmentation of their habitat.',
    'They may cease to exist as a result of enjoying too good a life.',
    'D',
    7,
    NULL,
    400
),
(
    @exam_id,
    'reading_c',
    47,
    'single_choice',
    'What can we conclude from the new research by scientists at Michigan State University?',
    NULL,
    'Environmentalists'' long-time belief regarding panda conservation may be misleading.',
    'Housing development near pandas'' homes may threaten their survival.',
    'Pandas'' natural habitats are becoming less suitable for reproduction.',
    'The increased panda population is attributed to the fragmentation of their habitat.',
    'A',
    7,
    NULL,
    401
),
(
    @exam_id,
    'reading_c',
    48,
    'single_choice',
    'What is the experts'' conclusion regarding pandas?',
    NULL,
    'It is urgent to provide an ideal habitat for them to thrive.',
    'It is very important to preserve their genetic diversity.',
    'Their chances of finding new mates have a lot to do with their habitat.',
    'Their environment for survival has been continuously worsening.',
    'C',
    7,
    NULL,
    402
),
(
    @exam_id,
    'reading_c',
    49,
    'single_choice',
    'What can we infer from the passage about the Goldilocks principle?',
    NULL,
    'It needs to be confirmed by more studies on pandas.',
    'It applies to the preservation of pandas too.',
    'It has implications for future panda research.',
    'It can be used to locate the right spot for pandas.',
    'B',
    7,
    NULL,
    403
),
(
    @exam_id,
    'reading_c',
    50,
    'single_choice',
    'What can the new findings do according to Professor Sillero?',
    NULL,
    'Help discover new ways for the conservation of pandas.',
    'Help remove pandas from the list of endangered species.',
    'Shed light on the conservation of most large meat-eating animals.',
    'Show the complexity of interactions between humans and animals.',
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
    'What does the passage say about people born with natural talents?',
    'With those born with natural talents, it feels as if they excel without really trying. But what about those of us who don''t have a natural talent? We''ve been told all our lives that if you work hard, you too can succeed. But with the release of Angela Duckworth''s Grit, we are given a new key to success.

"As much as talent counts, effort counts twice," says Duckworth in Grit. She introduces a new concept that talent may be overrated, and if you want real success, what you need is grit, the perfect combination of passion and persistence. Even if you have natural talent, it''s nothing without grit.

Duckworth says grit is the difference between success and failure. A person who has grit is more likely to succeed than a person who does not. When we think about attaining success--whether it''s landing that job or learning that new skill--our thoughts are immediately burdened by all the things we must first learn. If you want that new job, you have to learn the job skills, then the interview skills, then the dress part--and you must be perfect at all of them. Grit is different because it tells us that perfection isn''t the goal.

Grit lifts the unreasonable expectations off our shoulders. Grit tells us that the door is open wider than we first thought possible. Grit allows us to redefine our goals. Think about it: what''s something you''ve always wanted to do, but gave up because you "don''t have the skills for it"? What''s something you love but aren''t good at?

The real workings of grit are to have sustainable passion and continue to try. Effort means more than your natural ability. Even if you haven''t mastered a skill, grit tells you that you can still succeed if you can transform your passion into action. In a way, Duckworth is giving new hope to people who have shut the doors on their dreams. She is saying it is possible that you can accomplish anything. If at first you fail, then try one more time with grit.',
    'They seem to outdo others without hard work.',
    'They appear to know all the secrets to success.',
    'They feel it only too logical to succeed.',
    'They are bound to excel effortlessly.',
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
    'What does Duckworth say about talent?',
    NULL,
    'It is a new concept much too overrated.',
    'It proves necessary for big achievements.',
    'It plays a lesser role in one''s success.',
    'It is a guarantee for real success in life.',
    'C',
    7,
    NULL,
    406
),
(
    @exam_id,
    'reading_c',
    53,
    'single_choice',
    'What does the passage say about people thinking of attaining success?',
    NULL,
    'They are puzzled how to present their best to the employer.',
    'They are burdened by their expectation of perfection.',
    'They will try hard to land a job that fits their skills best.',
    'They will find themselves lacking in all the skills they need.',
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
    'How does the author think grit can be helpful to us?',
    NULL,
    'It allows us to know what we are good at.',
    'It opens our eyes to new opportunities.',
    'It focuses our attention on what we do.',
    'It lets us reconsider the goals to achieve.',
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
    'What message does Duckworth try to convey in her book Grit?',
    NULL,
    'We should perfect ourselves to ensure success.',
    'We should stay persistent even in face of failures.',
    'We can never master a skill without constant practice.',
    'We can never expect to reach our goals without passion.',
    'B',
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
    '被誉为“杂交水稻(hybrid rice)之父”的袁隆平和他的科研团队克服重重困难，研发出了一种超级杂交水稻。这项技术获得了举世公认的巨大成功。通过这项技术的应用，水稻抗旱抗病能力更强，能适应不同的气候和土壤条件，产量可提高20-30%。超级杂交水稻营养丰富，口感更佳。目前，这项技术已经在许多国家得到广泛应用，为全球粮食安全做出了重大贡献。',
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
--   listening   : 25题，题号1-25
--   reading_a   : 10题，题号26-35
--   reading_b   : 10题，题号36-45
--   reading_c   : 10题，题号46-55
--   translation : 1题，题号56
--   合计        : 57题
-- ============================================================
