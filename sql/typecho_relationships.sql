/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : app_junhey

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-25 17:18:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `typecho_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `typecho_relationships`;
CREATE TABLE `typecho_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecho_relationships
-- ----------------------------
INSERT INTO `typecho_relationships` VALUES ('5', '2');
INSERT INTO `typecho_relationships` VALUES ('5', '4');
INSERT INTO `typecho_relationships` VALUES ('6', '2');
INSERT INTO `typecho_relationships` VALUES ('6', '4');
INSERT INTO `typecho_relationships` VALUES ('7', '2');
INSERT INTO `typecho_relationships` VALUES ('7', '4');
INSERT INTO `typecho_relationships` VALUES ('9', '11');
INSERT INTO `typecho_relationships` VALUES ('9', '12');
INSERT INTO `typecho_relationships` VALUES ('10', '9');
INSERT INTO `typecho_relationships` VALUES ('10', '10');
INSERT INTO `typecho_relationships` VALUES ('11', '9');
INSERT INTO `typecho_relationships` VALUES ('11', '10');
INSERT INTO `typecho_relationships` VALUES ('33', '5');
INSERT INTO `typecho_relationships` VALUES ('33', '13');
INSERT INTO `typecho_relationships` VALUES ('34', '7');
INSERT INTO `typecho_relationships` VALUES ('35', '7');
INSERT INTO `typecho_relationships` VALUES ('35', '14');
INSERT INTO `typecho_relationships` VALUES ('38', '5');
INSERT INTO `typecho_relationships` VALUES ('38', '13');
INSERT INTO `typecho_relationships` VALUES ('41', '8');
INSERT INTO `typecho_relationships` VALUES ('41', '15');
INSERT INTO `typecho_relationships` VALUES ('42', '9');
INSERT INTO `typecho_relationships` VALUES ('42', '16');
INSERT INTO `typecho_relationships` VALUES ('44', '5');
INSERT INTO `typecho_relationships` VALUES ('44', '17');
INSERT INTO `typecho_relationships` VALUES ('45', '5');
INSERT INTO `typecho_relationships` VALUES ('45', '17');
INSERT INTO `typecho_relationships` VALUES ('45', '18');
INSERT INTO `typecho_relationships` VALUES ('46', '7');
INSERT INTO `typecho_relationships` VALUES ('46', '19');
INSERT INTO `typecho_relationships` VALUES ('47', '9');
INSERT INTO `typecho_relationships` VALUES ('48', '4');
INSERT INTO `typecho_relationships` VALUES ('48', '20');
INSERT INTO `typecho_relationships` VALUES ('49', '7');
INSERT INTO `typecho_relationships` VALUES ('49', '21');
INSERT INTO `typecho_relationships` VALUES ('51', '8');
INSERT INTO `typecho_relationships` VALUES ('51', '20');
INSERT INTO `typecho_relationships` VALUES ('53', '5');
INSERT INTO `typecho_relationships` VALUES ('54', '8');
INSERT INTO `typecho_relationships` VALUES ('54', '15');
INSERT INTO `typecho_relationships` VALUES ('56', '2');
INSERT INTO `typecho_relationships` VALUES ('56', '8');
INSERT INTO `typecho_relationships` VALUES ('59', '6');
INSERT INTO `typecho_relationships` VALUES ('59', '22');
INSERT INTO `typecho_relationships` VALUES ('60', '8');
INSERT INTO `typecho_relationships` VALUES ('60', '17');
INSERT INTO `typecho_relationships` VALUES ('60', '23');
INSERT INTO `typecho_relationships` VALUES ('61', '9');
INSERT INTO `typecho_relationships` VALUES ('61', '24');
INSERT INTO `typecho_relationships` VALUES ('63', '8');
INSERT INTO `typecho_relationships` VALUES ('64', '25');
INSERT INTO `typecho_relationships` VALUES ('64', '26');
INSERT INTO `typecho_relationships` VALUES ('65', '27');
INSERT INTO `typecho_relationships` VALUES ('65', '28');
INSERT INTO `typecho_relationships` VALUES ('67', '5');
INSERT INTO `typecho_relationships` VALUES ('67', '15');
INSERT INTO `typecho_relationships` VALUES ('70', '7');
INSERT INTO `typecho_relationships` VALUES ('70', '29');
INSERT INTO `typecho_relationships` VALUES ('75', '26');
INSERT INTO `typecho_relationships` VALUES ('75', '30');
INSERT INTO `typecho_relationships` VALUES ('79', '8');
INSERT INTO `typecho_relationships` VALUES ('79', '31');
INSERT INTO `typecho_relationships` VALUES ('81', '8');
INSERT INTO `typecho_relationships` VALUES ('81', '32');
INSERT INTO `typecho_relationships` VALUES ('85', '28');
INSERT INTO `typecho_relationships` VALUES ('85', '33');
INSERT INTO `typecho_relationships` VALUES ('86', '28');
INSERT INTO `typecho_relationships` VALUES ('86', '35');
INSERT INTO `typecho_relationships` VALUES ('87', '28');
INSERT INTO `typecho_relationships` VALUES ('87', '35');
INSERT INTO `typecho_relationships` VALUES ('90', '28');
INSERT INTO `typecho_relationships` VALUES ('94', '28');
INSERT INTO `typecho_relationships` VALUES ('100', '7');
INSERT INTO `typecho_relationships` VALUES ('104', '6');
INSERT INTO `typecho_relationships` VALUES ('104', '36');
INSERT INTO `typecho_relationships` VALUES ('116', '6');
INSERT INTO `typecho_relationships` VALUES ('116', '36');
INSERT INTO `typecho_relationships` VALUES ('117', '5');
INSERT INTO `typecho_relationships` VALUES ('117', '37');
INSERT INTO `typecho_relationships` VALUES ('121', '6');
INSERT INTO `typecho_relationships` VALUES ('121', '36');
INSERT INTO `typecho_relationships` VALUES ('124', '28');
INSERT INTO `typecho_relationships` VALUES ('124', '38');
INSERT INTO `typecho_relationships` VALUES ('127', '28');
INSERT INTO `typecho_relationships` VALUES ('127', '38');
INSERT INTO `typecho_relationships` VALUES ('128', '28');
INSERT INTO `typecho_relationships` VALUES ('128', '35');
INSERT INTO `typecho_relationships` VALUES ('129', '5');
INSERT INTO `typecho_relationships` VALUES ('129', '39');
INSERT INTO `typecho_relationships` VALUES ('130', '28');
INSERT INTO `typecho_relationships` VALUES ('130', '35');
INSERT INTO `typecho_relationships` VALUES ('131', '26');
INSERT INTO `typecho_relationships` VALUES ('131', '40');
INSERT INTO `typecho_relationships` VALUES ('137', '28');
INSERT INTO `typecho_relationships` VALUES ('137', '35');
INSERT INTO `typecho_relationships` VALUES ('137', '40');
INSERT INTO `typecho_relationships` VALUES ('141', '9');
INSERT INTO `typecho_relationships` VALUES ('141', '24');
INSERT INTO `typecho_relationships` VALUES ('144', '5');
INSERT INTO `typecho_relationships` VALUES ('144', '41');
INSERT INTO `typecho_relationships` VALUES ('148', '8');
INSERT INTO `typecho_relationships` VALUES ('148', '42');
INSERT INTO `typecho_relationships` VALUES ('149', '24');
INSERT INTO `typecho_relationships` VALUES ('149', '28');
INSERT INTO `typecho_relationships` VALUES ('150', '24');
INSERT INTO `typecho_relationships` VALUES ('150', '28');
INSERT INTO `typecho_relationships` VALUES ('154', '24');
INSERT INTO `typecho_relationships` VALUES ('154', '28');
INSERT INTO `typecho_relationships` VALUES ('157', '28');
INSERT INTO `typecho_relationships` VALUES ('157', '43');
INSERT INTO `typecho_relationships` VALUES ('160', '28');
INSERT INTO `typecho_relationships` VALUES ('160', '40');
INSERT INTO `typecho_relationships` VALUES ('161', '8');
INSERT INTO `typecho_relationships` VALUES ('161', '15');
INSERT INTO `typecho_relationships` VALUES ('163', '9');
INSERT INTO `typecho_relationships` VALUES ('163', '44');
INSERT INTO `typecho_relationships` VALUES ('164', '5');
INSERT INTO `typecho_relationships` VALUES ('164', '40');
INSERT INTO `typecho_relationships` VALUES ('167', '5');
INSERT INTO `typecho_relationships` VALUES ('167', '41');
INSERT INTO `typecho_relationships` VALUES ('167', '45');
INSERT INTO `typecho_relationships` VALUES ('167', '46');
INSERT INTO `typecho_relationships` VALUES ('173', '9');
INSERT INTO `typecho_relationships` VALUES ('173', '48');
INSERT INTO `typecho_relationships` VALUES ('174', '28');
INSERT INTO `typecho_relationships` VALUES ('174', '47');
INSERT INTO `typecho_relationships` VALUES ('178', '5');
INSERT INTO `typecho_relationships` VALUES ('178', '21');
INSERT INTO `typecho_relationships` VALUES ('179', '5');
INSERT INTO `typecho_relationships` VALUES ('186', '25');
INSERT INTO `typecho_relationships` VALUES ('186', '26');
INSERT INTO `typecho_relationships` VALUES ('188', '28');
INSERT INTO `typecho_relationships` VALUES ('188', '40');
INSERT INTO `typecho_relationships` VALUES ('188', '49');
INSERT INTO `typecho_relationships` VALUES ('189', '28');
INSERT INTO `typecho_relationships` VALUES ('189', '50');
INSERT INTO `typecho_relationships` VALUES ('189', '51');
INSERT INTO `typecho_relationships` VALUES ('190', '28');
INSERT INTO `typecho_relationships` VALUES ('190', '50');
INSERT INTO `typecho_relationships` VALUES ('190', '51');
INSERT INTO `typecho_relationships` VALUES ('192', '5');
INSERT INTO `typecho_relationships` VALUES ('194', '5');
INSERT INTO `typecho_relationships` VALUES ('194', '37');
INSERT INTO `typecho_relationships` VALUES ('194', '52');
INSERT INTO `typecho_relationships` VALUES ('200', '26');
INSERT INTO `typecho_relationships` VALUES ('200', '53');
INSERT INTO `typecho_relationships` VALUES ('201', '28');
INSERT INTO `typecho_relationships` VALUES ('201', '54');
INSERT INTO `typecho_relationships` VALUES ('202', '5');
INSERT INTO `typecho_relationships` VALUES ('202', '55');
INSERT INTO `typecho_relationships` VALUES ('203', '5');
INSERT INTO `typecho_relationships` VALUES ('203', '13');
INSERT INTO `typecho_relationships` VALUES ('205', '28');
INSERT INTO `typecho_relationships` VALUES ('205', '33');
INSERT INTO `typecho_relationships` VALUES ('207', '5');
INSERT INTO `typecho_relationships` VALUES ('207', '37');
INSERT INTO `typecho_relationships` VALUES ('209', '5');
INSERT INTO `typecho_relationships` VALUES ('209', '24');
INSERT INTO `typecho_relationships` VALUES ('209', '47');
INSERT INTO `typecho_relationships` VALUES ('209', '56');
INSERT INTO `typecho_relationships` VALUES ('211', '5');
INSERT INTO `typecho_relationships` VALUES ('211', '40');
INSERT INTO `typecho_relationships` VALUES ('212', '5');
INSERT INTO `typecho_relationships` VALUES ('212', '40');
INSERT INTO `typecho_relationships` VALUES ('213', '5');
INSERT INTO `typecho_relationships` VALUES ('213', '24');
INSERT INTO `typecho_relationships` VALUES ('213', '35');
INSERT INTO `typecho_relationships` VALUES ('216', '5');
INSERT INTO `typecho_relationships` VALUES ('216', '55');
INSERT INTO `typecho_relationships` VALUES ('217', '5');
INSERT INTO `typecho_relationships` VALUES ('219', '5');
INSERT INTO `typecho_relationships` VALUES ('219', '57');
INSERT INTO `typecho_relationships` VALUES ('220', '5');
INSERT INTO `typecho_relationships` VALUES ('220', '58');
INSERT INTO `typecho_relationships` VALUES ('221', '28');
INSERT INTO `typecho_relationships` VALUES ('221', '58');
INSERT INTO `typecho_relationships` VALUES ('221', '59');
INSERT INTO `typecho_relationships` VALUES ('222', '5');
INSERT INTO `typecho_relationships` VALUES ('222', '58');
INSERT INTO `typecho_relationships` VALUES ('223', '5');
INSERT INTO `typecho_relationships` VALUES ('223', '20');
INSERT INTO `typecho_relationships` VALUES ('224', '5');
INSERT INTO `typecho_relationships` VALUES ('224', '37');
