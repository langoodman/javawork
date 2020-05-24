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

 Date: 12/01/2020 13:25:52
*/

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

CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `tid` int(11) NULL DEFAULT NULL COMMENT '主题ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

CREATE TABLE `follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NULL DEFAULT NULL COMMENT '关注者ID',
  `fid` int(11) NULL DEFAULT NULL COMMENT '被关注者ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for node
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for node_tab
-- ----------------------------
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

CREATE TABLE `notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息通知标识',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息通知表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
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

CREATE TABLE `reply`  (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复标识',
  `topic_id` int(11) NULL DEFAULT NULL COMMENT '话题id',
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回复表' ROW_FORMAT = Compact;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uk_role_role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_permission_rel
-- ----------------------------
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

CREATE TABLE `tab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id，主键',
  `tab_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tab_desc` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0：否 1：是',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `tab_order` int(2) NULL DEFAULT NULL COMMENT '排列顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '父板块表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帖子表' ROW_FORMAT = Compact;

CREATE TABLE `up_down`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `tid` int(11) NULL DEFAULT NULL COMMENT '主题ID',
  `up_down` tinyint(1) NULL DEFAULT NULL COMMENT '0:down 1:up',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0 否 1 是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '点赞表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

CREATE TABLE `visit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NULL DEFAULT NULL COMMENT '访问者ID',
  `vid` int(11) NULL DEFAULT NULL COMMENT '被访问者ID',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0 否 1 是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问记录表' ROW_FORMAT = Dynamic;

CREATE TABLE `qmx_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组别id',
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组别名字',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `friend_url`  (
  `friend_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友链url',
  `url_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友链网站名字',
  `weight` int(11) NULL DEFAULT 0 COMMENT '友链权重',
  PRIMARY KEY (`friend_url_id`) USING BTREE,
  UNIQUE INDEX `url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `user_check`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态 默认0未审核 1为审核通过',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '组别id',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;