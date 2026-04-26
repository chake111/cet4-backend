-- ============================================================
-- 迁移：将听力音频从本地 public 目录改为 OSS 对象存储
-- 执行前提：已将听力音频上传至 OSS
--   Bucket: cet4-audio
--   Region: oss-cn-guangzhou
-- ============================================================

USE cet4_platform;

-- 将所有听力题的 audio_url 更新为 OSS 公开 URL
UPDATE `question`
SET `audio_url` = 'https://cet4-audio.oss-cn-guangzhou.aliyuncs.com/audio/cet4/2025/06/set1/2025%E5%B9%B46%E6%9C%88%E5%9B%9B%E7%BA%A7%E5%90%AC%E5%8A%9B-%E7%AC%AC1%E5%A5%97.mp3'
WHERE `exam_id` = 1
  AND `part` = 'listening';

-- 验证：应只返回一个 OSS URL
SELECT DISTINCT `audio_url`
FROM `question`
WHERE `exam_id` = 1
  AND `part` = 'listening';
