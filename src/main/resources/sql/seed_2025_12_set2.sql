-- ============================================================
-- 2025年12月大学英语四级真题第2套 种子数据
-- 生成时间：2026-04-27
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
VALUES ('2025年12月大学英语四级真题第2套', 2025, 12, 2, 130, 710, 1);

SET @exam_id = LAST_INSERT_ID();

SET @audio_url = 'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/12/set2/2025%E5%B9%B412%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B%E7%AC%AC2%E5%A5%97.mp3';

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
    'Directions: Suppose it is proposed that all university students should be required to learn academic writing. You are now to write a response by stating what you think of the proposal. You will have 30 minutes to write the essay. You should write at least 120 words but no more than 180 words.',
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
-- A) actually       B) consequently  C) contributing  D) fair
-- E) feels          F) manageable    G) mends         H) observed
-- I) phase          J) plotting      K) quality       L) recently
-- M) taxing         N) tends         O) yielded
--
-- 答案：26-D 27-E 28-L 29-N 30-A 31-H 32-C 33-M 34-F 35-K
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
    '{"article": "Some music inspires you to move your feet, some inspires you to get out there and change the world. In any case, it''s {26} to say that music moves people in special ways.

If you''re especially into a piece of music, your brain does something called Autonomous Sensory Meridian Response (ASMR), which {27} to you like a sting in your brain.

It turns out that ASMR is pretty special. According to a {28} published study in The Journal of Prevention of Alzheimer''s Disease, the part of your brain responsible for ASMR doesn''t get lost to Alzheimer''s. Alzheimer''s {29} to put people into layers of confusion, and the study confirms that music can sometimes {30} lift people out of the Alzheimer''s haze and bring them back to at least a likeness of normality, if only for a short while. ASMR is powerful stuff!

This phenomenon has been {31} several times but rarely studied properly. One of the most famous examples of this is the story of 92-year-old Henry Dryer, who comes out of dementia while listening to songs from his youth.

Jeff Anderson, associate professor in Radiology at the University of Utah and {32} author on the study, says: In our society, the diagnoses of dementia are {33} resources to the maximum. No one says playing music will be a cure for Alzheimer''s disease, but it might make the symptoms more {34}, decrease the cost of care and improve a patient''s {35} of life.", "word_bank": ["actually", "consequently", "contributing", "fair", "feels", "manageable", "mends", "observed", "phase", "plotting", "quality", "recently", "taxing", "tends", "yielded"]}',
    NULL, NULL, NULL, NULL,
    'fair',
    7,
    NULL,
    200
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'If you''re especially into a piece of music, your brain does something called Autonomous Sensory Meridian Response (ASMR), which {27} to you like a sting in your brain.',
    NULL,
    NULL, NULL, NULL, NULL,
    'feels',
    7,
    NULL,
    201
),
(
    @exam_id,
    'reading_a',
    28,
    'blank_filling',
    'According to a {28} published study in The Journal of Prevention of Alzheimer''s Disease, the part of your brain responsible for ASMR doesn''t get lost to Alzheimer''s.',
    NULL,
    NULL, NULL, NULL, NULL,
    'recently',
    7,
    NULL,
    202
),
(
    @exam_id,
    'reading_a',
    29,
    'blank_filling',
    'Alzheimer''s {29} to put people into layers of confusion.',
    NULL,
    NULL, NULL, NULL, NULL,
    'tends',
    7,
    NULL,
    203
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'The study confirms that music can sometimes {30} lift people out of the Alzheimer''s haze.',
    NULL,
    NULL, NULL, NULL, NULL,
    'actually',
    7,
    NULL,
    204
),
(
    @exam_id,
    'reading_a',
    31,
    'blank_filling',
    'This phenomenon has been {31} several times but rarely studied properly.',
    NULL,
    NULL, NULL, NULL, NULL,
    'observed',
    7,
    NULL,
    205
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'Jeff Anderson, associate professor in Radiology at the University of Utah and {32} author on the study, says...',
    NULL,
    NULL, NULL, NULL, NULL,
    'contributing',
    7,
    NULL,
    206
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'In our society, the diagnoses of dementia are {33} resources to the maximum.',
    NULL,
    NULL, NULL, NULL, NULL,
    'taxing',
    7,
    NULL,
    207
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'It might make the symptoms more {34}, decrease the cost of care and improve a patient''s quality of life.',
    NULL,
    NULL, NULL, NULL, NULL,
    'manageable',
    7,
    NULL,
    208
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'It might make the symptoms more manageable, decrease the cost of care and improve a patient''s {35} of life.',
    NULL,
    NULL, NULL, NULL, NULL,
    'quality',
    7,
    NULL,
    209
);
-- ============================================================
-- Step 5: Part III Reading Comprehension Section B 长篇阅读
-- 第36-45题
-- 答案：36-D 37-I 38-F 39-A 40-K 41-G 42-B 43-J 44-E 45-H
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
    'Certain gaming skills meet the requirements of the armed forces in Britain.',
    'Can playing video games help you get a better job?

A) The gaming industry is larger than films and music combined, yet few of us are likely to list our achievements in playing computer games as work experience in our resume. But why not? Businesses are waking up to the skills gamers can bring to the workplace.

B) One start-up is convinced that the skills learned by playing games—hard-won through years of training and battle—can be applied to real-life work situations. And Game Academy reckons its belief is backed up by hard data. Do you enjoy unusual puzzle games like Portal, or tower defence games like Defense Grid? The team has found that IT workers play those more than average. But if you prefer Civilization, Total War, or X-Com, where strategy and resource management are key, then you might have more in common with managers.

C) Game Academy''s idea is simple: analyse gamers'' habits from their online gaming profile, and offer courses in valuable skills that reflect their aptitudes—skills they can practise and refine in-game. And there is already a growing acceptance that gaming skills are transferable.

D) Even the military is hiring gamers. “The ability to absorb information, react swiftly and coordinate actions whilst remaining calm under pressure are often attributes of people that are good at gaming,” according to a Royal Air Force spokesperson. Those skills are part of what the Royal Air Force is looking for “in a variety of roles”. “Skills acquired through gaming can be very relevant to certain areas.”

E) “There are plenty of soft skills that gamers can utilise in a professional setting, such as teamwork, problem solving and strategic planning,” says Ryan Gardner, a regional director with Hays recruitment. But does that really mean your top 100 ranking in Overwatch should go down in your resume? “It''s about how you either make it relevant to the job you are applying for, or how it makes you more interesting as a potential employee,” Mr. Gardner says.

F) Two years ago, a Glasgow University study made headlines for suggesting gaming could make students more successful. But “the research hasn''t really changed minds, at least not yet,” says one of the authors of the study, Dr. Matthew Barr. He''s now writing a book on the topic. “For now, I think the negative reputation around games means that telling someone you''re a determined gamer is more likely to harm your chances of getting a job. But if someone can explain how they''ve led a team in an online game, for example, they may be able to persuade an employer that this is useful,” says Dr Barr.

G) Playing games casually is unlikely to help your career prospects. But part of Game Academy''s suggestion is to transform casual gamers into “conscious” ones, applying critical thinking to developing their skills. “We see gameplay as a resource of talent,” says co-founder David Barrie. “Why can''t we put in our resume our gaming victories and achievements?” he asks. “If they say they want leadership—why can''t I point to my years of leading World of Warcraft raids?”

H) There are already plenty of gamers out there who know that their hobby has made them who they are. Earlier this year, Matthew Ricci told gaming site Kotaku: “If you''re playing EVE Online you basically already have an MBA.” Often made fun of in gaming circles as a spreadsheet simulator, the economy of the fictional EVE universe is driven by real market principles. If you want to build a new spaceship, the raw material has to be mined by another player. Manufacturing costs come into effect, and commodities fluctuate in price based on demand and the distance to haul the commodity.

I) Mr. Ricci, who had always dreamed of being the boss of his own company, ran an in-game corporation comprising hundreds of players. Eventually, he realised he could transfer his skills to real-life business—instead of doing it for free. He restructured Zentech, once a taxation vehicle for his father''s business, and it is now in its fourth year helping international brands enter the Canadian market. EVE teaches skills like creativity, leadership, organisation, and conflict resolution, he maintains. He credits his success to his family, his strong desire to run his own business—and “a damn good company in Iceland that made a damn good game”.

J) Digital entrepreneur and business consultant Mia Bennett says: “In more traditional settings, gaming is still imagined to be the pursuit of teenage boys—a waste of time.” But there are some links to skills like “decision-making, the ability to anticipate and future planning,” she says. “It also helps with meta-skills—learning how to learn, experimentation, and creative thinking.”

K) Twelve years into his career, Mark Long, a radiotherapy physicist with the NHS in Surrey, doesn''t get as much gaming time as he used to. “I would love to say that my gaming skills allow me to destroy cancer using linear accelerators like photon blasters, but that''s not quite the reality.” Instead, he credits old-school games like Palace of Magic with exposing him to computers. Every new gaming upgrade improved his knowledge of how they worked. Gaming also encouraged a competitive spirit—and that, he believes, translates. “When creating treatment plans, the aim is to optimise the radiation dose to the tumour and restrict it as much as possible to healthy surrounding tissues and organs,” he says. It''s about “repeating the process, but each time doing something slightly different to improve the result”. Not unlike achieving a high score or a perfect run. “Most videogames are essentially puzzles to solve,” he says. “And problem-solving is a big part of my job.”

L) Over at Game Academy, Mr. Barrie is aware they still have a mountain to climb. “The employer community will need the science,” he says, but confesses he only became a true believer when he started asking players about their biggest in-game achievements. “The scale and scope of their answers were amazing,” he says. “But ask them the same about their work, and they don''t know.” “The engagement and powerful skills that people get playing a game—why can''t work be like that?” he asks.',
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
    'One veteran player has applied his gaming skills to his real-world business and owes his success partly to a game company.',
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
    'According to a researcher, bad reputation about games will probably limit a gamer''s chances of landing a job.',
    NULL,
    NULL, NULL, NULL, NULL,
    'F',
    7,
    NULL,
    302
),
(
    @exam_id,
    'reading_b',
    39,
    'matching',
    'Businesses are beginning to realise gaming skills are applicable to their employees'' work.',
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
    'A physicist admits gaming has contributed to his computer knowledge and skills of solving problems.',
    NULL,
    NULL, NULL, NULL, NULL,
    'K',
    7,
    NULL,
    304
),
(
    @exam_id,
    'reading_b',
    41,
    'matching',
    'Game Academy proposes to help gamers develop their skills using critical thinking.',
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
    'One who enjoys playing games that require management skills to win might possess more qualities of a manager.',
    NULL,
    NULL, NULL, NULL, NULL,
    'B',
    7,
    NULL,
    306
),
(
    @exam_id,
    'reading_b',
    43,
    'matching',
    'In more conventional views, gaming is a time-wasting activity pursued by young boys.',
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
    'It is suggested that gaming skills be included in a resume if they enhance a job applicant''s appeal.',
    NULL,
    NULL, NULL, NULL, NULL,
    'E',
    7,
    NULL,
    308
),
(
    @exam_id,
    'reading_b',
    45,
    'matching',
    'Many gamers know their passion for playing games has shaped their identity.',
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
-- 答案：46-A 47-D 48-B 49-C 50-C / 51-D 52-B 53-A 54-C 55-D
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
    'What do we learn about advertising campaigns from the snack food companies?',
    'Junk food is now a staple of many Americans'' diets. Advertising campaigns from the snack food companies, often featuring sports stars, send the message that we can neutralize any negative effects of consuming their products simply by getting more physical exercise. But recent studies show a lack of exercise is not to blame for rising obesity rates. Bad diets are.

Interventions to help reduce junk food consumption are especially important for children and teenagers. Prevention is better than cure because obesity is so difficult to treat. Unfortunately, while health education has shown some success among young children, teens have been harder to reach.

Now a large-scale study has tried an innovative approach to change teenagers'' attitudes towards healthy eating, and the results are promising. The researchers argued that previous interventions have probably been unsuccessful because of a major flaw: they focused on a future, healthier you and assumed that this would be enough motivation for teenagers. In contrast, the new intervention cleverly exploits teenagers'' instinct for rebelliousness and autonomy, and the value they place on social justice.

To do this, researchers had students read an article on the food industry. It revealed a secret about the manipulative and deceptive strategies used to make junk food more addictive and characterize the products as healthy. The article also explained how advertising campaigns specifically target very young and poor people, causing harm for these vulnerable groups. Afterwards, the participants read a fictional survey of teens who wanted to “fight back against the companies by buying and eating less processed food”.

After the intervention, participants associated healthy eating with autonomy and social justice. The teenagers also rated healthy eating as being more appealing. Importantly, there were also some promising effects of the new intervention on actual behavior. A day later the students were offered a choice of snacks and drinks in a seemingly unrelated context. The teens chose healthy snacks and drinks such as fruit or water more often over unhealthy options like biscuits and soda. Apparently associating a healthy diet with teenagers'' own values seems to be a promising avenue to prevent obesity.',
    'They convey the idea that their products are ok if consumers exercise more.',
    'They send the message that bad diets are responsible for Americans'' obesity.',
    'They usually feature sports stars to emphasize the benefits of their snack foods.',
    'They claim that lack of exercise is to blame for the increasing obesity rates.',
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
    'What does the passage say about health education?',
    NULL,
    'It has shed light on teens'' instinct for rebellion and autonomy.',
    'It has placed much more emphasis on cure than on prevention.',
    'It has contributed little to the campaigns against obesity.',
    'It has largely failed to turn teens away from junk food.',
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
    'What is a major flaw in previous interventions to help reduce junk food consumption?',
    NULL,
    'They motivated teens to stay away from junk food only temporarily.',
    'They focused on the benefits young people would reap in the future.',
    'They were based on the assumption that motivation was the only key.',
    'They were incapable of appealing to teens'' instinct for rebelliousness.',
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
    'In what way is the new intervention innovative?',
    NULL,
    'It emphasizes people''s sense of social responsibility.',
    'It cleverly exploits teenagers'' personal weaknesses.',
    'It takes advantage of teenagers'' natural inclination.',
    'It promises immediate rather than future benefits.',
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
    'What conclusion can be drawn from the new research?',
    NULL,
    'A totally different approach could be adopted to combat advertising campaigns for snack food.',
    'An effective intervention has to be found to persuade teenagers to switch to a healthier lifestyle.',
    'Obesity can be hopefully prevented by building links between teenagers'' values and healthy eating.',
    'An innovative way to beat obesity is to expose food companies'' manipulative and deceptive practices.',
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
    'What do scientists think of REM?',
    'Adults dream during REM, or rapid eye movement, sleep and infants have loads of REM. So, it might be fair to assume that babies have tons of dreams.

But scientists believe REM serves a completely different purpose for newborns and infants than dreaming. When babies are in REM, it allows their brain to develop pathways, connections, and eventually, learn languages.

Since your baby doesn''t dream at this stage of brain development, it''s safe to assume babies do not have nightmares, either. Nightmares stem from exposure to trauma, an overactive imagination, and the normal stresses of everyday life.

Are you wondering, what do babies dream about? Good question, but the answer is nothing!

So, when do babies start dreaming? The general consensus is that they start dreaming around the age of two. Psychologist David Foulkes studies children, from very small kids to teens, to bring the secrets of their dreams to the light of day. In his lab, he lets kids fall asleep and then wakes them 3 times a night and asks them to describe what they recall.

Foulkes'' findings are unsurprising. Basically, little kids have little dreams. But exactly what kids see while dreaming depends on their age. As children develop and grow, their dreams do too.

Dreams of very small kids are usually just snapshots, looking much more like a slideshow than a movie, when compared to the dreams of adults. They heavily feature animals and other familiar sights, like images of people eating. According to Foulkes, “Children''s dream life...seems to be similar to their waking imagination and narration.” Kids ages 5-9 begin seeing moving images and characters in action. Dreams now include multiple events strung together, one after the other. They also start developing greater ability to remember dreams. Still, that''s not always the case: When roused during REM sleep, 25% of the kids in Foulkes'' studies had no recollection of dreaming, a trend that continues through age 9.

So, if your baby seems to be in a stressful state while sleeping or is upset upon waking, there may be other factors at play.',
    'It is a sign of dreaming in adults and infants alike.',
    'It is essential to human beings'' language learning.',
    'It determines the formation of connections in the brain.',
    'It performs a different function in babies than in adults.',
    'D',
    7,
    NULL,
    405
),
(
    @exam_id,
    'reading_c',
    52,
    'single_choice',
    'What can we infer about nightmares from the passage?',
    NULL,
    'They occur often in people with an active imagination.',
    'They occur in people suffering from emotional stress.',
    'They vary in different stages of brain development.',
    'They appear in the sleep of both adults and infants.',
    'B',
    7,
    NULL,
    406
),
(
    @exam_id,
    'reading_c',
    53,
    'single_choice',
    'What is the aim of psychologist David Foulkes'' study?',
    NULL,
    'To reveal the secrets of children''s dreams.',
    'To see if children start dreaming at age two.',
    'To solve the mystery of dreaming and brain growth.',
    'To confirm the general consensus on when kids dream.',
    'A',
    7,
    NULL,
    407
),
(
    @exam_id,
    'reading_c',
    54,
    'single_choice',
    'What are Foulkes'' findings about kids'' dreams?',
    NULL,
    'They feature strange animals.',
    'They are unsurprising to adults.',
    'They grow and evolve with age.',
    'They reflect kids'' waking life.',
    'C',
    7,
    NULL,
    408
),
(
    @exam_id,
    'reading_c',
    55,
    'single_choice',
    'What can we assume about babies who appear upset upon waking?',
    NULL,
    'They have been roused against their will.',
    'They have been disturbed by a nightmare.',
    'They have trouble recollecting the images of their dreams.',
    'They have been affected by something other than dreaming.',
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
    '近年来，“城市漫步(city walk)”在中国的年轻人中悄然兴起，已成为一种旅游新潮流。与传统旅游不同，城市漫步不追求在短时间内游览尽可能多的景点，而是随意行走或按照主题路线漫步在城市的大街小巷。漫步者品尝地道小吃，欣赏特色建筑，了解当地生活方式。他们还用相机或手机记录城市的风景和人物。这种旅游方式能让城市漫步者更深入了解城市的历史与文化。',
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
