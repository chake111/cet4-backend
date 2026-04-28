SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS cet4_platform DEFAULT CHARSET utf8mb4;
USE cet4_platform;

DROP TABLE IF EXISTS `user_answer`;
DROP TABLE IF EXISTS `exam_record`;
DROP TABLE IF EXISTS `question`;
DROP TABLE IF EXISTS `exam`;
DROP TABLE IF EXISTS `user`;

-- 用户表：存储平台用户基础信息
CREATE TABLE `user` (
    `id`          BIGINT AUTO_INCREMENT PRIMARY KEY,
    `username`    VARCHAR(50) UNIQUE NOT NULL,
    `password`    VARCHAR(100) NOT NULL,
    `avatar`      VARCHAR(200),
    `role`        VARCHAR(20) DEFAULT 'student',
    `deleted`     TINYINT DEFAULT 0,
    `created_at`  DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 试卷表：存储四级考试试卷信息
CREATE TABLE `exam` (
    `id`           BIGINT AUTO_INCREMENT PRIMARY KEY,
    `title`        VARCHAR(100) NOT NULL,
    `year`         INT NOT NULL,
    `month`        INT NOT NULL,
    `set_no`       TINYINT NOT NULL,
    `duration`     INT DEFAULT 130,
    `total_score`  INT DEFAULT 710,
    `status`       TINYINT DEFAULT 0,
    `created_at`   DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 题目表：存储试卷中的题目信息
CREATE TABLE `question` (
    `id`              BIGINT AUTO_INCREMENT PRIMARY KEY,
    `exam_id`         BIGINT NOT NULL,
    `part`            VARCHAR(20) NOT NULL,
    `question_no`     INT NOT NULL,
    `question_type`   VARCHAR(20) NOT NULL,
    `content`         TEXT,
    `passage`         TEXT,
    `option_a`        VARCHAR(500),
    `option_b`        VARCHAR(500),
    `option_c`        VARCHAR(500),
    `option_d`        VARCHAR(500),
    `correct_answer`  VARCHAR(20),
    `score`           INT NOT NULL,
    `audio_url`       VARCHAR(300) DEFAULT NULL,
    `sort_order`      INT NOT NULL,
    `deleted`         TINYINT DEFAULT 0,
    `created_at`      DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY `idx_question_exam_id` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 考试记录表：存储用户参加试卷的作答过程与结果
CREATE TABLE `exam_record` (
    `id`           BIGINT AUTO_INCREMENT PRIMARY KEY,
    `user_id`      BIGINT NOT NULL,
    `exam_id`      BIGINT NOT NULL,
    `paper_id`     VARCHAR(50) DEFAULT NULL,
    `start_time`   DATETIME NOT NULL,
    `submit_time`  DATETIME DEFAULT NULL,
    `total_score`  INT DEFAULT NULL,
    `answers`      JSON DEFAULT NULL,
    `status`       VARCHAR(20) NOT NULL,
    `created_at`   DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY `idx_exam_record_user_id` (`user_id`),
    KEY `idx_exam_record_exam_id` (`exam_id`),
    KEY `idx_exam_record_user_exam` (`user_id`, `exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 用户答题记录表：存储用户对每道题的作答与批改信息
CREATE TABLE `user_answer` (
    `id`              BIGINT AUTO_INCREMENT PRIMARY KEY,
    `exam_record_id`  BIGINT NOT NULL,
    `user_id`         BIGINT NOT NULL,
    `question_id`     BIGINT NOT NULL,
    `user_answer`     TEXT,
    `is_correct`      TINYINT DEFAULT NULL,
    `score`           INT DEFAULT NULL,
    `ai_score`        INT DEFAULT NULL,
    `ai_feedback`     TEXT,
    `created_at`      DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY `idx_user_answer_exam_record_id` (`exam_record_id`),
    KEY `idx_user_answer_user_id` (`user_id`),
    KEY `idx_user_answer_question_id` (`question_id`),
    UNIQUE KEY `uk_user_answer_record_question` (`exam_record_id`, `question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
