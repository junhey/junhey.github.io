/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : app_junhey

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-25 17:18:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `typecho_metas`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_metas`;
CREATE TABLE `typecho_metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `count` int(10) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_metas
-- ----------------------------
INSERT INTO `typecho_metas` VALUES ('10', 'eclipse', 'eclipse', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('2', 'css', 'css', 'tag', null, '4', '0', '0');
INSERT INTO `typecho_metas` VALUES ('4', 'CSS', 'css', 'category', null, '4', '2', '0');
INSERT INTO `typecho_metas` VALUES ('5', 'JavaScript', 'javascript', 'category', null, '26', '3', '0');
INSERT INTO `typecho_metas` VALUES ('6', 'Jquery', 'jquery', 'category', null, '4', '4', '0');
INSERT INTO `typecho_metas` VALUES ('7', 'PHP', 'php', 'category', null, '6', '5', '0');
INSERT INTO `typecho_metas` VALUES ('8', 'UI', 'ui', 'category', null, '10', '6', '0');
INSERT INTO `typecho_metas` VALUES ('9', 'Editor', 'editor', 'category', null, '8', '7', '0');
INSERT INTO `typecho_metas` VALUES ('11', 'java', 'java', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('12', 'java', 'java', 'category', 'java', '1', '8', '0');
INSERT INTO `typecho_metas` VALUES ('13', 'js', 'js', 'tag', null, '3', '0', '0');
INSERT INTO `typecho_metas` VALUES ('14', 'thinkphp', 'thinkphp', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('15', 'html', 'html', 'tag', null, '4', '0', '0');
INSERT INTO `typecho_metas` VALUES ('16', 'http', 'http', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('17', 'web', 'web', 'tag', null, '3', '0', '0');
INSERT INTO `typecho_metas` VALUES ('18', '移动', '移动', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('19', 'php', 'php', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('20', 'html5', 'html5', 'tag', null, '3', '0', '0');
INSERT INTO `typecho_metas` VALUES ('21', 'json', 'json', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('22', 'query', 'query', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('23', 'ps', 'ps', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('24', 'git', 'git', 'tag', null, '7', '0', '0');
INSERT INTO `typecho_metas` VALUES ('25', 'mongo', 'mongo', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('26', 'db', 'db', 'category', '数据库，大数据等开发', '5', '9', '0');
INSERT INTO `typecho_metas` VALUES ('27', '服务器', '服务器', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('28', 'server', 'server', 'category', null, '23', '10', '0');
INSERT INTO `typecho_metas` VALUES ('29', '代码搬运工', '代码搬运工', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('30', '创业', '创业', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('31', '移动web', '移动web', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('32', '布局', '布局', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('33', 'mysql', 'mysql', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('34', '查找', '查找', 'tag', null, '0', '0', '0');
INSERT INTO `typecho_metas` VALUES ('35', 'linux', 'linux', 'tag', null, '6', '0', '0');
INSERT INTO `typecho_metas` VALUES ('36', 'jquery', 'jquery', 'tag', null, '3', '0', '0');
INSERT INTO `typecho_metas` VALUES ('37', 'javascript', 'javascript', 'tag', null, '4', '0', '0');
INSERT INTO `typecho_metas` VALUES ('38', 'centos', 'centos', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('39', '正则', '正则', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('40', 'node', 'node', 'tag', null, '6', '0', '0');
INSERT INTO `typecho_metas` VALUES ('41', 'angular', 'angular', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('42', 'sofeware', 'sofeware', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('43', 'book', 'book', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('44', 'sublime', 'sublime', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('45', 'route', 'route', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('46', 'cnodejs', 'cnodejs', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('47', 'ubuntu', 'ubuntu', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('48', 'webstorm', 'webstorm', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('49', 'npm', 'npm', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('50', 'apache', 'apache', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('51', 'httpd', 'httpd', 'tag', null, '2', '0', '0');
INSERT INTO `typecho_metas` VALUES ('52', '离线缓存', '离线缓存', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('53', '数据表设计', '数据表设计', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('54', 'mongoose', 'mongoose', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('55', '正则表达式', '正则表达式', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('56', 'github', 'github', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('57', 'webpack', 'webpack', 'tag', null, '1', '0', '0');
INSERT INTO `typecho_metas` VALUES ('58', 'mac', 'mac', 'tag', null, '3', '0', '0');
INSERT INTO `typecho_metas` VALUES ('59', 'nginx', 'nginx', 'tag', null, '1', '0', '0');
