/*
 Navicat Premium Data Transfer

 Source Server         : wh-docker-mysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 101.132.71.171:3307
 Source Schema         : roothub

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 18/02/2020 09:57:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`admin_user_id`) USING BTREE,
  UNIQUE INDEX `uk_admin_user_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, '启明星', '$2a$10$waYCoB9KgvjfSE3wEaSgbOvinhQHZ9cNSuwM/ydjQvSepgCKzHA92', '/resources/images/default-avatar.jpg', '2019-02-26 11:09:57', NULL);

-- ----------------------------
-- Table structure for admin_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role_rel`;
CREATE TABLE `admin_user_role_rel`  (
  `admin_user_role_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`admin_user_role_rel_id`) USING BTREE,
  INDEX `key_admin_user_role_rel_role_id`(`role_id`) USING BTREE,
  INDEX `key_admin_user_role_rel_admin_user_id`(`admin_user_id`) USING BTREE,
  CONSTRAINT `fk_admin_user_role_rel_admin_user_id` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`admin_user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_admin_user_role_rel_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色用户关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user_role_rel
-- ----------------------------
INSERT INTO `admin_user_role_rel` VALUES (1, 1, 1, '2019-03-14 15:42:47', '2019-03-14 15:42:47');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `tid` int(11) NULL DEFAULT NULL COMMENT '主题ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NULL DEFAULT NULL COMMENT '关注者ID',
  `fid` int(11) NULL DEFAULT NULL COMMENT '被关注者ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关注表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for friend_url
-- ----------------------------
DROP TABLE IF EXISTS `friend_url`;
CREATE TABLE `friend_url`  (
  `friend_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友链url',
  `url_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友链网站名字',
  `weight` int(11) NULL DEFAULT 0 COMMENT '友链权重',
  PRIMARY KEY (`friend_url_id`) USING BTREE,
  UNIQUE INDEX `url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friend_url
-- ----------------------------
INSERT INTO `friend_url` VALUES (2, 'https://www.runoob.com/', '菜鸟教程', 16);
INSERT INTO `friend_url` VALUES (3, 'https://www.imooc.com/', '慕课网', 12);
INSERT INTO `friend_url` VALUES (4, 'https://www.w3cschool.cn/', 'W3C', 10);
INSERT INTO `friend_url` VALUES (5, 'https://pintia.cn/', 'PTA', 18);
INSERT INTO `friend_url` VALUES (6, 'https://www.jisuanke.com/', '计蒜客', 14);
INSERT INTO `friend_url` VALUES (7, 'https://www.nowcoder.com/', '牛客网', 18);
INSERT INTO `friend_url` VALUES (10, 'http://192.168.9.210/acmctgu/', '校OJ', 16);
INSERT INTO `friend_url` VALUES (11, 'https://git.ctguqmx.com/user/login', 'GitLab', 20);
INSERT INTO `friend_url` VALUES (12, 'https://c.tk-xiong.com/', 'TMaD OJ', 13);
INSERT INTO `friend_url` VALUES (13, 'https://oj.ctguqmx.cn/', 'OnlineJudge', 42);
INSERT INTO `friend_url` VALUES (14, 'https://paste.ctguqmx.cn/', 'TmadPaste', 51);

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node`  (
  `node_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `node_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点编码',
  `node_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点名称',
  `avatar_normal` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点头像',
  `avatar_mini` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点小头像',
  `avatar_large` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点背景头像',
  `node_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点描述',
  `tab_id` int(11) NULL DEFAULT NULL COMMENT '板块ID',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `parent_node_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0:否 1:是',
  PRIMARY KEY (`node_id`) USING BTREE,
  UNIQUE INDEX `uk_node_title`(`node_title`) USING BTREE,
  INDEX `key_node_code`(`node_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES (1, '开发组', '开发组', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室开发组', 1, '/n/开发组', '', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (2, '智能组', '智能组', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室智能组', 1, '/n/智能组', '', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (3, '暑期答辩', '暑期答辩', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室暑期答辩', 8, '/n/暑期答辩', '答辩', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (4, '寒假答辩', '寒假答辩', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室寒假答辩', 8, '/n/寒假答辩', '答辩', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (5, '周总结', '周总结', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室周总结', 2, '/n/周总结', '周例会总结', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (6, '聊天灌水', '聊天灌水', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '聊天', 0, '/n/聊天灌水', '其他', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (7, '招新', '招新', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室招新结果', 9, '/n/招新', '通知', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (8, '答辩', '答辩', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室假期答辩', 1, '/n/答辩', '启明星工作室', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (9, '通知', '通知', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '各种通知', 0, '/n/通知', '其他', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (10, '作品', '作品', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '日常作品', 0, '/n/作品', '其他', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (11, '求助', '求助', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '一些问题或者其他的提问', 0, '/n/求助', '其他', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (12, '学习求助', '学习求助', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '学习方面的问题', 11, '/n/学习求助', '求助', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (13, '日常求助', '日常求助', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '学习之外的问题', 11, '/n/日常求助', '求助', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (14, '学期总结', '学期总结', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室学期总结', 2, '/n/学期总结', '周例会总结', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (15, '开发组学期总结', '开发组学期总结', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室开发组学期总结', 14, '/n/开发组学期总结', '学期总结', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (16, '智能组学期总结', '智能组学期总结', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室智能组学期总结', 14, '/n/学期总结', '学期总结', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (17, '开发组周总结', '开发组周总结', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室开发组周总结', 5, '/n/开发组周总结', '周总结', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);
INSERT INTO `node` VALUES (18, '智能组周总结', '智能组周总结', '/default/front/img/qmx_logo.jpg', '/default/front/img/qmx_logo.jpg', '', '启明星工作室智能组周总结', 5, '/n/智能组周总结', '周总结', '2018-11-03 11:57:18', '2019-11-21 10:56:40', 0);

-- ----------------------------
-- Table structure for node_tab
-- ----------------------------
DROP TABLE IF EXISTS `node_tab`;
CREATE TABLE `node_tab`  (
  `node_tab_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '节点板块id',
  `node_tab_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点板块编码',
  `node_tab_title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点板块名称',
  `node_tab_desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '板块描述',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除，0:否 1:是',
  `node_tab_order` int(11) NULL DEFAULT NULL COMMENT '节点板块排序',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`node_tab_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点板块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of node_tab
-- ----------------------------
INSERT INTO `node_tab` VALUES (1, 'all', '全部', '', 0, 1, '2018-05-12 10:04:43', NULL);
INSERT INTO `node_tab` VALUES (2, 'good', '精华', '', 0, 2, '2018-05-12 12:03:30', NULL);
INSERT INTO `node_tab` VALUES (3, 'newest', '最新', '', 0, 3, '2018-05-12 14:47:35', NULL);
INSERT INTO `node_tab` VALUES (4, 'noReply', '等待评论', '', 0, 4, '2018-05-12 14:55:30', NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '消息通知标识',
  `notice_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '通知标题',
  `is_read` tinyint(1) NULL DEFAULT NULL COMMENT '是否已读：0:默认 1:已读',
  `notice_author_id` int(11) NULL DEFAULT NULL COMMENT '发起通知用户id',
  `notice_author_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发起通知用户昵称',
  `target_author_id` int(11) NULL DEFAULT NULL COMMENT '要通知用户id',
  `target_author_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '要通知用户的昵称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  `notice_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '通知动作',
  `topic_id` int(11) NULL DEFAULT NULL COMMENT '话题id',
  `topic_author_id` int(11) NULL DEFAULT NULL COMMENT '话题作者id',
  `topic_section_id` int(11) NULL DEFAULT NULL COMMENT '话题板块id',
  `notice_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '通知内容',
  `status_cd` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知状态 1000:有效 1100:无效 1200:未生效',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息通知表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `permission_name_uk`(`permission_name`) USING BTREE,
  UNIQUE INDEX `permission_value_uk`(`permission_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '首页', 'index', 0, '2019-02-26 11:29:05', NULL);
INSERT INTO `permission` VALUES (2, '话题', 'topic', 0, '2019-02-26 11:29:07', NULL);
INSERT INTO `permission` VALUES (3, '评论', 'reply', 0, '2019-02-26 11:29:09', NULL);
INSERT INTO `permission` VALUES (4, '通知', 'notice', 0, '2019-02-26 11:29:12', NULL);
INSERT INTO `permission` VALUES (5, '用户', 'user', 0, '2019-02-26 11:29:15', NULL);
INSERT INTO `permission` VALUES (6, '节点', 'node', 0, '2019-02-26 11:29:18', NULL);
INSERT INTO `permission` VALUES (7, '标签', 'tag', 0, '2019-02-26 11:29:21', NULL);
INSERT INTO `permission` VALUES (8, '权限', 'permission', 0, '2019-02-26 11:29:23', NULL);
INSERT INTO `permission` VALUES (9, '系统', 'system', 0, '2019-02-26 11:29:26', NULL);
INSERT INTO `permission` VALUES (10, '后台用户', 'admin_user', 0, '2019-02-26 11:29:28', NULL);
INSERT INTO `permission` VALUES (11, '角色', 'role', 0, '2019-02-26 11:29:30', NULL);
INSERT INTO `permission` VALUES (12, '日志', 'log', 0, '2019-02-26 11:29:33', NULL);
INSERT INTO `permission` VALUES (13, '仪表盘', 'index:index', 1, '2019-02-26 11:29:35', '2019-03-06 14:36:11');
INSERT INTO `permission` VALUES (14, '话题列表', 'topic:list', 2, '2019-02-26 11:29:37', '2019-03-06 14:36:30');
INSERT INTO `permission` VALUES (15, '话题编辑', 'topic:edit', 2, '2019-02-26 11:29:40', NULL);
INSERT INTO `permission` VALUES (16, '话题删除', 'topic:delete', 2, '2019-02-26 11:29:42', NULL);
INSERT INTO `permission` VALUES (17, '话题加精', 'topic:good', 2, '2019-02-26 11:29:45', NULL);
INSERT INTO `permission` VALUES (18, '话题置顶', 'topic:top', 2, '2019-02-26 11:29:47', NULL);
INSERT INTO `permission` VALUES (19, '评论列表', 'reply:list', 3, '2019-03-03 14:22:21', NULL);
INSERT INTO `permission` VALUES (20, '评论编辑', 'reply:edit', 3, '2019-03-03 14:22:24', NULL);
INSERT INTO `permission` VALUES (21, '评论删除', 'reply:delete', 3, '2019-03-03 14:22:50', NULL);
INSERT INTO `permission` VALUES (22, '通知列表', 'notice:list', 4, '2019-03-03 14:23:28', NULL);
INSERT INTO `permission` VALUES (23, '通知删除', 'notice:delete', 4, '2019-03-03 14:23:51', NULL);
INSERT INTO `permission` VALUES (24, '用户列表', 'user:list', 5, '2019-03-03 14:24:15', NULL);
INSERT INTO `permission` VALUES (25, '用户编辑', 'user:edit', 5, '2019-03-03 14:24:29', NULL);
INSERT INTO `permission` VALUES (26, '用户删除', 'user:delete', 5, '2019-03-03 14:24:45', NULL);
INSERT INTO `permission` VALUES (27, '节点列表', 'node:list', 6, '2019-03-03 14:25:12', NULL);
INSERT INTO `permission` VALUES (28, '节点编辑', 'node:edit', 6, '2019-03-03 14:25:32', NULL);
INSERT INTO `permission` VALUES (29, '节点删除', 'node:delete', 6, '2019-03-03 14:25:49', NULL);
INSERT INTO `permission` VALUES (30, '标签列表', 'tag:list', 7, '2019-03-03 14:26:27', NULL);
INSERT INTO `permission` VALUES (31, '标签编辑', 'tag:edit', 7, '2019-03-03 14:26:41', NULL);
INSERT INTO `permission` VALUES (32, '标签删除', 'tag:delete', 7, '2019-03-03 14:26:55', NULL);
INSERT INTO `permission` VALUES (33, '权限列表', 'permission:list', 8, '2019-03-03 14:28:50', NULL);
INSERT INTO `permission` VALUES (34, '权限编辑', 'permission:edit', 8, '2019-03-03 14:29:03', NULL);
INSERT INTO `permission` VALUES (35, '权限删除', 'permission:delete', 8, '2019-03-03 14:29:16', NULL);
INSERT INTO `permission` VALUES (36, '系统设置', 'system:edit', 9, '2019-03-03 14:29:57', NULL);
INSERT INTO `permission` VALUES (37, '后台用户列表', 'admin_user:list', 10, '2019-03-03 14:30:24', NULL);
INSERT INTO `permission` VALUES (38, '后台用户编辑', 'admin_user:edit', 10, '2019-03-03 14:30:39', NULL);
INSERT INTO `permission` VALUES (39, '后台用户创建', 'admin_user:add', 10, '2019-03-03 14:30:55', NULL);
INSERT INTO `permission` VALUES (40, '后台用户删除', 'admin_user:delete', 10, '2019-03-03 14:31:25', NULL);
INSERT INTO `permission` VALUES (41, '角色列表', 'role:list', 11, '2019-03-03 14:31:54', NULL);
INSERT INTO `permission` VALUES (42, '角色编辑', 'role:edit', 11, '2019-03-03 14:32:24', NULL);
INSERT INTO `permission` VALUES (43, '角色创建', 'role:add', 11, '2019-03-03 14:32:50', NULL);
INSERT INTO `permission` VALUES (44, '角色删除', 'role:delete', 11, '2019-03-03 14:33:06', NULL);
INSERT INTO `permission` VALUES (45, '日志列表', 'log:list', 12, '2019-03-03 14:33:54', NULL);
INSERT INTO `permission` VALUES (47, '权限创建', 'permission:add', 8, '2019-03-05 16:11:20', NULL);

-- ----------------------------
-- Table structure for qmx_group
-- ----------------------------
DROP TABLE IF EXISTS `qmx_group`;
CREATE TABLE `qmx_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组别id 第一条和第二条切勿修改',
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组别名字',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qmx_group
-- ----------------------------
INSERT INTO `qmx_group` VALUES (1, '非工作室成员');
INSERT INTO `qmx_group` VALUES (2, '老师');
INSERT INTO `qmx_group` VALUES (3, '开发组');
INSERT INTO `qmx_group` VALUES (4, '智能组');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复标识',
  `rank` int(11) NOT NULL DEFAULT 0 COMMENT '等级',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论的回复的id',
  `topic_id` int(11) NULL DEFAULT NULL COMMENT '话题id',
  `total` int(11) NULL DEFAULT 0 COMMENT '回复总数',
  `topic_author_id` int(11) NULL DEFAULT NULL COMMENT '话题作者id',
  `reply_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回复内容',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '回复时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `reply_author_id` int(11) NULL DEFAULT NULL COMMENT '当前回复用户id',
  `reply_author_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前回复用户昵称',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0:默认 1:删除',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读 0:默认 1:未读',
  `is_show` tinyint(1) NULL DEFAULT 0 COMMENT '是否可见 0:默认 1:不可见',
  `reply_good_count` int(10) NULL DEFAULT 0 COMMENT '点赞',
  `reply_bad_count` int(10) NULL DEFAULT 0 COMMENT '踩数',
  `reply_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复类型',
  `reply_read_count` int(11) NULL DEFAULT NULL COMMENT '回复阅读数量',
  `status_cd` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1000' COMMENT '回复状态 1000:有效 1100:无效 1200:未生效',
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `key_topic_id`(`topic_id`) USING BTREE,
  INDEX `key_reply_author_name`(`reply_author_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回复表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uk_role_role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '2019-02-26 11:25:48', '2019-03-04 22:25:42');

-- ----------------------------
-- Table structure for role_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_rel`;
CREATE TABLE `role_permission_rel`  (
  `role_permission_rel_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_permission_rel_id`) USING BTREE,
  INDEX `key_role_permission_rel_role_id`(`role_id`) USING BTREE,
  INDEX `key_role_permission_rel_permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `fk_role_permission_rel_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_role_permission_rel_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_permission_rel
-- ----------------------------
INSERT INTO `role_permission_rel` VALUES (1, 1, 13, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (2, 1, 14, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (3, 1, 15, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (4, 1, 16, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (5, 1, 17, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (6, 1, 18, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (7, 1, 19, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (8, 1, 20, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (9, 1, 21, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (10, 1, 22, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (11, 1, 23, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (12, 1, 24, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (13, 1, 25, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (14, 1, 26, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (15, 1, 27, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (16, 1, 28, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (17, 1, 29, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (18, 1, 30, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (19, 1, 31, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (20, 1, 32, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (21, 1, 33, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (22, 1, 34, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (23, 1, 35, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (24, 1, 47, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (25, 1, 36, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (26, 1, 37, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (27, 1, 38, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (28, 1, 39, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (29, 1, 40, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (30, 1, 41, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (31, 1, 42, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (32, 1, 43, '2019-03-11 21:54:02', '2019-03-11 21:54:02');
INSERT INTO `role_permission_rel` VALUES (33, 1, 44, '2019-03-11 21:54:02', '2019-03-11 21:54:02');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `system_config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reboot` int(11) NOT NULL DEFAULT 0,
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0: 否 1: 是',
  PRIMARY KEY (`system_config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, NULL, NULL, '基础配置', 0, '', NULL, 0, 0);
INSERT INTO `system_config` VALUES (2, NULL, NULL, '上传配置', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (3, NULL, NULL, '邮箱配置', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (4, NULL, NULL, '积分配置', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (5, NULL, NULL, 'Redis配置', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (6, NULL, NULL, 'Elasticsearch配置', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (7, NULL, NULL, 'Github登录配置，<a href=\"https://github.com/settings/developers\" target=\"_blank\">申请地址</a>', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (8, NULL, NULL, 'WebSocket配置', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (9, 'base_url', 'http://localhost:8080', '网站部署后访问的域名，注意这个后面没有 \"/\"', 1, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (10, 'site_name', 'Roothub', '站点名称', 1, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (11, 'site_intro', 'Java论坛', '站点介绍', 1, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (12, 'cookie_name', 'user', 'cookie名称', 1, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (13, 'cookie_max_age', '2592000', 'cookie存活的最大时间', 1, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (14, 'cookie_domain', 'localhost', '存cookie时用到的域名，要与网站部署后访问的域名一致', 1, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (15, 'cookie_path', '/', 'cookie的路径', 1, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (16, 'page_size', '50', '分页每页条数', 1, 'number', NULL, 0, 1);
INSERT INTO `system_config` VALUES (17, 'local_upload_filedir', 'file:F:/upload/', '自定义文件保存路径，注意这个以 \"file:\" 开头，后面有 \"/\"（这种方式可以将资源存储在服务器的任意目录里，前提是要有该目录的读写权限）', 30, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (18, 'local_upload_user_filedir', 'file:F:/upload/roothub/user/', '自定义用户文件保存路径，注意这个后面有 \"/\"并且保证有该目录的读权限以', 30, 'text', NULL, 0, 1);
INSERT INTO `system_config` VALUES (19, 'local_upload_node_filedir', 'file:F:/upload/roothub/node/', '自定义节点文件保存路径，注意这个后面有 \"/\"并且保证有该目录的读权限', 30, 'text', NULL, 0, 1);
INSERT INTO `system_config` VALUES (20, 'local_upload_tag_filedir', 'file:F:/upload/roothub/tag/', '自定义标签文件保存路径，注意这个后面有 \"/\"并且保证有该目录的读权限', 30, 'text', NULL, 0, 1);
INSERT INTO `system_config` VALUES (21, 'redis_host', '127.0.0.1', 'redis服务地址', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (22, 'redis_port', '6379', 'redis服务端口（默认: 6379）', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (23, 'redis_password', '', 'redis服务密码（没有的话可以不用填）', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (24, 'redis_timeout', '2000', '网站连接redis服务超时时间，单位毫秒', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (25, 'redis_max_idle', '20', '连接池最多空闲实例', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (26, 'redis_max_total', '50', '连接池最多创建实例', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (27, 'redis_database', '0', '网站连接redis服务的哪个数据库，默认 0 号数据库，取值范围 0-15', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (28, 'redis_ssl', '0', 'redis服务是否开启认证连接（0：否，1：是）', 5, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (29, 'default_upload', '0', '默认上传', 2, 'radio', NULL, 0, 0);
INSERT INTO `system_config` VALUES (30, 'local_upload', '0', '自定义上传', 2, 'radio', NULL, 0, 0);
INSERT INTO `system_config` VALUES (31, 'static_url', '/static/**', '静态文件访问URL（默认上传和自定义上传的URL最好设置成一样的，否则更换上传方式后会导致之前的资源访问不了），注意最后有个\"/**\"', 30, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (34, 'endpoint', 'http://oss-cn-beijing.aliyuncs.com', 'Endpoint', 45, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (35, 'bucketName', 'ctguqmx-bbs-img', 'BucketName', 45, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (36, 'oss_filedir', 'images/', '阿里云OSS静态文件存储路径，注意前面没有\"/\"，后面有 \"/\"', 45, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (37, 'oss_static_url', ' https://ctguqmx-bbs-img.oss-cn-beijing.aliyuncs.com/', '阿里云OSS静态文件访问的URL，注意这个后面有 \"/\"', 45, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (38, 'open_redis', '1', '是否开启Redis', 5, 'radio', NULL, 0, 0);
INSERT INTO `system_config` VALUES (39, 'create_topic_score', '10', '创建话题奖励的积分', 4, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (40, 'create_reply_score', '5', '发布评论奖励的积分', 4, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (41, 'delete_topic_score', '10', '删除话题要被扣除的积分', 4, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (42, 'delete_reply_score', '5', '删除评论要被扣除的积分', 4, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (43, 'up_topic_score', '3', '点赞话题奖励话题作者的积分', 4, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (44, 'up_reply_score', '3', '点赞评论奖励评论作者的积分', 4, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (45, 'oss_upload', '1', '阿里云OSS', 2, 'radio', NULL, 0, 0);
INSERT INTO `system_config` VALUES (46, 'default_upload_filedir', '/upload/', '默认的文件保存路径，注意这个后面有 \"/\"（这种方式会将资源存储在war包里，不推荐这种方式，因为重新部署应用时会初始化）', 29, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (47, 'static_url', '/static/**', '静态文件访问URL（默认上传和自定义上传的URL最好设置成一样的，否则更换上传方式后会导致之前的资源访问不了），注意最后有个\"/**\"', 29, 'text', NULL, 0, 0);
INSERT INTO `system_config` VALUES (48, NULL, NULL, '分页设置', 0, NULL, NULL, 0, 0);
INSERT INTO `system_config` VALUES (49, 'index_page_size', '50', '首页', 48, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (50, 'node_page_size', '50', '节点页', 48, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (51, 'tag_page_size', '50', '标签页', 48, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (52, 'user_page_size', '50', '用户主页', 48, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (53, 'search_page_size', '50', '搜索页', 48, 'number', NULL, 0, 0);
INSERT INTO `system_config` VALUES (54, 'default_upload_node_filedir', '/upload/node/', '默认的节点文件保存路径（保存在war包里）', 29, 'text', NULL, 0, 1);
INSERT INTO `system_config` VALUES (55, 'default_upload_tag_filedir', '/upload/tag/', '默认的标签文件保存路径（保存在war包里）', 29, 'text', NULL, 0, 1);
INSERT INTO `system_config` VALUES (56, 'default_upload_user_filedir', '/upload/user/', '默认的用户文件保存路径（保存在war包里）', 29, 'text', NULL, 0, 1);
INSERT INTO `system_config` VALUES (57, 'upload_type', '45', '上传类型', 2, 'hidden', NULL, 0, 0);

-- ----------------------------
-- Table structure for tab
-- ----------------------------
DROP TABLE IF EXISTS `tab`;
CREATE TABLE `tab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，主键',
  `tab_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tab_desc` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0：否 1：是',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `tab_order` int(2) NULL DEFAULT NULL COMMENT '排列顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '父板块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab
-- ----------------------------
INSERT INTO `tab` VALUES (1, 'all', '全部', 0, '2018-07-15 15:59:48', 1);
INSERT INTO `tab` VALUES (2, 'hot', '最热', 0, '2018-07-15 16:00:49', 2);
INSERT INTO `tab` VALUES (3, 'new', '最新', 0, '2019-01-03 20:19:41', 3);
INSERT INTO `tab` VALUES (4, 'lonely', '无人问津', 0, '2019-01-03 20:20:49', 4);
INSERT INTO `tab` VALUES (5, 'member', '关注', 0, '2018-07-15 20:49:50', 15);

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `ptab` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父板块',
  `tab` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版块',
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `tag` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文',
  `excerpt` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘录',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `last_reply_time` datetime(0) NULL DEFAULT NULL COMMENT '最后回复时间，用于排序',
  `last_reply_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后回复用户',
  `view_count` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `top` tinyint(1) NULL DEFAULT 0 COMMENT '1置顶 0默认',
  `good` tinyint(1) NULL DEFAULT 0 COMMENT '1精华 0默认',
  `show_status` tinyint(1) NULL DEFAULT NULL COMMENT '1显示 0不显示',
  `reply_count` int(11) NOT NULL DEFAULT 0 COMMENT '回复数量',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '1删除 0默认',
  `tag_is_count` int(1) NULL DEFAULT 0 COMMENT '文章内容标签是否被统计过 1是 0否默认',
  `post_good_count` int(10) NULL DEFAULT 0 COMMENT '点赞',
  `post_bad_count` int(10) NULL DEFAULT 0 COMMENT '踩数',
  `status_cd` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章状态 1000:有效 1100:无效 1200:未生效',
  `node_slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点编码',
  `node_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `avatar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头图',
  `url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `key_tab`(`tab`) USING BTREE,
  INDEX `key_author`(`author`) USING BTREE,
  INDEX `key_node_title`(`node_title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for up_down
-- ----------------------------
DROP TABLE IF EXISTS `up_down`;
CREATE TABLE `up_down`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `tid` int(11) NULL DEFAULT NULL COMMENT '主题ID',
  `up_down` tinyint(1) NULL DEFAULT NULL COMMENT '0:down 1:up',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0 否 1 是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '点赞表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user_addr` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `score` int(11) NULL DEFAULT NULL COMMENT '积分',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人主页',
  `signature` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `third_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方账户id',
  `receive_msg` tinyint(1) NULL DEFAULT NULL COMMENT '邮箱是否接收社区消息 0:默认 1:不接收',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_block` tinyint(1) NULL DEFAULT NULL COMMENT '用户是否禁用 0:默认 1:禁用',
  `third_access_token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'access_token',
  `status_cd` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户状态 1000:有效 1100:无效 1200:未生效',
  `login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登入ip',
  `last_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户最后登入ip',
  `user_type` int(2) NULL DEFAULT NULL COMMENT '用户类型 0:超级管理员 1:版主 2:普通用户',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UNIQUE_NAME`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_check
-- ----------------------------
DROP TABLE IF EXISTS `user_check`;
CREATE TABLE `user_check`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态 默认0未审核或被封禁 1为审核通过',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '组别id',
  `visit_num` int(11) NULL DEFAULT 0 COMMENT '被访问量',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NULL DEFAULT NULL COMMENT '访问者ID',
  `vid` int(11) NULL DEFAULT NULL COMMENT '被访问者ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0 否 1 是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问记录表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- View structure for topic_tag
-- ----------------------------
DROP VIEW IF EXISTS `topic_tag`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `topic_tag` AS select `roothub`.`topic`.`is_delete` AS `is_delete`,`roothub`.`topic`.`topic_id` AS `topic_id`,substring_index(substring_index(`roothub`.`topic`.`tag`,'#',(`mysql`.`help_topic`.`help_topic_id` + 1)),'#',-(1)) AS `tag` from (`mysql`.`help_topic` join `roothub`.`topic`) where ((`mysql`.`help_topic`.`help_topic_id` < ((length(`roothub`.`topic`.`tag`) - length(replace(`roothub`.`topic`.`tag`,'#',''))) + 1)) and (length(substring_index(substring_index(`roothub`.`topic`.`tag`,'#',(`mysql`.`help_topic`.`help_topic_id` + 1)),'#',-(1))) > 0));

SET FOREIGN_KEY_CHECKS = 1;
