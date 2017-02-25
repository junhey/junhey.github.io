/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50539
Source Host           : localhost:3306
Source Database       : bysj_hj

Target Server Type    : MYSQL
Target Server Version : 50539
File Encoding         : 65001

Date: 2015-07-18 14:28:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hj_admins`
-- ----------------------------
DROP TABLE IF EXISTS `hj_admins`;
CREATE TABLE `hj_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=正常，2=冻结',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_admins
-- ----------------------------
INSERT INTO `hj_admins` VALUES ('1', 'admin', '03e19bca4c2c41945251d82506713bde4289a967', 'f5d04c02b9', 'hello@dilicms.com', '1', '1');
INSERT INTO `hj_admins` VALUES ('2', 'nieyu', 'a0981b1d8e440e18e04e2721cfe5f1f3e9e66dbb', '2926c42703', '123@qq.com', '3', '1');
INSERT INTO `hj_admins` VALUES ('3', 'lichao', '2b808e6813d10408f57e9d58839b8201df28bd56', '2effc6a4d0', '123@qq.com', '3', '1');
INSERT INTO `hj_admins` VALUES ('4', 'admin2', 'c8dce481b28b133dd53475fc0f63c96cf43e6994', '715e87136b', '123@qq.com', '6', '1');
INSERT INTO `hj_admins` VALUES ('5', 'hejun', '14adeec51b744fa246bd7272a7d6d7fc5fda8f07', '125708bc2e', '123@qq.com', '2', '1');
INSERT INTO `hj_admins` VALUES ('6', 'student', '8d7e24fae7455f19bbc5f1f4abb14512b4736fdc', '020766ecc9', 'student@qq.com', '2', '1');
INSERT INTO `hj_admins` VALUES ('7', 'teacher', '4cd56ea60e9a0f6026a94972a1ace8677f57ba6a', '7b63835607', 'teacher@qq.com', '3', '1');

-- ----------------------------
-- Table structure for `hj_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `hj_attachments`;
CREATE TABLE `hj_attachments` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_attachments
-- ----------------------------
INSERT INTO `hj_attachments` VALUES ('1', '1', '0', '0', '0', '1416312597cbf9bb6fd10fe08c', '2014/11', 'QQ截图20141117072030', 'png', '1', '1416312597');
INSERT INTO `hj_attachments` VALUES ('2', '1', '1', '0', '1', '141631273205deff6bb66d418d', '2014/11', 'QQ截图20141117072030', 'png', '1', '1416312732');
INSERT INTO `hj_attachments` VALUES ('3', '1', '1', '0', '2', '14168156422e16bba862fa54bf', '2014/11', 'met1', 'png', '1', '1416815642');
INSERT INTO `hj_attachments` VALUES ('4', '1', '0', '0', '0', '14202731607d91c7ce2dcad7c5', '2015/01', 'a0cfad284171dedd09f26cad1db2c309', 'jpg', '1', '1420273160');
INSERT INTO `hj_attachments` VALUES ('5', '1', '3', '0', '1', '1420284813b2ba9fcc3252919e', '2015/01', 'article', 'png', '1', '1420284813');
INSERT INTO `hj_attachments` VALUES ('6', '1', '3', '0', '2', '1420289293811e8dbedd641068', '2015/01', 'article', 'png', '1', '1420289293');
INSERT INTO `hj_attachments` VALUES ('7', '1', '1', '0', '3', '14206796073bb1de7cee586eca', '2015/01', 'video', 'png', '1', '1420679607');
INSERT INTO `hj_attachments` VALUES ('8', '1', '1', '0', '4', '142067964076771c57ff66babc', '2015/01', 'archive', 'png', '1', '1420679640');
INSERT INTO `hj_attachments` VALUES ('9', '1', '1', '0', '5', '1420679763585e3665b1166f0b', '2015/01', 'text', 'png', '1', '1420679763');
INSERT INTO `hj_attachments` VALUES ('10', '1', '1', '0', '6', '142067982291afd426cf1615c3', '2015/01', 'code', 'png', '1', '1420679822');
INSERT INTO `hj_attachments` VALUES ('11', '1', '1', '0', '7', '14206798593c498a33f8a51ebf', '2015/01', 'archive', 'png', '1', '1420679859');
INSERT INTO `hj_attachments` VALUES ('12', '1', '3', '0', '3', '1420681267db45084cfaacdf90', '2015/01', 'document', 'png', '1', '1420681267');
INSERT INTO `hj_attachments` VALUES ('13', '1', '1', '0', '1', '1420682741de4e446914bc79eb', '2015/01', 'ic_empty', 'png', '1', '1420682741');
INSERT INTO `hj_attachments` VALUES ('14', '1', '1', '0', '8', '142068408410ebf591dab75af0', '2015/01', 'star1', 'png', '1', '1420684084');
INSERT INTO `hj_attachments` VALUES ('15', '1', '3', '0', '1', '1420684137572cd4c95a693efe', '2015/01', 'chatto_bg_normal.9', 'png', '1', '1420684137');
INSERT INTO `hj_attachments` VALUES ('16', '1', '1', '0', '9', '1420687285611c73c45bae05af', '2015/01', 'icon_5_c', 'png', '1', '1420687285');

-- ----------------------------
-- Table structure for `hj_backend_settings`
-- ----------------------------
DROP TABLE IF EXISTS `hj_backend_settings`;
CREATE TABLE `hj_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif',
  `plugin_dev_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backend_http_auth_on` tinyint(1) DEFAULT '0',
  `backend_http_auth_user` varchar(40) DEFAULT NULL,
  `backend_http_auth_password` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_backend_settings
-- ----------------------------
INSERT INTO `hj_backend_settings` VALUES ('default', 'zh-cn', '1', '', '点课系统', 'images/logo.gif', '0', '0', '', '');

-- ----------------------------
-- Table structure for `hj_cate_fields`
-- ----------------------------
DROP TABLE IF EXISTS `hj_cate_fields`;
CREATE TABLE `hj_cate_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) unsigned DEFAULT NULL,
  `listable` tinyint(1) unsigned DEFAULT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_cate_fields
-- ----------------------------
INSERT INTO `hj_cate_fields` VALUES ('1', 'categoryName', '课程分类名', '1', 'input', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_cate_fields` VALUES ('3', 'instituteName', '院系名称', '3', 'input', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_cate_fields` VALUES ('4', 'teachName', '教研室名称', '4', 'input', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_cate_fields` VALUES ('6', 'statusName', '状态名', '6', 'input', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for `hj_cate_models`
-- ----------------------------
DROP TABLE IF EXISTS `hj_cate_models`;
CREATE TABLE `hj_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  `auto_update` tinyint(1) DEFAULT '0',
  `thumb_preferences` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_cate_models
-- ----------------------------
INSERT INTO `hj_cate_models` VALUES ('1', 'courseCategory', '课程分类', '10', '1', '0', '0', '1', null);
INSERT INTO `hj_cate_models` VALUES ('3', 'instituteCategory', '院系分类', '10', '2', '0', '0', '1', null);
INSERT INTO `hj_cate_models` VALUES ('4', 'teachCategory', '教研室分类', '10', '1', '0', '0', '1', null);
INSERT INTO `hj_cate_models` VALUES ('6', 'selStatusCategory', '选课状态', '10', '1', '0', '0', '0', null);

-- ----------------------------
-- Table structure for `hj_fieldtypes`
-- ----------------------------
DROP TABLE IF EXISTS `hj_fieldtypes`;
CREATE TABLE `hj_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_fieldtypes
-- ----------------------------
INSERT INTO `hj_fieldtypes` VALUES ('int', '整形(INT)');
INSERT INTO `hj_fieldtypes` VALUES ('float', '浮点型(FLOAT)');
INSERT INTO `hj_fieldtypes` VALUES ('input', '单行文本框(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('textarea', '文本区域(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('select', '下拉菜单(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('select_from_model', '下拉菜单(模型数据)(INT)');
INSERT INTO `hj_fieldtypes` VALUES ('linked_menu', '联动下拉菜单(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('radio', '单选按钮(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('radio_from_model', '单选按钮(模型数据)(INT)');
INSERT INTO `hj_fieldtypes` VALUES ('checkbox', '复选框(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('checkbox_from_model', '复选框(模型数据)(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('wysiwyg', '编辑器(TEXT)');
INSERT INTO `hj_fieldtypes` VALUES ('wysiwyg_basic', '编辑器(简)(TEXT)');
INSERT INTO `hj_fieldtypes` VALUES ('datetime', '日期时间(VARCHAR)');
INSERT INTO `hj_fieldtypes` VALUES ('content', '内容模型调用(INT)');

-- ----------------------------
-- Table structure for `hj_menus`
-- ----------------------------
DROP TABLE IF EXISTS `hj_menus`;
CREATE TABLE `hj_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_menus
-- ----------------------------
INSERT INTO `hj_menus` VALUES ('1', 'system', 'home', '系统', '0', '0');
INSERT INTO `hj_menus` VALUES ('2', 'system', 'home', '后台首页', '1', '1');
INSERT INTO `hj_menus` VALUES ('3', 'system', 'home', '后台首页', '2', '2');
INSERT INTO `hj_menus` VALUES ('4', 'setting', 'site', '系统设置', '1', '1');
INSERT INTO `hj_menus` VALUES ('5', 'setting', 'site', '站点设置', '2', '4');
INSERT INTO `hj_menus` VALUES ('6', 'setting', 'backend', '后台设置', '2', '4');
INSERT INTO `hj_menus` VALUES ('7', 'system', 'password', '修改密码', '2', '4');
INSERT INTO `hj_menus` VALUES ('8', 'system', 'cache', '更新缓存', '2', '4');
INSERT INTO `hj_menus` VALUES ('9', 'model', 'view', '模型管理', '1', '1');
INSERT INTO `hj_menus` VALUES ('10', 'model', 'view', '内容模型管理', '2', '9');
INSERT INTO `hj_menus` VALUES ('11', 'category', 'view', '分类模型管理', '2', '9');
INSERT INTO `hj_menus` VALUES ('12', 'plugin', 'view', '扩展管理', '1', '1');
INSERT INTO `hj_menus` VALUES ('13', 'plugin', 'view', '插件管理', '2', '12');
INSERT INTO `hj_menus` VALUES ('14', 'role', 'view', '权限管理', '1', '1');
INSERT INTO `hj_menus` VALUES ('15', 'role', 'view', '用户组管理', '2', '14');
INSERT INTO `hj_menus` VALUES ('16', 'user', 'view', '用户管理', '2', '14');
INSERT INTO `hj_menus` VALUES ('17', 'content', 'view', '内容管理', '0', '0');
INSERT INTO `hj_menus` VALUES ('18', 'content', 'view', '内容管理', '1', '17');
INSERT INTO `hj_menus` VALUES ('19', 'category_content', 'view', '分类管理', '1', '17');
INSERT INTO `hj_menus` VALUES ('20', 'module', 'run', '插件', '0', '0');
INSERT INTO `hj_menus` VALUES ('21', 'database', 'index', '数据库管理', '1', '1');
INSERT INTO `hj_menus` VALUES ('22', 'database', 'index', '数据库备份', '2', '21');
INSERT INTO `hj_menus` VALUES ('23', 'database', 'recover', '数据库还原', '2', '21');
INSERT INTO `hj_menus` VALUES ('24', 'database', 'optimize', '数据库优化', '2', '21');

-- ----------------------------
-- Table structure for `hj_models`
-- ----------------------------
DROP TABLE IF EXISTS `hj_models`;
CREATE TABLE `hj_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `thumb_preferences` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_models
-- ----------------------------
INSERT INTO `hj_models` VALUES ('1', 'courses', '课程表', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');
INSERT INTO `hj_models` VALUES ('9', 'students', '学生表', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');
INSERT INTO `hj_models` VALUES ('3', 'notices', '通知表', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');
INSERT INTO `hj_models` VALUES ('4', 'evaluates', '评价表', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');
INSERT INTO `hj_models` VALUES ('5', 'institutes', '院系表', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');
INSERT INTO `hj_models` VALUES ('6', 'teachers', '教师表', '10', '1', '0', '{\"enabled\":[],\"default\":\"original\"}');
INSERT INTO `hj_models` VALUES ('7', 'messages', '信息表', '10', '0', '0', null);
INSERT INTO `hj_models` VALUES ('8', 'selcourse', '选课表', '10', '0', '0', null);

-- ----------------------------
-- Table structure for `hj_model_fields`
-- ----------------------------
DROP TABLE IF EXISTS `hj_model_fields`;
CREATE TABLE `hj_model_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext NOT NULL,
  `width` smallint(10) unsigned NOT NULL,
  `height` smallint(10) unsigned NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `listable` tinyint(1) unsigned NOT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_model_fields
-- ----------------------------
INSERT INTO `hj_model_fields` VALUES ('2', 'courseCategory', '课程分类', '1', 'select_from_model', '0', 'courseCategory|categoryName', '0', '0', 'required', '', '0', '1', '3', '1');
INSERT INTO `hj_model_fields` VALUES ('3', 'courseNo', '课程号', '1', 'int', '0', '', '5', '28', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('4', 'courseContent', '课程内容', '1', 'wysiwyg', '0', '', '0', '0', 'required', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('6', 'thumb', '课程图片', '1', 'file', '0', '', '0', '0', '', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('56', 'password', '密码', '9', 'int', '0', '', '0', '0', '', '', '0', '1', '6', '1');
INSERT INTO `hj_model_fields` VALUES ('55', 'address', '家庭地址', '9', 'input', '0', '', '0', '0', 'required', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('54', 'email', '邮箱', '9', 'input', '0', '', '0', '0', 'required', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('10', 'noticeTime', '通知时间', '3', 'datetime', '0', '', '0', '0', 'required', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('11', 'noticeContent', '通知内容', '3', 'wysiwyg_basic', '0', '', '0', '0', 'required', '', '0', '1', '3', '1');
INSERT INTO `hj_model_fields` VALUES ('12', 'evaluateNo', '评价号', '4', 'int', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('13', 'evaluateContent', '评价内容', '4', 'wysiwyg_basic', '0', '', '0', '0', 'required', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('14', 'courseName', '课程名', '1', 'input', '0', '', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('15', 'courseNo', '课程号', '4', 'int', '0', '', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('16', 'eveluateTime', '评价时间', '4', 'datetime', '0', '', '0', '0', 'required', '', '0', '1', '3', '1');
INSERT INTO `hj_model_fields` VALUES ('17', 'eveluateReply', '评价回复', '4', 'textarea', '0', '', '0', '0', '', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('18', 'noticeNo', '通知号', '3', 'int', '0', '', '0', '0', '', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('19', 'instituteName', '学院编号', '3', 'select_from_model', '0', 'instituteCategory|instituteName', '0', '0', 'required', '', '0', '1', '6', '1');
INSERT INTO `hj_model_fields` VALUES ('20', 'noticeTitle', '通知标题', '3', 'input', '0', '', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('21', 'thumb', '通知图片', '3', 'file', '0', '', '0', '0', '', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('53', 'idCard', '身份证号', '9', 'int', '0', '', '0', '0', 'required', '', '0', '1', '3', '1');
INSERT INTO `hj_model_fields` VALUES ('25', 'teacherNo', '工号', '6', 'int', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('26', 'teacherName', '教师姓名', '6', 'input', '0', '', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('27', 'gender', '性别', '6', 'radio_from_model', '0', '', '0', '0', '', '', '0', '0', '3', '0');
INSERT INTO `hj_model_fields` VALUES ('28', 'email', '电子邮箱', '6', 'input', '0', '', '0', '0', 'required,valid_email', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('29', 'password', '密码', '6', 'input', '0', '', '0', '0', 'required', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('30', 'teachName', '教研室名', '6', 'select_from_model', '0', 'teachCategory|teachName', '0', '0', 'required', '', '0', '1', '6', '1');
INSERT INTO `hj_model_fields` VALUES ('31', 'messageNo', '信息号', '7', 'int', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('32', 'sendContent', '发送内容', '7', 'wysiwyg', '0', '', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('33', 'sendDate', '发送日期', '7', 'datetime', '0', '', '0', '0', 'required', '', '0', '1', '3', '1');
INSERT INTO `hj_model_fields` VALUES ('34', 'teacherNo', '工号', '7', 'int', '0', '', '0', '0', 'required', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('35', 'studentNo', '学号', '7', 'int', '0', '', '0', '0', 'required', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('36', 'selCourseNo', '选课号', '8', 'int', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('37', 'selStatus', '选课状态', '8', 'select_from_model', '0', 'selStatusCategory|statusName', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('38', 'selDate', '选课日期', '8', 'datetime', '0', '', '0', '0', 'required', '', '0', '1', '3', '1');
INSERT INTO `hj_model_fields` VALUES ('39', 'studentNo', '学号', '8', 'int', '0', '', '0', '0', 'required', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('40', 'teacherNo', '工号', '8', 'int', '0', '', '0', '0', 'required', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('41', 'courseNo', '课程号', '8', 'int', '0', '', '0', '0', 'required', '', '0', '1', '6', '1');
INSERT INTO `hj_model_fields` VALUES ('42', 'instituteNo', '学院编号', '5', 'int', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('43', 'instituteName', '学院名称', '5', 'input', '0', '', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('44', 'introduce', '学院介绍', '5', 'wysiwyg', '0', '', '0', '0', 'required', '', '0', '1', '3', '1');
INSERT INTO `hj_model_fields` VALUES ('45', 'thumb', '学院图片', '5', 'file', '0', '', '0', '0', 'required', '', '0', '1', '4', '1');
INSERT INTO `hj_model_fields` VALUES ('46', 'email', '学院邮箱', '5', 'input', '0', '', '0', '0', 'required,valid_email', '', '0', '1', '5', '1');
INSERT INTO `hj_model_fields` VALUES ('47', 'contactsName', '联系人', '5', 'input', '0', '', '0', '0', 'required', '', '0', '1', '6', '1');
INSERT INTO `hj_model_fields` VALUES ('48', 'contactsPhone', '联系电话', '5', 'int', '0', '', '0', '0', 'required', '', '0', '1', '7', '1');
INSERT INTO `hj_model_fields` VALUES ('52', 'studentName', '学生姓名', '9', 'input', '0', '', '0', '0', 'required', '', '0', '1', '2', '1');
INSERT INTO `hj_model_fields` VALUES ('51', 'studentNo', '学号', '9', 'int', '0', '', '0', '0', 'required', '', '0', '1', '1', '1');
INSERT INTO `hj_model_fields` VALUES ('57', 'majoyName', '专业名', '9', 'select_from_model', '0', 'instituteCategory|instituteName', '0', '0', 'required', '', '0', '1', '7', '1');

-- ----------------------------
-- Table structure for `hj_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `hj_plugins`;
CREATE TABLE `hj_plugins` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `hj_rights`
-- ----------------------------
DROP TABLE IF EXISTS `hj_rights`;
CREATE TABLE `hj_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_rights
-- ----------------------------
INSERT INTO `hj_rights` VALUES ('1', '密码修改', 'system', 'password', null);
INSERT INTO `hj_rights` VALUES ('2', '更新缓存', 'system', 'cache', null);
INSERT INTO `hj_rights` VALUES ('3', ' 站点设置', 'setting', 'site', null);
INSERT INTO `hj_rights` VALUES ('4', '后台设置', 'setting', 'backend', null);
INSERT INTO `hj_rights` VALUES ('5', '插件管理[列表]', 'plugin', 'view', null);
INSERT INTO `hj_rights` VALUES ('6', '添加插件', 'plugin', 'add', null);
INSERT INTO `hj_rights` VALUES ('7', '修改插件', 'plugin', 'edit', null);
INSERT INTO `hj_rights` VALUES ('8', '卸载插件', 'plugin', 'del', null);
INSERT INTO `hj_rights` VALUES ('9', '导出插件', 'plugin', 'export', null);
INSERT INTO `hj_rights` VALUES ('10', '导入插件', 'plugin', 'import', null);
INSERT INTO `hj_rights` VALUES ('11', '激活插件', 'plugin', 'active', null);
INSERT INTO `hj_rights` VALUES ('12', '禁用插件', 'plugin', 'deactive', null);
INSERT INTO `hj_rights` VALUES ('13', '运行插件', 'module', 'run', null);
INSERT INTO `hj_rights` VALUES ('14', '内容模型管理[列表]', 'model', 'view', null);
INSERT INTO `hj_rights` VALUES ('15', '添加内容模型', 'model', 'add', null);
INSERT INTO `hj_rights` VALUES ('16', '修改内容模型', 'model', 'edit', null);
INSERT INTO `hj_rights` VALUES ('17', '删除内容模型', 'model', 'del', null);
INSERT INTO `hj_rights` VALUES ('18', '内容模型字段管理[列表]', 'model', 'fields', null);
INSERT INTO `hj_rights` VALUES ('19', '添加内容模型字段', 'model', 'add_filed', null);
INSERT INTO `hj_rights` VALUES ('20', '修改内容模型字段', 'model', 'edit_field', null);
INSERT INTO `hj_rights` VALUES ('21', '删除内容模型字段', 'model', 'del_field', null);
INSERT INTO `hj_rights` VALUES ('22', '分类模型管理[列表]', 'category', 'view', null);
INSERT INTO `hj_rights` VALUES ('23', '添加分类模型', 'category', 'add', null);
INSERT INTO `hj_rights` VALUES ('24', '修改分类模型', 'category', 'edit', null);
INSERT INTO `hj_rights` VALUES ('25', '删除分类模型', 'category', 'del', null);
INSERT INTO `hj_rights` VALUES ('26', '分类模型字段管理[列表]', 'category', 'fields', null);
INSERT INTO `hj_rights` VALUES ('27', '添加分类模型字段', 'category', 'add_filed', null);
INSERT INTO `hj_rights` VALUES ('28', '修改分类模型字段', 'category', 'edit_field', null);
INSERT INTO `hj_rights` VALUES ('29', '删除分类模型字段', 'category', 'del_field', null);
INSERT INTO `hj_rights` VALUES ('30', '内容管理[列表]', 'content', 'view', null);
INSERT INTO `hj_rights` VALUES ('31', '添加内容[表单]', 'content', 'form', 'add');
INSERT INTO `hj_rights` VALUES ('32', '修改内容[表单]', 'content', 'form', 'edit');
INSERT INTO `hj_rights` VALUES ('33', '添加内容[动作]', 'content', 'save', 'add');
INSERT INTO `hj_rights` VALUES ('34', '修改内容[动作]', 'content', 'save', 'edit');
INSERT INTO `hj_rights` VALUES ('35', '删除内容', 'content', 'del', null);
INSERT INTO `hj_rights` VALUES ('36', '分类管理[列表]', 'category_content', 'view', null);
INSERT INTO `hj_rights` VALUES ('37', '添加分类[表单]', 'category_content', 'form', 'add');
INSERT INTO `hj_rights` VALUES ('38', '修改分类[表单]', 'category_content', 'form', 'edit');
INSERT INTO `hj_rights` VALUES ('39', '添加分类[动作]', 'category_content', 'save', 'add');
INSERT INTO `hj_rights` VALUES ('40', '修改分类[动作]', 'category_content', 'save', 'edit');
INSERT INTO `hj_rights` VALUES ('41', '删除分类', 'category_content', 'del', null);
INSERT INTO `hj_rights` VALUES ('42', '用户组管理[列表]', 'role', 'view', null);
INSERT INTO `hj_rights` VALUES ('43', '添加用户组', 'role', 'add', null);
INSERT INTO `hj_rights` VALUES ('44', '修改用户组', 'role', 'edit', null);
INSERT INTO `hj_rights` VALUES ('45', '删除用户组', 'role', 'del', null);
INSERT INTO `hj_rights` VALUES ('46', '用户管理[列表]', 'user', 'view', null);
INSERT INTO `hj_rights` VALUES ('47', '添加用户', 'user', 'add', null);
INSERT INTO `hj_rights` VALUES ('48', '修改用户', 'user', 'edit', null);
INSERT INTO `hj_rights` VALUES ('49', '删除用户', 'user', 'del', null);
INSERT INTO `hj_rights` VALUES ('50', '数据库备份', 'database', 'index', null);
INSERT INTO `hj_rights` VALUES ('51', '数据库还原', 'database', 'recover', null);
INSERT INTO `hj_rights` VALUES ('52', '数据库优化', 'database', 'optimize', null);

-- ----------------------------
-- Table structure for `hj_roles`
-- ----------------------------
DROP TABLE IF EXISTS `hj_roles`;
CREATE TABLE `hj_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_roles
-- ----------------------------
INSERT INTO `hj_roles` VALUES ('1', 'root', '', '', '', '');
INSERT INTO `hj_roles` VALUES ('2', '学生用户', '1,2,52', 'evaluates', '0', '0');
INSERT INTO `hj_roles` VALUES ('3', '老师用户', '2,14,15,16,30,31,32,33', 'courses', '0', '0');
INSERT INTO `hj_roles` VALUES ('4', '教研室管理用户', '1,2,52', '0', 'teachCategory', '0');
INSERT INTO `hj_roles` VALUES ('5', '专业管理用户', '1,2,52', '0', 'majorCategory', '0');
INSERT INTO `hj_roles` VALUES ('6', '教务处管理用户', '1,2', '0', 'instituteCategory,teachCategory,majorCategory', '0');

-- ----------------------------
-- Table structure for `hj_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `hj_sessions`;
CREATE TABLE `hj_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_sessions
-- ----------------------------
INSERT INTO `hj_sessions` VALUES ('fd087ef65cae7cb4c0f838b854c6fd6a', '220.177.100.106', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', '1433377944', 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `hj_sessions` VALUES ('19b120e6fa98cd5e33dd2ff9da46f9c4', '220.177.100.106', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2160.2 Safari/537.36', '1433382067', 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for `hj_site_settings`
-- ----------------------------
DROP TABLE IF EXISTS `hj_site_settings`;
CREATE TABLE `hj_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_url` varchar(50) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL,
  `thumbs_preferences` varchar(500) DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_site_settings
-- ----------------------------
INSERT INTO `hj_site_settings` VALUES ('点课系统', 'http://218.95.99.209/bysj/hj', 'images/logo.gif', '', '', '', '', '1', '网站维护升级中......', '点课系统', '点课系统', 'default', null, 'attachments', '*.jpg;*.gif;*.png;*.doc', '2097152', '[]');

-- ----------------------------
-- Table structure for `hj_throttles`
-- ----------------------------
DROP TABLE IF EXISTS `hj_throttles`;
CREATE TABLE `hj_throttles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_throttles
-- ----------------------------

-- ----------------------------
-- Table structure for `hj_u_c_coursecategory`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_c_coursecategory`;
CREATE TABLE `hj_u_c_coursecategory` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  `categoryName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_c_coursecategory
-- ----------------------------
INSERT INTO `hj_u_c_coursecategory` VALUES ('1', '0', '1', '{0}', '计算机课程');
INSERT INTO `hj_u_c_coursecategory` VALUES ('3', '0', '1', '{0}', '语言类课程');
INSERT INTO `hj_u_c_coursecategory` VALUES ('4', '0', '1', '{0}', '会计类课程');
INSERT INTO `hj_u_c_coursecategory` VALUES ('5', '0', '1', '{0}', '其他类');

-- ----------------------------
-- Table structure for `hj_u_c_institutecategory`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_c_institutecategory`;
CREATE TABLE `hj_u_c_institutecategory` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  `instituteName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_c_institutecategory
-- ----------------------------
INSERT INTO `hj_u_c_institutecategory` VALUES ('1', '0', '1', '{0}', '信息工程学院');
INSERT INTO `hj_u_c_institutecategory` VALUES ('2', '0', '1', '{0}', '工商学院');
INSERT INTO `hj_u_c_institutecategory` VALUES ('3', '0', '1', '{0}', '陶瓷美术学院');
INSERT INTO `hj_u_c_institutecategory` VALUES ('4', '0', '1', '{0}', '设计艺术学院');
INSERT INTO `hj_u_c_institutecategory` VALUES ('5', '1', '2', '{0},{1}', '信息');
INSERT INTO `hj_u_c_institutecategory` VALUES ('6', '1', '2', '{0},{1}', '信管');
INSERT INTO `hj_u_c_institutecategory` VALUES ('7', '1', '2', '{0},{1}', '计科');
INSERT INTO `hj_u_c_institutecategory` VALUES ('8', '2', '2', '{0},{2}', '会计');
INSERT INTO `hj_u_c_institutecategory` VALUES ('9', '2', '2', '{0},{2}', '国贸');
INSERT INTO `hj_u_c_institutecategory` VALUES ('10', '3', '2', '{0},{3}', '陶设');
INSERT INTO `hj_u_c_institutecategory` VALUES ('11', '3', '2', '{0},{3}', '雕塑');
INSERT INTO `hj_u_c_institutecategory` VALUES ('12', '3', '2', '{0},{3}', '视传');
INSERT INTO `hj_u_c_institutecategory` VALUES ('13', '0', '1', '{0}', '材料学院');

-- ----------------------------
-- Table structure for `hj_u_c_selstatuscategory`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_c_selstatuscategory`;
CREATE TABLE `hj_u_c_selstatuscategory` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  `statusName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_c_selstatuscategory
-- ----------------------------
INSERT INTO `hj_u_c_selstatuscategory` VALUES ('1', '0', '1', '{0}', '未选择');
INSERT INTO `hj_u_c_selstatuscategory` VALUES ('2', '0', '1', '{0}', '已加入');
INSERT INTO `hj_u_c_selstatuscategory` VALUES ('3', '0', '1', '{0}', '已预约');
INSERT INTO `hj_u_c_selstatuscategory` VALUES ('4', '0', '1', '{0}', '已收藏');

-- ----------------------------
-- Table structure for `hj_u_c_teachcategory`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_c_teachcategory`;
CREATE TABLE `hj_u_c_teachcategory` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT '',
  `teachName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_c_teachcategory
-- ----------------------------
INSERT INTO `hj_u_c_teachcategory` VALUES ('1', '0', '1', '{0}', '计科教研室');
INSERT INTO `hj_u_c_teachcategory` VALUES ('2', '0', '1', '{0}', '信管教研室');
INSERT INTO `hj_u_c_teachcategory` VALUES ('3', '0', '1', '{0}', '国贸教研室');
INSERT INTO `hj_u_c_teachcategory` VALUES ('4', '0', '1', '{0}', '陶艺教研室');

-- ----------------------------
-- Table structure for `hj_u_m_courses`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_courses`;
CREATE TABLE `hj_u_m_courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `courseCategory` int(10) NOT NULL DEFAULT '0',
  `courseNo` int(10) NOT NULL DEFAULT '0',
  `courseContent` text NOT NULL,
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `courseName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_courses
-- ----------------------------
INSERT INTO `hj_u_m_courses` VALUES ('1', '1416312732', '1420682741', '1', '1', '1', '1', '进入21世纪，社会信息化不断向纵深发展，各行各业的信息化进程不断加速。', '/2015/01/1420682741de4e446914bc79eb.png', '大学生计算机基础');
INSERT INTO `hj_u_m_courses` VALUES ('2', '1416815642', '1420628293', '1', '1', '1', '2', '高等数学是计算机中的重要学科', '/2014/11/14168156422e16bba862fa54bf.png', '高等数学');
INSERT INTO `hj_u_m_courses` VALUES ('3', '1420679607', '1420679951', '1', '1', '1', '3', '数据库系统（database systems），是由数据库及其管理软件组成的系统。', '/2015/01/14206796073bb1de7cee586eca.png', '数据库系统');
INSERT INTO `hj_u_m_courses` VALUES ('4', '1420679640', '1423811718', '1', '1', '5', '4', '管理学是一门综合性的交叉学科，是系统研究管理活动的基本规律和一般方法的科学。', '/2015/01/142067964076771c57ff66babc.png', '管理学');
INSERT INTO `hj_u_m_courses` VALUES ('5', '1420679763', '1420679763', '1', '1', '3', '5', '英语（English），属于印欧语系中日耳曼语族下的西日耳曼语支，是由古代从北欧五国以及斯堪的纳维亚半岛移民至不列颠群岛的盎格鲁、撒克逊和朱特部落的日耳曼人所说的语言演变而来，并通过英国的殖民活动传播到了世界各地。', '/2015/01/1420679763585e3665b1166f0b.png', '英语');
INSERT INTO `hj_u_m_courses` VALUES ('6', '1420679822', '1420679822', '1', '1', '4', '6', '会计学（Accounting）是以研究财务活动和成本资料的收集、分类、综合、分析和解释的基础上形成协助决策的信息系统，以有效地管理经济的一门应用学科，可以说它是社会学科的组成部分，也是一门重要的管理学科。会计学的研究对象是资金的运动。', '/2015/01/142067982291afd426cf1615c3.png', '会计学');
INSERT INTO `hj_u_m_courses` VALUES ('7', '1420679859', '1420679859', '1', '1', '5', '7', '信息管理（information Management IM）是人类为了有效地开发和利用信息资源，以现代信息技术为手段，对信息资源进行计划、组织、领导和控制的社会活动。', '/2015/01/14206798593c498a33f8a51ebf.png', '信息管理');
INSERT INTO `hj_u_m_courses` VALUES ('8', '1420684002', '1420687145', '3', '1', '1', '8', '开发一个web应用程序跟开发一个网站是不一样的。虽然在总体上有很大相似之处,但开发它们所需要的时间有巨大的...', '/2015/01/142068408410ebf591dab75af0.png', 'web程序开发');
INSERT INTO `hj_u_m_courses` VALUES ('9', '1420687285', '1420687285', '1', '1', '1', '9', 'C语言是一门低级计算机编程语言，设计目标是提供一种能以简易的方式编译、处理低级存储器、产生少量的机器码以及不需要任何运行环境支持便能运行的编程语言。', '/2015/01/1420687285611c73c45bae05af.png', 'c语言');

-- ----------------------------
-- Table structure for `hj_u_m_evaluates`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_evaluates`;
CREATE TABLE `hj_u_m_evaluates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `evaluateNo` int(10) NOT NULL DEFAULT '0',
  `evaluateContent` text NOT NULL,
  `courseNo` int(10) NOT NULL DEFAULT '0',
  `eveluateTime` varchar(100) NOT NULL DEFAULT '',
  `eveluateReply` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_evaluates
-- ----------------------------
INSERT INTO `hj_u_m_evaluates` VALUES ('1', '1420476094', '1420476094', '1', '1', '1', '<span>课程很不错，老师上课也很负责，介绍给大家选这课程。</span>', '2', '2015-01-06 00:41:29', '');
INSERT INTO `hj_u_m_evaluates` VALUES ('2', '1420476313', '1420476313', '1', '1', '3', '课程很满意', '1', '2015-01-06 00:45:01', '');
INSERT INTO `hj_u_m_evaluates` VALUES ('3', '1420681104', '1420681104', '1', '1', '2', '这门课程很有趣', '3', '2015-01-08 09:38:05', '谢谢');
INSERT INTO `hj_u_m_evaluates` VALUES ('4', '1420681137', '1420681137', '1', '1', '4', '课程的内容很丰富，建议大家选择', '4', '2015-01-22 09:38:33', '');
INSERT INTO `hj_u_m_evaluates` VALUES ('5', '1420684278', '1420684278', '1', '1', '5', '课程内容很丰富。大家踊跃加入吧~', '5', '2015-01-08 10:30:46', '谢谢回复');
INSERT INTO `hj_u_m_evaluates` VALUES ('6', '1420687341', '1420687341', '1', '1', '6', '上课老师很有风趣', '6', '2015-01-08 11:22:01', '谢谢~');
INSERT INTO `hj_u_m_evaluates` VALUES ('7', '1420687392', '1420687392', '1', '1', '8', '课程讲的有点多，希望老师能讲少点', '8', '2014-12-29 11:22:31', '');

-- ----------------------------
-- Table structure for `hj_u_m_institutes`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_institutes`;
CREATE TABLE `hj_u_m_institutes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `instituteNo` int(10) NOT NULL DEFAULT '0',
  `instituteName` varchar(100) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `contactsName` varchar(100) NOT NULL DEFAULT '',
  `contactsPhone` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_institutes
-- ----------------------------

-- ----------------------------
-- Table structure for `hj_u_m_messages`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_messages`;
CREATE TABLE `hj_u_m_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `messageNo` int(10) NOT NULL DEFAULT '0',
  `sendContent` text NOT NULL,
  `sendDate` varchar(100) NOT NULL DEFAULT '',
  `teacherNo` int(10) NOT NULL DEFAULT '0',
  `studentNo` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_messages
-- ----------------------------
INSERT INTO `hj_u_m_messages` VALUES ('1', '1420337611', '1420337611', '1', '1', '1', '今天上午大家九点准时上课', '2015-01-04 10:13:23', '12', '20111053');
INSERT INTO `hj_u_m_messages` VALUES ('2', '1420636702', '1420636702', '1', '1', '4', 'test', '2015-01-07 21:18:16', '12', '20111055');

-- ----------------------------
-- Table structure for `hj_u_m_notices`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_notices`;
CREATE TABLE `hj_u_m_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `noticeTime` varchar(100) NOT NULL DEFAULT '',
  `noticeContent` text NOT NULL,
  `noticeNo` int(10) NOT NULL DEFAULT '0',
  `instituteName` int(10) NOT NULL DEFAULT '0',
  `noticeTitle` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_notices
-- ----------------------------
INSERT INTO `hj_u_m_notices` VALUES ('1', '1420284813', '1420684178', '1', '1', '2015-01-03 19:33:27', '今天下午信管班金工实习，下午的体育课暂停。', '1', '6', '通知', '/2015/01/1420684137572cd4c95a693efe.png');
INSERT INTO `hj_u_m_notices` VALUES ('2', '1420289293', '1420681192', '1', '1', '2015-01-03 20:48:04', '通知大家今天的英语课因运动会停一周', '2', '3', '通知2', '/2015/01/1420289293811e8dbedd641068.png');
INSERT INTO `hj_u_m_notices` VALUES ('3', '1420681267', '1420681267', '1', '1', '2014-12-31 09:40:51', '管理学课程今天结课，通知今天上管理学课程的同学带好草稿纸准备考试', '3', '2', '通知3', '/2015/01/1420681267db45084cfaacdf90.png');

-- ----------------------------
-- Table structure for `hj_u_m_selcourse`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_selcourse`;
CREATE TABLE `hj_u_m_selcourse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `create_user` tinyint(10) unsigned DEFAULT '0',
  `update_user` tinyint(10) unsigned DEFAULT '0',
  `selCourseNo` int(10) NOT NULL DEFAULT '0',
  `selStatus` int(10) NOT NULL DEFAULT '0',
  `selDate` varchar(100) NOT NULL DEFAULT '',
  `studentNo` int(10) NOT NULL DEFAULT '0',
  `teacherNo` int(10) DEFAULT '0',
  `courseNo` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`selCourseNo`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_selcourse
-- ----------------------------
INSERT INTO `hj_u_m_selcourse` VALUES ('1', '1420337628', '1420337628', '1', '1', '1', '2', '2015-01-04 10:13:37', '20111053', '12', '1');
INSERT INTO `hj_u_m_selcourse` VALUES ('2', '1420337650', '1420337650', '1', '1', '2', '3', '2015-01-04 10:14:01', '20111053', '12', '2');
INSERT INTO `hj_u_m_selcourse` VALUES ('3', '1420337666', '1420337666', '1', '1', '3', '2', '2015-01-04 10:14:17', '20111053', '12', '3');
INSERT INTO `hj_u_m_selcourse` VALUES ('116', '0', '0', '0', '0', '0', '2', '2015-01-07 21:17:29', '20111055', '0', '2');
INSERT INTO `hj_u_m_selcourse` VALUES ('117', '0', '0', '0', '0', '0', '2', '2015-01-07 21:17:38', '20111055', '0', '1');
INSERT INTO `hj_u_m_selcourse` VALUES ('118', '0', '0', '0', '0', '0', '1', '2015-01-08 09:47:07', '20111055', '0', '5');
INSERT INTO `hj_u_m_selcourse` VALUES ('119', '0', '0', '0', '0', '0', '1', '2015-01-23 11:04:35', '0', '0', '1');
INSERT INTO `hj_u_m_selcourse` VALUES ('120', '0', '0', '0', '0', '0', '2', '2015-01-23 14:32:45', '0', '0', '4');
INSERT INTO `hj_u_m_selcourse` VALUES ('121', '0', '0', '0', '0', '0', '1', '2015-03-27 19:03:47', '1019963719', '0', '5');
INSERT INTO `hj_u_m_selcourse` VALUES ('122', '0', '0', '0', '0', '0', '1', '2015-03-27 19:04:11', '1019963719', '0', '5');
INSERT INTO `hj_u_m_selcourse` VALUES ('123', '0', '0', '0', '0', '0', '3', '2015-03-27 19:09:16', '1019963719', '0', '2');
INSERT INTO `hj_u_m_selcourse` VALUES ('124', '0', '0', '0', '0', '0', '2', '2015-06-04 08:29:54', '123456', '0', '2');
INSERT INTO `hj_u_m_selcourse` VALUES ('125', '0', '0', '0', '0', '0', '1', '2015-06-04 08:30:42', '123456', '0', '6');

-- ----------------------------
-- Table structure for `hj_u_m_students`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_students`;
CREATE TABLE `hj_u_m_students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned DEFAULT '0',
  `update_time` int(10) unsigned DEFAULT '0',
  `create_user` tinyint(10) unsigned DEFAULT '0',
  `update_user` tinyint(10) unsigned DEFAULT '0',
  `studentNo` int(10) NOT NULL DEFAULT '0',
  `studentName` varchar(100) DEFAULT '',
  `idCard` int(10) DEFAULT '0',
  `email` varchar(100) DEFAULT '',
  `address` varchar(100) DEFAULT '',
  `password` int(10) NOT NULL DEFAULT '0',
  `majoyName` int(10) DEFAULT '0',
  PRIMARY KEY (`id`,`studentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_students
-- ----------------------------
INSERT INTO `hj_u_m_students` VALUES ('1', '1416312362', '1420116926', '1', '1', '20111053', '何俊', '2147483647', 'junhey@qq.com', '景德镇陶瓷学院湘湖校区', '123456', '6');
INSERT INTO `hj_u_m_students` VALUES ('6', '0', '2015', '0', '0', '20111051', '小王', '360502', '', '景德镇', '0', '0');
INSERT INTO `hj_u_m_students` VALUES ('7', '0', '0', '0', '0', '20111052', '', '0', '', '', '123', '0');
INSERT INTO `hj_u_m_students` VALUES ('8', '0', '0', '0', '0', '20111054', '', '0', '', '', '123', '0');
INSERT INTO `hj_u_m_students` VALUES ('10', '0', '2015', '0', '0', '20111055', '范孝昌', '12312312', '', '15栋', '123', '0');
INSERT INTO `hj_u_m_students` VALUES ('11', '1427454140', '2015', '0', '0', '1019963719', '请更新信息', '123', '', '', '1019963719', '0');
INSERT INTO `hj_u_m_students` VALUES ('12', '1433377571', '0', '0', '0', '2147483647', '请更新信息', '0', '', '', '123456', '0');
INSERT INTO `hj_u_m_students` VALUES ('13', '1433377632', '2015', '0', '0', '123456', '何俊', '0', '', '', '123456', '0');

-- ----------------------------
-- Table structure for `hj_u_m_teachers`
-- ----------------------------
DROP TABLE IF EXISTS `hj_u_m_teachers`;
CREATE TABLE `hj_u_m_teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `teacherNo` int(10) NOT NULL DEFAULT '0',
  `teacherName` varchar(100) NOT NULL DEFAULT '',
  `gender` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `teachName` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_u_m_teachers
-- ----------------------------
INSERT INTO `hj_u_m_teachers` VALUES ('1', '1420681031', '1420681031', '1', '1', '12', '聂宇老师', '0', '111@qq.com', '123456', '1');
INSERT INTO `hj_u_m_teachers` VALUES ('2', '1420681059', '1420681059', '1', '1', '13', '李超老师', '0', '456@qq.com', '123', '1');

-- ----------------------------
-- Table structure for `hj_validations`
-- ----------------------------
DROP TABLE IF EXISTS `hj_validations`;
CREATE TABLE `hj_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hj_validations
-- ----------------------------
INSERT INTO `hj_validations` VALUES ('required', '必填');
INSERT INTO `hj_validations` VALUES ('valid_email', 'E-mail格式');
