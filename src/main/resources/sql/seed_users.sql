SET NAMES utf8mb4;
USE cet4_platform;

-- 插入模拟用户数据
-- 密码均为: 123456 (BCrypt加密后的哈希值)
INSERT INTO `user` (`username`, `password`, `avatar`, `role`, `deleted`, `created_at`) VALUES
('student1', '$2a$10$kqUkT/7x/LntsBLmo0RWm.1Zw5D8qlcnlhqJoGfZbGiK34uW.t/9G', NULL, 'student', 0, NOW()),
('student2', '$2a$10$kqUkT/7x/LntsBLmo0RWm.1Zw5D8qlcnlhqJoGfZbGiK34uW.t/9G', NULL, 'student', 0, NOW()),
('student3', '$2a$10$kqUkT/7x/LntsBLmo0RWm.1Zw5D8qlcnlhqJoGfZbGiK34uW.t/9G', NULL, 'student', 0, NOW()),
('admin1', '$2a$10$kqUkT/7x/LntsBLmo0RWm.1Zw5D8qlcnlhqJoGfZbGiK34uW.t/9G', NULL, 'admin', 0, NOW()),
('testuser', '$2a$10$kqUkT/7x/LntsBLmo0RWm.1Zw5D8qlcnlhqJoGfZbGiK34uW.t/9G', NULL, 'student', 0, NOW());
