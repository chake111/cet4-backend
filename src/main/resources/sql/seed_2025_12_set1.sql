-- ============================================================
-- 2025年12月大学英语四级真题第1套 种子数据
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
VALUES ('2025年12月大学英语四级真题第1套', 2025, 12, 1, 130, 710, 1);

SET @exam_id = LAST_INSERT_ID();

SET @audio_url = 'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/12/set1/2025%E5%B9%B412%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B%E7%AC%AC1%E5%A5%97.mp3';

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
    'Directions: Suppose the student union of your university is collecting opinions on improving its work for the coming year. You are now to write a response by suggesting how it can better enrich student life. You will have 30 minutes to write the essay. You should write at least 120 words but no more than 180 words.',
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
-- 答案：1-B 2-A 3-B 4-D 5-C 6-A 7-C 8-A 9-D 10-B
--      11-D 12-C 13-A 14-B 15-A 16-C 17-D 18-B
--      19-C 20-C 21-D 22-C 23-A 24-C 25-B
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
    'At the gate of a grade school in Kent.',
    'Under the engine cover of a man''s car.',
    'Inside the car of David King''s neighbour.',
    'Outside the office of a charity foundation.',
    'B',
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
    'It got reunited with its owner.',
    'It was injured during the rescue.',
    'It was placed in the care of a UK charity.',
    'It became a pet of Mr. King''s grandson.',
    'A',
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
    'The reunion of this year''s Olympic gold medalists.',
    'The opening of the Special Olympics Spring Games.',
    'The first important political event in the next five years.',
    'The 100th anniversary celebration of Methodist University.',
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
    'Volunteers visit the Games'' website to sign up.',
    'Children play in a fun tent and enjoy themselves fully.',
    'Organizers devote their time and energy to the Games.',
    'Athletes with special needs triumph in the Games.',
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
    'Compensate for the Swiss manufacturer''s loss.',
    'Change the wrapping of its commodities.',
    'Destroy its imitation chocolate rabbits.',
    'Defend itself in the country''s commercial court.',
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
    'It could be reused in other products.',
    'It could be resold cheaper to avoid waste.',
    'It could be reshaped into animals other than rabbits.',
    'It could be rewrapped and sold by the budget supermarket.',
    'A',
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
    'To be fair to the German supermarkets.',
    'To protect chocolate retailers'' interests.',
    'To prevent consumers'' possible confusion.',
    'To boost the growth of the chocolate industry.',
    'C',
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
    'Pass a book to him.',
    'Make a vegetable dish.',
    'Return the handbook to him.',
    'Meet his sister''s boyfriend.',
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
    'It doesn''t sound practical for her.',
    'It would do harm to one''s muscles.',
    'It would reduce one''s protein intake.',
    'It doesn''t seem to be a balanced diet.',
    'D',
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
    'To improve his health.',
    'To protect animal rights.',
    'To stick to his religious belief.',
    'To follow a trendy lifestyle.',
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
    'The torture and distress dolphins suffer in parks.',
    'The urgency of joining an animal rights group.',
    'The gloomy environments animals are kept in.',
    'The necessity of having zoos and eating meat.',
    'D',
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
    'The part about not eating on board the plane.',
    'The part about air travel in the past.',
    'The part about getting over jetlag.',
    'The part about avoiding sleeping on the plane.',
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
    'Try following the advice given by the expert on the show.',
    'Concentrate on reading articles recommended by experts.',
    'Have meals as usual to stay away from hunger.',
    'Take a nap to adjust to a new time zone.',
    'A',
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
    'She has been well treated when traveling.',
    'She does not have to worry about jetlag.',
    'She can spend a lot of time vacationing.',
    'She does not have any problem flying.',
    'B',
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
    'It affects twenty-five percent of people.',
    'It has long been ignored by many experts.',
    'It impacts female travelers more seriously.',
    'It has caused heavy losses to many airlines.',
    'A',
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
    'Learning from skilled designers.',
    'Joining a 6-month training camp.',
    'Obtaining real-world experience.',
    'Anticipating actual challenges.',
    'C',
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
    'Core skills.',
    'Higher education.',
    'Capability.',
    'Adaptability.',
    'D',
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
    'Face challenges.',
    'Start anywhere.',
    'Pursue roles in teams.',
    'Follow their own path.',
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
    'To allow students more freedom in their academic work.',
    'To enable teachers to interact more with their students.',
    'To engage students more in their learning.',
    'To respond actively to students'' requests.',
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
    'Rearranging most traditional chairs and desks.',
    'Adopting a variety of different seating options.',
    'Shifting from traditional teaching to task-based learning.',
    'Using new furniture to create a comfortable environment.',
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
    'A change to teachers'' opinion of their students.',
    'A harmonious relationship among its students.',
    'A strengthened effect of its discipline.',
    'A win for all people involved.',
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
    'They arrived late for their first day of school.',
    'They weren''t informed of the school''s updated rules.',
    'They answered their headteacher''s email in an impolite way.',
    'They didn''t wear the shoes required by the school''s new policy.',
    'C',
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
    'Panic.',
    'Anger.',
    'Disputes.',
    'Riots.',
    'A',
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
    'They rendered the school unique in the district.',
    'They enhanced the positive image of the school.',
    'They improved student behavior and performance.',
    'They strengthened the school''s discipline and order.',
    'C',
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
    'Tighten her monthly budget.',
    'Turn to her parents for help.',
    'Borrow 65 pounds from her friend.',
    'Postpone paying her other bills.',
    'B',
    7,
    @audio_url,
    124
);

-- ============================================================
-- Step 4: Part III Reading Comprehension Section A 选词填空
-- 第26-35题
-- 词库：
-- A) approximately  B) case        C) chance      D) confused
-- E) crucial        F) deposited   G) enter       H) invest
-- I) matter         J) presented   K) range       L) regular
-- M) seize          N) selection   O) ultimately
--
-- 答案：26-C 27-N 28-D 29-H 30-J 31-E 32-I 33-O 34-G 35-K
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
    '{"article": "People tend to want as many choices as possible. They believe this will maximize their {26} of making the best decision. But research shows that, when it comes to actually making a {27} from all of these choices, people can become {28} and avoid making a decision altogether. Even worse, when people finally do decide, they are generally less satisfied with their decision and feel more regretful over whatever choice they made.\n\nWhy does this happen? Research shows that when people choose from many options, they {29} more in the decision, but feel less confident in their ability to decide well. In other words, when we are {30} with more choices, making the “right” or “correct” decision begins to feel more {31} and, at the same time, more difficult to do. This may contribute to the deep fear that we will make the wrong decision.\n\nHow can we solve this problem? I believe this fear could be tempered by putting decisions into perspective. It might help to remember that many of the choices you make, such as what to have for lunch, will not {32} much in the future and that, even more important choices, like accepting a new job, can {33} be changed. It could also help to {34} these situations with clear guidelines and ideas of what you want from the {35} of options, which can narrow the possible choices, and also make you more confident about your ability to make the right decision.", "word_bank": ["approximately", "case", "chance", "confused", "crucial", "deposited", "enter", "invest", "matter", "presented", "range", "regular", "seize", "selection", "ultimately"]}',
    NULL, NULL, NULL, NULL,
    'chance',
    7,
    NULL,
    200
),
(
    @exam_id,
    'reading_a',
    27,
    'blank_filling',
    'But research shows that, when it comes to actually making a {27} from all of these choices, people can become confused and avoid making a decision altogether.',
    NULL,
    NULL, NULL, NULL, NULL,
    'selection',
    7,
    NULL,
    201
),
(
    @exam_id,
    'reading_a',
    28,
    'blank_filling',
    'People can become {28} and avoid making a decision altogether.',
    NULL,
    NULL, NULL, NULL, NULL,
    'confused',
    7,
    NULL,
    202
),
(
    @exam_id,
    'reading_a',
    29,
    'blank_filling',
    'Research shows that when people choose from many options, they {29} more in the decision, but feel less confident in their ability to decide well.',
    NULL,
    NULL, NULL, NULL, NULL,
    'invest',
    7,
    NULL,
    203
),
(
    @exam_id,
    'reading_a',
    30,
    'blank_filling',
    'In other words, when we are {30} with more choices, making the right or correct decision begins to feel more crucial.',
    NULL,
    NULL, NULL, NULL, NULL,
    'presented',
    7,
    NULL,
    204
),
(
    @exam_id,
    'reading_a',
    31,
    'blank_filling',
    'Making the right or correct decision begins to feel more {31} and, at the same time, more difficult to do.',
    NULL,
    NULL, NULL, NULL, NULL,
    'crucial',
    7,
    NULL,
    205
),
(
    @exam_id,
    'reading_a',
    32,
    'blank_filling',
    'It might help to remember that many of the choices you make, such as what to have for lunch, will not {32} much in the future.',
    NULL,
    NULL, NULL, NULL, NULL,
    'matter',
    7,
    NULL,
    206
),
(
    @exam_id,
    'reading_a',
    33,
    'blank_filling',
    'Even more important choices, like accepting a new job, can {33} be changed.',
    NULL,
    NULL, NULL, NULL, NULL,
    'ultimately',
    7,
    NULL,
    207
),
(
    @exam_id,
    'reading_a',
    34,
    'blank_filling',
    'It could also help to {34} these situations with clear guidelines and ideas of what you want.',
    NULL,
    NULL, NULL, NULL, NULL,
    'enter',
    7,
    NULL,
    208
),
(
    @exam_id,
    'reading_a',
    35,
    'blank_filling',
    'Clear guidelines and ideas of what you want from the {35} of options can narrow the possible choices.',
    NULL,
    NULL, NULL, NULL, NULL,
    'range',
    7,
    NULL,
    209
);

-- ============================================================
-- Step 5: Part III Reading Comprehension Section B 长篇阅读
-- 第36-45题
-- 答案：36-E 37-K 38-C 39-O 40-G 41-D 42-L 43-J 44-A 45-H
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
    'An increasing amount of data indicates that installing bike lanes raises local business revenues.',
    'The battle over bike lanes needs a mindset shift

A) Five years ago, the city of Queens, New York, announced that it would be putting bike lanes onto a stretch of Skillman Ave—and removing 116 parking spots. Cyclists loved the plan, but local business owners got very angry. Taking out those parking spots, as they argued at protests and in letters to the city council, would ruin stores and restaurants along Skillman. “Parking here is already a nightmare,” one shouted at a protest rally.

B) But the bike lanes were a done deal, and soon they were in place. Early this year, Jesse Coburn—an investigative writer with Streetsblog New York—wondered whether those predictions of economic collapse came true. So he asked the city''s Department of Finance to give him a few years'' worth of sales figures for that stretch of Skillman Ave. How had the businesses on that street fared?

C) Quite well, it turns out. In the year after the bike lanes arrived, businesses on Skillman saw sales rise by 12 percent, compared to 3 percent for Queens in general. What''s more, that section of road saw new businesses open, while Queens overall had a net loss.

D) The thing is, the actual merchants along Skillman? They didn''t believe it. When Coburn spoke to them and described what he''d found, only a few store owners admitted the lanes had helped. Many still insisted the lanes were killing their part of the city. And emotions ran hot: Someone scattered tacks on the bike lane.

E) This little story turns out to be a fascinating glimpse at the challenges cities face as they try to update their urban infrastructure—to clean up the air, reduce greenhouse emissions, and speed up travel by making towns more bike-friendly. There''s a rising amount of data showing that installing bike lanes and making streets more pedestrian-friendly boosts the economic fortunes of a place. Removing cars and parking spots works. But the folks who run local businesses simply aren''t convinced, even when their own street performs. Given that sort of mess, can political fights over bike lanes ever end?

F) In 2013, researchers at New York City''s Department of Transportation studied seven stretches of road that had installed bike lanes or created pedestrian-friendly areas. The city analyzed the data for businesses along those routes and found that by the third year, sales grew faster on five of the streets than in the district overall, on average—up to five times faster, in fact.

G) Beyond New York, a survey of research from 23 cities found that bike lanes and pedestrian-friendly design didn''t hurt local retail and food stores. “Fears of disastrous consequences for local businesses are unfounded,” the researchers concluded. More recent work has shown roughly the same.

H) The truth is that in fairly dense areas, bikes are more efficient at moving people around. You might lose one car driver''s business—but you gain shoppers who now can arrive more easily on bikes. “Cyclists and pedestrians are consumers too,” notes Professor Susan Handy. Plus, streets redesigned for bikes and pedestrians tend to become more pleasant places to hang around, so “in a lot of cases, that''s created much nicer environments that are really good for those businesses.”

I) Mom-and-pop shops are usually pretty quick at recognizing situations that will help their bottom lines. So why the blind spot here? Perhaps it''s that attention focuses on horror stories—and some merchants do get hit when bike lanes come in.

J) I spoke to Cindy Hughes, a hairdresser in Cambridge, Massachusetts. She said business fell by at least 40 percent when the city removed nearby parking to put in a bike lane. The majority of her customers drive, with many coming from nearby towns. Only a very few have shifted to cycling, and even those almost certainly won''t cycle in Boston''s snowy winters. So while Hughes supports bike lanes—“cyclists deserve to be safe”—she sees the parking loss as an existential risk. “Look, 90 percent of my customers drive,” she told me. “For our business, the bike lanes are way worse than Covid was.”

K) For others, the pushback is cultural, says Henry Grabar, a writer for the Slate Magazine. Small business owners are frequently drivers who commute from other parts of the city by car, Grabar points out. They''re also often longtime locals. “They tend to be people with deep roots in the city, who have hung around since before the neighborhood became what it is today,” he adds. Driving around town in a car is so normal to them that cycling seems weird and unusual—despite its boost from Covid, when bike sales exploded by 75 percent.

L) Psychology beats all! Who knew, right? The fierce divide between store owners and bike-lane advocates seems similar to our larger culture wars over climate change. If we''ve learned anything about culture wars, it''s that data isn''t much good at changing minds.

M) When Janette Sadik-Khan was the head of New York City''s Transportation Department back in the early 2000s, she oversaw a rollout of bike lanes—and got angry blowback from residents and business owners who claimed there weren''t enough cyclists to justify installing lanes. Now, she notes ironically, the lanes are so full of activity that opponents have turned to claiming the problem is the opposite: There are too many cyclists getting in the way of cars.

N) Maybe bike lanes will always be charged with emotion, until enough of the public is finally concerned about climate change—and it seems reckless to not have them.

O) Crises, after all, have a way of opening people''s eyes to possibilities. During Covid, restaurants and cafes lost so much business that cities nationwide began allowing them to build curbside seating areas where people could sit, safely, in the open air. It greatly reduced parking—but because, well, shop owners didn''t see any way around it. Customers loved the outdoor seating so much that cities are making it permanent: A New York City study of several streets closed during Covid found storeowners making more than before, and diners enjoying the outdoor lifestyle. If data won''t change minds, customers might.',
    NULL, NULL, NULL, NULL,
    'E',
    7,
    NULL,
    300
),
(
    @exam_id,
    'reading_b',
    37,
    'matching',
    'According to a magazine writer, some small business owners'' resistance to bike lanes arises from cultural factors.',
    NULL,
    NULL, NULL, NULL, NULL,
    'K',
    7,
    NULL,
    301
),
(
    @exam_id,
    'reading_b',
    38,
    'matching',
    'A stretch of Skillman Ave witnessed not only a big increase in sales but also the opening of new businesses.',
    NULL,
    NULL, NULL, NULL, NULL,
    'C',
    7,
    NULL,
    302
),
(
    @exam_id,
    'reading_b',
    39,
    'matching',
    'When people have no way out in crises, they are more likely to embrace changes.',
    NULL,
    NULL, NULL, NULL, NULL,
    'O',
    7,
    NULL,
    303
),
(
    @exam_id,
    'reading_b',
    40,
    'matching',
    'According to one survey, city design with bike lanes and pedestrian space did not negatively impact local businesses.',
    NULL,
    NULL, NULL, NULL, NULL,
    'G',
    7,
    NULL,
    304
),
(
    @exam_id,
    'reading_b',
    41,
    'matching',
    'Despite increased business activity on Skillman Ave, many store owners insisted the bike lanes were destroying their area.',
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
    'In a war of culture, data does not help much in changing people''s minds.',
    NULL,
    NULL, NULL, NULL, NULL,
    'L',
    7,
    NULL,
    306
),
(
    @exam_id,
    'reading_b',
    43,
    'matching',
    'A businesswoman said her business dropped sharply when parking space gave way to a bike lane, because most of her customers came by car.',
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
    'Local business owners on Skillman Ave argued that their businesses would be ruined when parking spots were replaced by bike lanes.',
    NULL,
    NULL, NULL, NULL, NULL,
    'A',
    7,
    NULL,
    308
),
(
    @exam_id,
    'reading_b',
    45,
    'matching',
    'People may find it more pleasant to wander around streets redesigned for cycling and walking.',
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
-- 答案：46-A 47-C 48-A 49-B 50-A / 51-A 52-C 53-D 54-B 55-D
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
    'What do we learn from the passage about the timing of our behaviors?',
    'All living organisms on Earth are exposed to a 24-hour day-night cycle. This cycle is the reason why people rest at night and are active during the day. Consequently, all human body functions also follow this daily rhythm, and the timing of behaviors like exercise or food intake can significantly influence your health. For example, eating at night can lead to weight gain over time because food intake at night leads to increased fat storage.

Many drug targets in the body follow a 24-hour cycle, too. This means that the specific proteins a drug is designed to modify can react differently to the medicine over the course of a 24-hour time period. Because how the body responds to a drug can differ depending on the time it is taken, it logically follows that taking medicines at specific times could help increase their effectiveness and reduce unwanted side effects.

When doctors prescribe medicine for people, they rarely consider the best time to take it. There are two main reasons for that oversight. First, many physicians are not aware that some drugs work better during a specific time of the day. And second, most drugs have not been studied for possible different effects during a 24-hour cycle. Therefore, patients are directed to take most drugs during the morning or evening primarily to ensure compliance.

Over 50 years ago, researchers found that the cholesterol drug simvastatin is more effective at lowering cholesterol levels when taken at night rather than during the day. This is because the liver enzyme these drugs target is more active at night.

Taking medicine at the wrong time can even cause harm. My colleagues and I wondered whether midazolam, the most common sedative used in surgical procedures worldwide, might interfere with the internal clock that protects the heart at night. Currently, there are no guidelines regarding when midazolam should be administered.

More research is needed to determine the best times to administer treatments for different diseases. I believe taking drug timing into account could help make treatments more effective and help more people worldwide.',
    'It has a considerable impact on our health.',
    'It confines us to a 24-hour day-night cycle.',
    'It requires us to follow a particular rhythm.',
    'It holds the key to all human body functions.',
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
    'What does the author say about the proteins in our body?',
    NULL,
    'They can modify the effects of medicines in different ways.',
    'They can reduce unwanted side effects of certain medicines.',
    'Their reaction to medicines changes during the day-night cycle.',
    'Their design determines how differently they react to medicines.',
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
    'What do doctors do when prescribing medicine for people?',
    NULL,
    'They give little thought to the time of taking it for maximum effect.',
    'They rarely consider which medicine works better for which patient.',
    'They tell patients its possible side effects during a period of 24 hours.',
    'They tell patients to comply with the directions of drug manufacturers.',
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
    'Why do doctors advise patients to take most drugs in the morning or in the evening?',
    NULL,
    'To discourage them from making complaints.',
    'To ensure they take the drugs as instructed.',
    'To comply with new research findings strictly.',
    'To guarantee the maximum effect of the drugs.',
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
    'What does the author suggest near the end of the passage?',
    NULL,
    'Considering drug-taking timing when prescribing drugs for patients.',
    'Making treatments less complex by taking drug timing into account.',
    'Conducting more studies to find out the best timing for treating different diseases.',
    'Finding out the most effective drugs for treating diseases through further research.',
    'A',
    7,
    NULL,
    404
),
(
    @exam_id,
    'reading_c',
    51,
    'single_choice',
    'What do we learn from the passage about the economics professor and her hairdresser?',
    'Katharine Abraham, an economics professor, was chatting with her hairdresser about retirement plans. The economist said she plans to continue working because she wants to. The hairdresser agreed but for a different reason: She needs the money.

Both scenarios are contributing to a big increase in the number of people in the US working into their 70s. Over the past 20 years, the share of Americans working in their 70s has risen from less than 10% to nearly 15%.

In addition to people being healthier and living much longer, economists say that a combination of financial considerations such as years of slow rise in real wages and a shift away from traditional pensions in the private sector are some of the reasons people delay retirement. The decline of manufacturing and the increase in the number of people working in less labor-intensive occupations also has contributed to the trend, says Abraham, who researches work and retirement decisions of older Americans.

“Which matters more depends on what your history up until that point has been in the type of work you''re doing,” Abraham says.

The overall trend is hitting Americans of all different levels of educational attainment, although the percentages vary by category. The share of Americans with bachelor''s degrees who were working into their 70s reached nearly 20% in 2018. For those with a high school degree or less, the proportion of those working in their 70s had risen to around 10%, while those with some college education were in the middle at around 15%.

Martin Neil Baily, an economist who is leading a research project on retirement security, notes that quitting a career can lead to feelings of isolation and loneliness, particularly for men. He suggests that many college-educated workers are choosing to stay in the labor force more for social benefits than for financial reasons. They''re also more likely to be in professional occupations where they tend to enjoy their work more.

Workers in more physical jobs, meanwhile, may be more likely to look forward to retiring, Baily says, suggesting those who stay on are more likely doing so for financial reasons.',
    'They differ in their reasons for continuing to work.',
    'They are both committed to working into their 70s.',
    'They are happy about their current financial situation.',
    'They hold different views about postponing retirement.',
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
    'What is one of the reasons for people to delay retirement?',
    NULL,
    'More and more people have switched to less intellectually challenging jobs.',
    'The number of jobs suitable for older people has increased in the private sector.',
    'The rate of wage increase in terms of purchasing power has slowed down for years.',
    'More and more people in the workplace find it hard to rely on traditional pensions.',
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
    'What is the general trend in people delaying retirement?',
    NULL,
    'The higher their earnings, the more likely they are tempted to delay retirement.',
    'Those who have more job satisfaction tend to retire later than those who have less.',
    'More men than women are likely to stay in the labor force until their late seventies.',
    'The higher their educational level, the more likely they are to delay retirement.',
    'D',
    7,
    NULL,
    407
),
(
    @exam_id,
    'reading_c',
    54,
    'single_choice',
    'What is the chief reason for college-educated workers delaying retirement according to an economist?',
    NULL,
    'Enjoying financial security.',
    'Staying connected socially.',
    'Contributing more professionally.',
    'Increasing social security payments.',
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
    'What does the passage say about people doing manual work?',
    NULL,
    'They are eager to enjoy life after retiring.',
    'They are likely to have financial troubles.',
    'They generally don''t enjoy doing it.',
    'They tend to anticipate retirement.',
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
    '近年来，中国政府高度重视民营经济(private economy)的发展，出台了一系列政策支持民营企业。截至2025年3月底，全国民营企业数量超过5700万家，占企业总量的92.3%。民营企业不仅数量稳步增长，质量和结构也在不断提升。民营企业的研发投入不断增加，在新一代信息技术、人工智能等领域发展迅速。民营企业核心竞争力的增强为中国经济的高质量发展提供了有力支撑。',
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
