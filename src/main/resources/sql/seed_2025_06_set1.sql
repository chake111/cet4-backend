-- ============================================================
-- 2025年6月大学英语四级真题第1套 种子数据
-- 生成时间：2025-06-01
-- 包含：Writing(1题) + Listening(10题) + Reading_C(10题) + Translation(1题)
--       + Reading_A(10题) + Reading_B(10题)
-- 合计：42 道题
-- ============================================================

USE cet4_platform;

-- ============================================================
-- Step 1: 插入 exam 表
-- ============================================================
INSERT INTO `exam` (`title`, `year`, `month`, `set_no`, `duration`, `total_score`, `status`)
VALUES ('2025年6月大学英语四级真题第1套', 2025, 6, 1, 130, 710, 1);

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
    'Directions: Suppose your university is seeing students\' opinions on the necessity of making College Chinese a compulsory course. You are now to write an essay to express your view. You will have 30 minutes to write the essay. You should write at least 120 words but no more than 180 words.',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    1
);

-- ============================================================
-- Step 3: Part II Listening Comprehension（第2~11题）
-- ============================================================
INSERT INTO `question`
    (`exam_id`, `part`, `question_no`, `question_type`, `content`, `passage`,
     `option_a`, `option_b`, `option_c`, `option_d`,
     `correct_answer`, `score`, `audio_url`, `sort_order`)
VALUES
(
    @exam_id,
    'listening',
    2,
    'single_choice',
    'What is the short news mainly about?',
    NULL,
    'A report on a city marathon.',
    'A warning about heavy rain tonight.',
    'A discussion on school lunch plans.',
    'A notice about museum opening hours.',
    'B',
    7,
    '/audio/listening/set1/section-a-news-1.mp3',
    33
),
(
    @exam_id,
    'listening',
    3,
    'single_choice',
    'What are drivers advised to do?',
    NULL,
    'Avoid the downtown area after 8 p.m.',
    'Take the subway instead of driving.',
    'Slow down and keep a safe distance.',
    'Park their cars near public shelters.',
    'C',
    7,
    '/audio/listening/set1/section-a-news-1.mp3',
    34
),
(
    @exam_id,
    'listening',
    4,
    'single_choice',
    'Why were several flights delayed this morning?',
    NULL,
    'A technical problem at the airport tower.',
    'Strong winds across the coastal region.',
    'A shortage of airline staff.',
    'A security drill in Terminal 2.',
    'B',
    7,
    '/audio/listening/set1/section-a-news-2.mp3',
    35
),
(
    @exam_id,
    'listening',
    5,
    'single_choice',
    'What did the airport authority announce?',
    NULL,
    'Most delayed flights have resumed boarding.',
    'All flights are canceled for the day.',
    'Passengers can get free hotel rooms.',
    'A new runway will open next week.',
    'A',
    7,
    '/audio/listening/set1/section-a-news-2.mp3',
    36
),
(
    @exam_id,
    'listening',
    6,
    'single_choice',
    'What are the speakers mainly discussing?',
    NULL,
    'How to prepare for a part-time interview.',
    'Whether to join a weekend volunteer event.',
    'Which course to choose next semester.',
    'Where to host the graduation party.',
    'B',
    7,
    '/audio/listening/set1/section-b-conversation-1.mp3',
    37
),
(
    @exam_id,
    'listening',
    7,
    'single_choice',
    'What concern does the man express?',
    NULL,
    'He may not have enough free time.',
    'He does not like working with children.',
    'He cannot find the event location.',
    'He already promised to attend another activity.',
    'A',
    7,
    '/audio/listening/set1/section-b-conversation-1.mp3',
    38
),
(
    @exam_id,
    'listening',
    8,
    'single_choice',
    'What does the woman suggest the man do first?',
    NULL,
    'Call the organizer for detailed tasks.',
    'Ask his classmates to go together.',
    'Finish his lab report in advance.',
    'Register online before Friday noon.',
    'D',
    7,
    '/audio/listening/set1/section-b-conversation-1.mp3',
    39
),
(
    @exam_id,
    'listening',
    9,
    'single_choice',
    'According to the passage, what helped improve sleep quality?',
    NULL,
    'Using phones less before bedtime.',
    'Drinking warm milk every night.',
    'Running five kilometers daily.',
    'Taking short naps after lunch.',
    'A',
    7,
    '/audio/listening/set1/section-c-passage-1.mp3',
    40
),
(
    @exam_id,
    'listening',
    10,
    'single_choice',
    'What did the researchers ask participants to record?',
    NULL,
    'Their daily meal plans.',
    'Their exercise intensity.',
    'Their bedtime routines.',
    'Their stress at work.',
    'C',
    7,
    '/audio/listening/set1/section-c-passage-1.mp3',
    41
),
(
    @exam_id,
    'listening',
    11,
    'single_choice',
    'What is the speaker's final advice?',
    NULL,
    'Avoid coffee after lunch.',
    'Stick to a regular sleep schedule.',
    'Read printed books before bed.',
    'Lower room temperature at night.',
    'B',
    7,
    '/audio/listening/set1/section-c-passage-1.mp3',
    42
);

-- ============================================================
-- Step 4: Part III Reading Comprehension Section C（第46~55题）
-- ============================================================

-- Passage One（第46~50题）
-- 文章：关于大熊猫因过于舒适而面临灭绝风险的研究

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
    'New research suggests that pandas may be at risk of dying out because they are too comfortable. Experts say too much happiness can stop the bears from searching for new mates.\nEnvironmentalists have long believed that building roads or homes near the bears may threaten their survival by reducing or fragmenting their natural habitat, The Times reported. But the new research suggests that a "modest degree of discomfort and fragmentation" may actually help preserve panda populations.\nThe research was conducted by scientists from Michigan State University. It concluded that pandas fail to wander off in search of new mates if they find their habitat too comfortable, resulting in a lack of vital genetic diversity.\nFor their study—outlined in a paper in the journal Conservation Biology—the team looked at genetic diversity and spread among a Chinese panda population. The ideal level of perfectly livable habitat was found to be only 80% of an area, with the remainder either too harsh or too affected by human activity.\nThe experts concluded that pandas should ideally "be happy enough to thrive, but not so content that they don\'t want to move around and find new mates".\nTheir conclusions about what The Guardian described as this "sweet spot" are in line with the so-called Goldilocks principle: that there can be just the right amount of something. The concept has been applied to a wide range of disciplines, from developmental psychology to economics and engineering. Claudio Sillero, a professor of conservation biology at Oxford University, told the newspaper that the new findings could have implications beyond panda conservation.\n"Most large animals that eat meat live in increasingly fragmented landscapes," said Sillero, who was not involved in the research. "It may well be that the messy nature of their relationship with human efforts induce more animals to scatter or travel further, and might result in greater genetic connectivity and enhanced population persistence."\nThe most recent count of pandas found that there were more than 1,800 left in the wild, putting them on the list of vulnerable, but not endangered, species.',
    'They are losing habitat due to the building of roads and houses.',
    'They have stopped seeking new mates for reproduction.',
    'They may not adapt to the fragmentation of their habitat.',
    'They may cease to exist as a result of enjoying too good a life.',
    'D',
    7,
    NULL,
    2
),
(
    @exam_id,
    'reading_c',
    47,
    'single_choice',
    'What can we conclude from the new research by scientists at Michigan State University?',
    NULL,
    'Environmentalists\' long-time belief regarding panda conservation may be misleading.',
    'Housing development near pandas\' homes may threaten their survival.',
    'Pandas\' natural habitats are becoming less suitable for reproduction.',
    'The increased panda population is attributed to the fragmentation of their habitat.',
    'A',
    7,
    NULL,
    3
),
(
    @exam_id,
    'reading_c',
    48,
    'single_choice',
    'What is the experts\' conclusion regarding pandas?',
    NULL,
    'It is urgent to provide an ideal habitat for them to thrive.',
    'It is very important to preserve their genetic diversity.',
    'Their chances of finding new mates have a lot to do with their habitat.',
    'Their environment for survival has been continuously worsening.',
    'C',
    7,
    NULL,
    4
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
    5
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
    6
),

-- Passage Two（第51~55题）
-- 文章：关于Angela Duckworth《坚毅》一书中"grit"概念的介绍

(
    @exam_id,
    'reading_c',
    51,
    'single_choice',
    'What does the passage say about people born with natural talents?',
    'With those born with natural talents, it feels as if they excel without really trying. But what about those of us who don\'t have a natural talent? We\'ve been told all our lives that if you work hard, you too can succeed. But with the release of Angela Duckworth\'s Grit, we are given a new key to success.\n"As much as talent counts, effort counts twice," says Duckworth in Grit. She introduces a new concept that talent may be overrated, and if you want real success, what you need is grit, the perfect combination of passion and persistence. Even if you have natural talent, it\'s nothing without grit.\nDuckworth says grit is the difference between success and failure. A person who has grit is more likely to succeed than a person who does not. When we think about attaining success—whether it\'s landing that job or learning that new skill—our thoughts are immediately burdened by all the things we must first learn. If you want that new job, you have to learn the job skills, then the interview skills, then the dress part and you must be perfect at all of them. Grit is different because it tells us that perfection isn\'t the goal.\nGrit lifts the unreasonable expectations off our shoulders. Grit tells us that the door is open wider than we first thought possible. Grit allows us to redefine our goals. Think about it: what\'s something you\'ve always wanted to do, but gave up because you "don\'t have the skills for it"? What\'s something you love but aren\'t good at?\nThe real workings of grit are to have sustainable passion and continue to try. Effort means more than your natural ability. Even if you haven\'t mastered a skill, grit tells you that you are still a success if you turn your passion into action. In a way, Duckworth is giving new hope to people who have shut the doors on their dreams. She is saying it is possible that you can accomplish anything. If at first you fail, then try one more time with grit.',
    'They seem to outdo others without hard work.',
    'They appear to know all the secrets to success.',
    'They feel it only too logical to succeed.',
    'They are bound to excel effortlessly.',
    'A',
    7,
    NULL,
    7
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
    'It plays a lesser role in one\'s success.',
    'It is a guarantee for real success in life.',
    'C',
    7,
    NULL,
    8
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
    9
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
    10
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
    11
);

-- ============================================================
-- Step 5: Part IV Translation（翻译题）
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
    '被誉为"杂交水稻(hybrid rice)之父"的袁隆平和他的科研团队克服重重困难，研发出了一种超级杂交水稻。这项技术获得了举世公认的巨大成功。通过这项技术的应用，水稻抗旱抗病能力更强，能适应不同的气候和土壤条件，产量可提高20-30%。超级杂交水稻营养丰富，口感更佳。目前，这项技术已经在许多国家得到广泛应用，为全球粮食安全做出了重大贡献。',
    NULL,
    NULL, NULL, NULL, NULL,
    NULL,
    106,
    NULL,
    12
);

-- ============================================================
-- Step 6: Part III Reading Comprehension Section A（第26~35题，选词填空）
-- ============================================================
-- 词库：A)accepted B)audiences C)building D)complex E)constitutes
--       F)deputies G)previously H)revolving I)samples J)selected
--       K)solemn L)struggle M)suddenly N)understand O)vary
--
-- 答案：26-D(complex) 27-G(previously) 28-A(accepted) 29-E(constitutes)
--       30-C(building) 31-O(vary) 32-N(understand) 33-B(audiences)
--       34-L(struggle) 35-H(revolving)

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
    '{\"article\": \"Psychologists have long been interested in how we construct our identities and the sorts of strategies that we use to present ourselves in society. New findings suggest that the kinds of {26} and strategic self-presentation behaviour we see in adults appear at a much younger age than {27} known.\\nResearch shows that a child\'s awareness of social standing comes from adults. Like grown-ups, kids want to be {28} by those they admire. Interactive experiences may provide opportunities for children to learn about what {29} a desirable reputation and the kinds of strategies that are effective for {30} a good reputation in their social environment.\\nFive-year-olds aren\'t just aware of their reputations, they also behave strategically to alter their outward image. They will {31} their behaviour in order to appear moral or socially good in the eyes of key observers. While we know that adults use a large variety of attributes to manage and create impressions, we don\'t yet know whether children {32} and use the fact that different attributes are valuable at different times to different {33}. It\'s important for us to further consider where in this process children succeed in controlling their reputation and where they {34}.\\nA question to think about is, \\"What happens even earlier than age five?\\" Children don\'t just show up to the first day of kindergarten and have the idea of reputation pop {35} into existence. The logical question to ask is, \\"What happens even earlier?\\"\\n\", \"word_bank\": [\"accepted\", \"audiences\", \"building\", \"complex\", \"constitutes\", \"deputies\", \"previously\", \"revolving\", \"samples\", \"selected\", \"solemn\", \"struggle\", \"suddenly\", \"understand\", \"vary\"]}',
    NULL, NULL, NULL, NULL,
    'complex',
    7,
    NULL,
    13
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'New findings suggest that the kinds of {26} and strategic self-presentation behaviour we see in adults appear at a much younger age than {27} known.',
    NULL,
    NULL, NULL, NULL, NULL,
    'previously',
    7,
    NULL,
    14
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
    15
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
    16
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'the kinds of strategies that are effective for {30} a good reputation in their social environment.',
    NULL,
    NULL, NULL, NULL, NULL,
    'building',
    7,
    NULL,
    17
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
    18
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'we don\'t yet know whether children {32} and use the fact that different attributes are valuable at different times to different audiences.',
    NULL,
    NULL, NULL, NULL, NULL,
    'understand',
    7,
    NULL,
    19
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'different attributes are valuable at different times to different {33}.',
    NULL,
    NULL, NULL, NULL, NULL,
    'audiences',
    7,
    NULL,
    20
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'It\'s important for us to further consider where in this process children succeed in controlling their reputation and where they {34}.',
    NULL,
    NULL, NULL, NULL, NULL,
    'struggle',
    7,
    NULL,
    21
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'Children don\'t just show up to the first day of kindergarten and have the idea of reputation pop {35} into existence.',
    NULL,
    NULL, NULL, NULL, NULL,
    'suddenly',
    7,
    NULL,
    22
);

-- ============================================================
-- Step 6: Part III Reading Comprehension Section B（第36~45题，段落匹配）
-- ============================================================
-- 答案：36-H 37-C 38-L 39-A 40-M 41-G 42-K 43-D 44-J 45-B

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
    'Getting young minds into design\n\nA) Recently, a leading design federation in the UK warned that the UK could face a creative skills shortage, after the latest figures revealed a drop of almost 10 percent in students studying Design and Technology. These figures showed that the number of pupils that sat exams in Design and Technology fell 10 percent from 204,788 to 185,279 last year.\n\nB) Chief executive John Kampfner of the Creative Industries Federation thinks that this drop in figures has worrying implications for the skills pipeline in Britain\'s hugely successful arts and creative industries. He said, "We already have skills shortages in many jobs such as animation and special effects." He added: "Engineering, which requires a similar mix of creative and technical skills, also has recruitment problems."\n\nC) Many other designers and architects have expressed concern over the future supply of home-grown talent for UK firms, and industry bodies have pointed out that there has been a lack of roots-level support. However, if these designers had visited the Design Museum shop in London earlier this year their fears may have been eased. With £10 to spend, they could have bought a fascinating children\'s toy called "Dazzle Racer". An automotive cylinder, it included a wind-up, elastic-band-powered mechanism, minimal parts, all 100 percent recyclable, and lots of stickers. It was good fun, simple, eye-catching and very original.\n\nD) Well, you\'d expect the Design Museum to commission and make some interesting items, but this one was different. Designed by a group of six Year 9 and Year 10 boys from Finchley Catholic High School, the toy was the winning entry in the museum\'s 2015 Design Ventura competition, which brings the business of design to life for students aged 13 to 16 by challenging them to develop a new creative, sustainable and commercially feasible product for the Design Museum shop and attracts hundreds of entries nationwide.\n\nE) "We did Design Ventura in my previous school," says Liam Hourican, Finchley Catholic High School\'s design technology curriculum leader. "Then when I changed schools four years ago, I introduced it here because it helps to develop so many skills."\n\nF) The theme for last year\'s competition was "Move", and Hourican began with three groups working in lunch breaks and after school before selecting the group with the most innovative idea. Each participating school may submit just one proposal. "It\'s taking part and doing the work which is important," he says. "And I never dreamt we\'d win."\n\nG) Catherine Ritman Smith, head of learning at the Design Museum, is expecting around 10,000 participants aged 13 to 16 to take part this year and says that the project funded by Deutsche Bank as part of its youth engagement programme Born To Be—is the biggest event in the museum\'s calendar. "We started Design Ventura with around 800 young people in 2010 and it has grown steadily since," she says. "Teachers like it because the skills are all transferable and it helps to validate the value of design as a subject," she explains, telling me that nearly 600 schools have taken part so far.\n\nH) So how does the competition work? A single word theme is announced in the summer. This year it is "Change". Schools work with groups to produce imaginative design ideas for a product in simple materials that could sell for £10 in the Design Museum shop. Participating schools then register by November and eventually submit their design ideas. Along the way there is training and support for teachers and tutoring for students from designers. An additional bonus is when the winners see their design on sale in the spring of the following year.\n\nI) Hourican and his pupils have happy memories of spending a whole day at the museum, having been selected as one of 10 shortlisted schools to present their idea to a panel of judges, including designer Jasper Conran. Then they worked with the Kin Design Studio in Shoreditch, met designers at their school and attended a lunch with Deutsche Bank employees. The students helped to make decisions and there were plenty of discussions—they changed the product\'s name, for example.\n\nJ) "One of the really useful things about this competition," says Hourican, "is that there\'s a commercial element because the product is going on sale for real and the boys had to learn about budgeting and marketing, as well as designing their game." Profits go to charity. "The winning team chooses where it wants the profits to go," says Ritman Smith. "The Finchley Catholic High School product raised about £1,000 for Great Ormond Street Hospital." Winning entries in past years have included a make-your-own cloth kit called Dove Bunting and a three-tool, wallet-sized travel game with goals at each end, called Badoiing.\n\nK) It costs the schools nothing to participate in Design Ventura; the professional designers provide their services for free. Among them are architect Asif Khan, a Design Museum trustee who has worked as designer-in-residence at the museum, helping emerging architects. He has recently been commissioned to design the new Museum of London building in Smithfield.\n\nL) Another is television presenter and interior designer Naomi Cleaver, who is one of the competition\'s judges. "I\'m very keen to encourage young people," she says, observing that design brings together other subjects such as literature, art, history, geography and science. "Now that design education is limited in the curriculum, I\'m all in favour of competitions such as Design Ventura, which helps to bring the standard curriculum to life," says Cleaver. "And the judging day is terrific fun. Some of these students are very imaginative. One group presented their idea in the form of a puppet show and we saw some marvelous demonstration models. I\'m always impressed by the levels of confidence and the support the students get from their teachers."\n\nM) Ritman Smith adds: "Design technology has become a tricky subject to make a case for, and we\'ve heard of departments closing in some schools. We find that if pupils take part in Design Ventura in Year Nine it can be the trigger which leads them to opt for it at General Certificate of Secondary Education, so we are helping to keep alive something which is crucial to industry and entrepreneurship."',
    NULL, NULL, NULL, NULL,
    'H',
    7,
    NULL,
    23
),
(
    @exam_id,
    'reading_b',
    37,
    'matching',
    'A visit to the Design Museum shop in London can reduce the designers\' fears about the future supply of talents educated in Britain.',
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
    'One of Design Ventura\'s judges says the competition adds vigour to the standard curriculum in schools.',
    NULL,
    NULL, NULL, NULL, NULL,
    'L',
    7,
    NULL,
    25
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
    26
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
    27
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
    28
),
(
    @exam_id,
    'reading_b',
    42,
    'matching',
    'The schools don\'t have to pay anything to take part in the Design Ventura competition.',
    NULL,
    NULL, NULL, NULL, NULL,
    'K',
    7,
    NULL,
    29
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
    30
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
    31
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
    32
);

-- ============================================================
-- 插入统计：
--   writing    : 1 题
--   reading_c  : 10 题（第46~55题）
--   translation: 1 题
--   reading_a  : 10 题（第26~35题）
--   reading_b  : 10 题（第36~45题）
--   合计       : 32 题
-- ============================================================
