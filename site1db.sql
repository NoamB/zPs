# phpMyAdmin SQL Dump
# version 2.5.5-pl1
# http://www.phpmyadmin.net
#
# Host: localhost
# Generation Time: Jun 09, 2004 at 09:02 PM
# Server version: 4.0.18
# PHP Version: 4.3.5
# 
# Database : `site1db`
# 

# --------------------------------------------------------

#
# Table structure for table `access`
#

DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `u_id` int(10) unsigned NOT NULL default '0',
  `a_forum` int(10) unsigned NOT NULL default '0',
  `a_admin` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`u_id`),
  KEY `a_forum` (`a_forum`)
) TYPE=MyISAM;

#
# Dumping data for table `access`
#

INSERT INTO `access` VALUES (11, 2047, 131071);
INSERT INTO `access` VALUES (1, 0, 0);
INSERT INTO `access` VALUES (2, 47, 0);
INSERT INTO `access` VALUES (3, 47, 0);
INSERT INTO `access` VALUES (4, 47, 0);
INSERT INTO `access` VALUES (5, 47, 0);
INSERT INTO `access` VALUES (6, 0, 0);
INSERT INTO `access` VALUES (7, 0, 0);
INSERT INTO `access` VALUES (8, 0, 0);
INSERT INTO `access` VALUES (9, 47, 0);
INSERT INTO `access` VALUES (10, 0, 0);
INSERT INTO `access` VALUES (12, 47, 0);
INSERT INTO `access` VALUES (13, 47, 0);
INSERT INTO `access` VALUES (14, 47, 0);
INSERT INTO `access` VALUES (15, 0, 0);
INSERT INTO `access` VALUES (29, 1025, 1);
INSERT INTO `access` VALUES (30, 47, 0);
INSERT INTO `access` VALUES (25, 47, 0);
INSERT INTO `access` VALUES (31, 47, 0);
INSERT INTO `access` VALUES (32, 47, 0);
INSERT INTO `access` VALUES (33, 1, 0);

# --------------------------------------------------------

#
# Table structure for table `discussion`
#

DROP TABLE IF EXISTS `discussion`;
CREATE TABLE `discussion` (
  `d_id` int(10) unsigned NOT NULL auto_increment,
  `f_id` tinyint(6) unsigned NOT NULL default '0',
  `d_name` varchar(50) NOT NULL default '',
  `d_replies` int(10) unsigned NOT NULL default '0',
  `d_views` int(10) unsigned NOT NULL default '0',
  `d_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `d_by` int(10) unsigned NOT NULL default '0',
  `d_lastdate` datetime NOT NULL default '0000-00-00 00:00:00',
  `d_lastuser` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`d_id`),
  KEY `f_id` (`f_id`)
) TYPE=MyISAM AUTO_INCREMENT=90 ;

#
# Dumping data for table `discussion`
#

INSERT INTO `discussion` VALUES (1, 1, 'test-discussion', 157, 895, '0000-00-00 00:00:00', 12, '2004-04-11 06:41:07', 11);
INSERT INTO `discussion` VALUES (5, 1, 'third thread', 6, 35, '2004-03-20 02:49:36', 11, '2004-04-03 01:31:21', 14);
INSERT INTO `discussion` VALUES (4, 1, 'נושא שני', 3, 76, '2004-03-20 02:26:08', 11, '0000-00-00 00:00:00', 11);
INSERT INTO `discussion` VALUES (6, 1, 'נושא רביעי', 7, 32, '2004-03-20 16:33:02', 11, '0000-00-00 00:00:00', 11);
INSERT INTO `discussion` VALUES (8, 1, 'sixth sense', 5, 72, '2004-03-20 16:42:12', 11, '2004-04-08 18:50:21', 11);
INSERT INTO `discussion` VALUES (9, 1, 'משה הלך לחפש!', 10, 66, '2004-03-25 19:05:05', 11, '2004-04-06 21:53:52', 11);
INSERT INTO `discussion` VALUES (10, 1, 'שילוב של עברית and english באותו משפט', 4, 32, '2004-03-25 19:05:35', 11, '0000-00-00 00:00:00', 11);
INSERT INTO `discussion` VALUES (11, 1, 'שלום לכולם, אני חדש!!!!2221111', 7, 110, '2004-03-26 19:13:05', 14, '2004-04-03 06:14:08', 11);
INSERT INTO `discussion` VALUES (12, 1, 'goattiinngg', 5, 55, '2004-03-28 17:06:24', 14, '2004-03-28 17:15:24', 11);
INSERT INTO `discussion` VALUES (40, 1, 'fdasd', 1, 11, '2004-04-04 16:05:37', 14, '2004-04-08 17:06:11', 11);
INSERT INTO `discussion` VALUES (14, 1, 'סתם דיון', 4, 47, '2004-04-03 01:30:37', 11, '2004-04-16 13:30:20', 11);
INSERT INTO `discussion` VALUES (34, 2, 'הלו', 0, 2, '2004-04-03 23:43:47', 11, '2004-04-03 23:43:47', 11);
INSERT INTO `discussion` VALUES (35, 3, 'דשגכ', 0, 1, '2004-04-04 00:12:10', 11, '2004-04-04 00:12:10', 11);
INSERT INTO `discussion` VALUES (36, 3, 'שדגש', 0, 1, '2004-04-04 00:12:16', 11, '2004-04-04 00:12:16', 11);
INSERT INTO `discussion` VALUES (38, 4, 'דגכד', 0, 1, '2004-04-04 00:20:58', 11, '2004-04-04 00:20:58', 11);
INSERT INTO `discussion` VALUES (39, 4, '@@@', 0, 1, '2004-04-04 00:21:35', 11, '2004-04-04 00:21:35', 11);
INSERT INTO `discussion` VALUES (41, 4, 'בדיקה', 3, 9, '2004-04-04 16:44:59', 11, '2004-04-04 16:45:42', 11);
INSERT INTO `discussion` VALUES (42, 3, 'דיוטטט', 2, 22, '2004-04-06 21:57:11', 11, '2004-04-06 22:05:05', 14);
INSERT INTO `discussion` VALUES (43, 3, '123', 7, 116, '2004-04-06 22:09:28', 11, '2004-04-07 04:05:10', 11);
INSERT INTO `discussion` VALUES (44, 3, '543534534', 7, 73, '2004-04-07 04:37:31', 11, '2004-04-07 15:38:28', 11);
INSERT INTO `discussion` VALUES (45, 4, 'shut the feck up', 0, 5, '2004-04-08 14:41:21', 11, '2004-04-08 14:41:21', 11);
INSERT INTO `discussion` VALUES (46, 1, 'hahaha', 0, 0, '2004-04-08 18:40:13', 11, '2004-04-08 18:40:13', 11);
INSERT INTO `discussion` VALUES (47, 1, 'hahaha', 2, 3, '2004-04-08 18:40:43', 11, '2004-04-08 18:41:40', 11);
INSERT INTO `discussion` VALUES (48, 3, '123', 2, 5, '2004-04-08 18:43:59', 11, '2004-04-08 18:46:01', 14);
INSERT INTO `discussion` VALUES (49, 3, 'מיאו', 0, 3, '2004-04-08 18:48:07', 14, '2004-04-08 18:48:07', 14);
INSERT INTO `discussion` VALUES (50, 4, 'שלום אני סער אני חדש פה!', 4, 17, '2004-04-08 22:28:30', 20, '2004-04-08 22:30:36', 14);
INSERT INTO `discussion` VALUES (51, 3, 'כותרת', 0, 6, '2004-04-08 23:23:45', 11, '2004-04-08 23:23:45', 11);
INSERT INTO `discussion` VALUES (52, 3, 'מגיע זמנו של כל אדם לרדת', 3, 16, '2004-04-08 23:39:31', 14, '2004-04-09 00:16:34', 11);
INSERT INTO `discussion` VALUES (53, 3, 'שדגדשג,גדש', 0, 1, '2004-04-08 23:52:21', 11, '2004-04-08 23:52:21', 11);
INSERT INTO `discussion` VALUES (57, 4, 'כותרת.דגכ', 0, 1, '2004-04-09 00:36:44', 11, '2004-04-09 00:36:44', 11);
INSERT INTO `discussion` VALUES (56, 4, 'שדג', 0, 1, '2004-04-09 00:27:35', 11, '2004-04-09 00:27:35', 11);
INSERT INTO `discussion` VALUES (59, 4, 'test', 0, 1, '2004-04-09 00:48:07', 11, '2004-04-09 00:48:07', 11);
INSERT INTO `discussion` VALUES (60, 4, 'test2', 0, 15, '2004-04-09 00:48:42', 11, '2004-04-09 00:48:42', 11);
INSERT INTO `discussion` VALUES (61, 4, 'test', 0, 2, '2004-04-09 00:50:40', 11, '2004-04-09 00:50:40', 11);
INSERT INTO `discussion` VALUES (62, 4, 'test4', 0, 7, '2004-04-09 00:53:09', 11, '2004-04-09 00:53:09', 11);
INSERT INTO `discussion` VALUES (63, 4, 'test', 0, 1, '2004-04-09 00:58:41', 11, '2004-04-09 00:58:41', 11);
INSERT INTO `discussion` VALUES (76, 4, 'שדגשדג', 0, 1, '2004-04-09 01:36:07', 11, '2004-04-09 01:36:07', 11);
INSERT INTO `discussion` VALUES (75, 4, 'משהו חדשני', 0, 1, '2004-04-09 01:29:55', 11, '2004-04-09 01:29:55', 11);
INSERT INTO `discussion` VALUES (70, 4, 'נסיון 10000', 0, 2, '2004-04-09 01:12:34', 11, '2004-04-09 01:12:34', 11);
INSERT INTO `discussion` VALUES (78, 4, 'קו נטוי שמאלה', 1, 5, '2004-04-09 02:48:27', 11, '2004-04-09 02:48:41', 11);
INSERT INTO `discussion` VALUES (77, 4, 'אאאא', 0, 2, '2004-04-09 01:46:54', 11, '2004-04-09 01:46:54', 11);
INSERT INTO `discussion` VALUES (79, 1, 'O\'reilty', 0, 10, '2004-04-09 03:29:07', 21, '2004-04-09 03:29:07', 21);
INSERT INTO `discussion` VALUES (74, 4, 'did you know?', 0, 7, '2004-04-09 01:18:25', 11, '2004-04-09 01:18:25', 11);
INSERT INTO `discussion` VALUES (80, 4, 'א\'וריילי', 0, 2, '2004-04-09 03:29:29', 21, '2004-04-09 03:29:29', 21);
INSERT INTO `discussion` VALUES (81, 3, 'א~א', 0, 5, '2004-04-09 03:31:04', 21, '2004-04-09 03:31:04', 21);
INSERT INTO `discussion` VALUES (82, 4, 'אהלן וסהלן', 1, 16, '2004-04-09 14:08:23', 11, '2004-04-09 14:44:01', 11);
INSERT INTO `discussion` VALUES (83, 4, '3452', 0, 2, '2004-04-09 14:54:48', 11, '2004-04-09 14:54:48', 11);
INSERT INTO `discussion` VALUES (84, 3, '1234', 2, 7, '2004-04-09 15:13:11', 11, '2004-04-09 15:17:30', 11);
INSERT INTO `discussion` VALUES (85, 3, 'dsf', 2, 4, '2004-04-09 15:21:05', 11, '2004-04-09 15:21:11', 11);
INSERT INTO `discussion` VALUES (86, 3, '12321321', 1, 11, '2004-04-09 15:21:35', 11, '2004-04-09 15:29:58', 11);
INSERT INTO `discussion` VALUES (87, 3, 'huhuhuhu', 19, 151, '2004-04-09 15:49:11', 11, '2004-04-19 21:01:15', 11);
INSERT INTO `discussion` VALUES (88, 1, 'דיוטטט', 0, 2, '2004-04-11 12:49:59', 11, '2004-04-11 12:49:59', 11);
INSERT INTO `discussion` VALUES (89, 3, 'wow nice forum :D', 0, 26, '2004-04-23 14:34:05', 11, '2004-04-23 14:34:05', 11);

# --------------------------------------------------------

#
# Table structure for table `forum`
#

DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `f_id` int(10) unsigned NOT NULL auto_increment,
  `f_name` varchar(50) NOT NULL default '',
  `f_order` int(10) unsigned NOT NULL default '0',
  `f_discs` int(10) unsigned NOT NULL default '0',
  `f_posts` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`f_id`)
) TYPE=MyISAM AUTO_INCREMENT=6 ;

#
# Dumping data for table `forum`
#

INSERT INTO `forum` VALUES (1, 'חדשות', 0, 16, 224);
INSERT INTO `forum` VALUES (3, 'פורום שני', 0, 16, 61);
INSERT INTO `forum` VALUES (4, 'פורום שלישי', 0, 21, 30);
INSERT INTO `forum` VALUES (5, 'סקרים', 0, 0, 0);

# --------------------------------------------------------

#
# Table structure for table `online`
#

DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `o_sid` char(32) NOT NULL default '',
  `o_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `o_ip` char(15) NOT NULL default '0.0.0.0',
  `o_id` int(10) unsigned NOT NULL default '0',
  `o_uri` char(255) NOT NULL default ''
) TYPE=MyISAM;

#
# Dumping data for table `online`
#

INSERT INTO `online` VALUES ('9c7b18fbd5e58284c90bb74f911f0652', '2004-05-20 12:36:27', '127.0.0.1', 11, '/site1/?p=post&d_id=1&f_id=1&pn=1&view=tree');

# --------------------------------------------------------

#
# Table structure for table `post_body`
#

DROP TABLE IF EXISTS `post_body`;
CREATE TABLE `post_body` (
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `p_body` text NOT NULL,
  `p_lang` char(3) NOT NULL default 'rtl',
  PRIMARY KEY  (`p_id`)
) TYPE=MyISAM AUTO_INCREMENT=389 ;

#
# Dumping data for table `post_body`
#

INSERT INTO `post_body` VALUES (1, 'טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעברית טקסט בעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבע בריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבר יתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעברית בעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבע בריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבר יתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעברית בעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבע בריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבריתבעבר יתבעבריתבעבריתבעברית בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית  בעברית', 'rtl');
INSERT INTO `post_body` VALUES (2, 'טקסט בעברית\r\nמושון!\r\nעריכה 2: בלהבלה\r\nעריכה 3: [מ]מודגש[/מ]', 'rtl');
INSERT INTO `post_body` VALUES (170, 'שדגכשדג', 'rtl');
INSERT INTO `post_body` VALUES (5, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (6, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (7, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (8, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (9, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (10, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (11, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (12, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (13, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (14, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (15, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (16, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (17, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (18, 'טקסט \r\nשדגש\r\nגדשגש\r\nבעברית', 'rtl');
INSERT INTO `post_body` VALUES (19, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (20, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (21, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (22, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (23, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (24, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (25, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (26, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (27, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (28, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (29, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (30, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (31, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (32, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (33, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (34, 'טקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט בעבריתטקסט\nבעבריתטקסט בעבריתטקסט בעבריתטקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (35, 'טקסט בעברית 2132', 'rtl');
INSERT INTO `post_body` VALUES (36, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (37, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (38, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (39, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (40, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (41, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (42, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (43, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (44, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (45, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (46, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (47, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (48, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (49, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (50, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (51, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (52, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (53, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (54, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (55, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (56, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (57, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (58, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (59, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (60, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (62, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (63, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (64, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (65, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (66, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (67, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (68, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (69, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (70, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (71, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (72, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (73, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (74, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (75, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (169, 'כגדעגד', 'rtl');
INSERT INTO `post_body` VALUES (77, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (78, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (79, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (80, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (81, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (83, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (84, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (85, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (86, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (87, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (88, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (89, 'טקסט בעברית\r\nכעגכעכגעכגעגכעכגע\r\nגכעכגעכגעכגעכגעכגע\r\nכגעכגעכגעגכעגכע\r\nכגעכגעכגעכגעגכ', 'rtl');
INSERT INTO `post_body` VALUES (90, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (91, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (92, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (93, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (94, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (95, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (168, 'גדשכ', 'rtl');
INSERT INTO `post_body` VALUES (167, '444', 'rtl');
INSERT INTO `post_body` VALUES (98, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (99, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (100, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (101, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (102, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (103, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (104, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (105, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (106, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (107, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (108, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (109, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (110, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (111, '[ק]טקסט בעברית[/ק]', 'rtl');
INSERT INTO `post_body` VALUES (113, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (114, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (115, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (116, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (117, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (118, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (119, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (121, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (122, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (123, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (124, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (125, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (126, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (127, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (128, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (129, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (158, 'אהלן וסהלן\r\nעריכה: נסיון עריכה\r\nעריכה 2: עכשיו עם \\&quot;מרכאות כפולות\\&quot; וגם \\\'גרשיים\\\' ...', 'rtl');
INSERT INTO `post_body` VALUES (131, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (132, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (133, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (134, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (135, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (136, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (137, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (138, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (139, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (140, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (141, 'טקסט בעברית !', 'rtl');
INSERT INTO `post_body` VALUES (142, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (143, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (144, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (145, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (146, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (147, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (148, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (149, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (150, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (151, 'טקסט בעברית', 'rtl');
INSERT INTO `post_body` VALUES (152, '324rds', 'rtl');
INSERT INTO `post_body` VALUES (153, '324rds', 'rtl');
INSERT INTO `post_body` VALUES (154, '324rds', 'rtl');
INSERT INTO `post_body` VALUES (155, '324rds', 'rtl');
INSERT INTO `post_body` VALUES (159, 'שדגש', 'rtl');
INSERT INTO `post_body` VALUES (160, 'שדגשדג', 'rtl');
INSERT INTO `post_body` VALUES (161, 'english this time!', 'rtl');
INSERT INTO `post_body` VALUES (162, 'english indeed', 'rtl');
INSERT INTO `post_body` VALUES (163, 'asdsad', 'rtl');
INSERT INTO `post_body` VALUES (165, 'asdasd', 'rtl');
INSERT INTO `post_body` VALUES (171, 'שגדכגדשכ', 'rtl');
INSERT INTO `post_body` VALUES (173, 'sersergfdgfd', 'rtl');
INSERT INTO `post_body` VALUES (174, 'dsfdsf', 'rtl');
INSERT INTO `post_body` VALUES (175, 'sfdds', 'rtl');
INSERT INTO `post_body` VALUES (176, 'dsfsdf', 'rtl');
INSERT INTO `post_body` VALUES (177, 'gfdgd', 'rtl');
INSERT INTO `post_body` VALUES (179, 'שששששששששששששששששששששששששששששששששששששששששששששששששש\r\nשששששששששששששששששששששששששששששששששששששששששששששששששש\r\nשששששששששששששששששששששששששששששששששששששששששששששששששש\r\nששששששששש', 'rtl');
INSERT INTO `post_body` VALUES (180, 'fdsaf', 'rtl');
INSERT INTO `post_body` VALUES (181, 'dsf', 'rtl');
INSERT INTO `post_body` VALUES (182, 'rewr', 'rtl');
INSERT INTO `post_body` VALUES (183, 'dsfds', 'rtl');
INSERT INTO `post_body` VALUES (184, 'היי!', 'rtl');
INSERT INTO `post_body` VALUES (185, 'מה המצב??', 'rtl');
INSERT INTO `post_body` VALUES (186, '[נ]רז גוד קיייי[/נ]', 'rtl');
INSERT INTO `post_body` VALUES (187, '[ק][מ]בלבלניי ביצים אתם :) וואלה[/מ][/ק]', 'rtl');
INSERT INTO `post_body` VALUES (254, '[u]asd[/u]', 'rtl');
INSERT INTO `post_body` VALUES (189, 'דלום', 'rtl');
INSERT INTO `post_body` VALUES (190, 'שלום ו-hello לכולם what\\\'s up? הכל טוב?', 'rtl');
INSERT INTO `post_body` VALUES (191, 'יאללה משה לך הביתה!', 'rtl');
INSERT INTO `post_body` VALUES (193, 'שלום ותודה!', 'rtl');
INSERT INTO `post_body` VALUES (194, 'weeeeeeeeeeee', 'rtl');
INSERT INTO `post_body` VALUES (195, 'weeeee', 'rtl');
INSERT INTO `post_body` VALUES (196, 'weeeeeeeeee', 'rtl');
INSERT INTO `post_body` VALUES (197, 'weeeeeeeeeeeee', 'rtl');
INSERT INTO `post_body` VALUES (203, 'qwe', 'rtl');
INSERT INTO `post_body` VALUES (204, 'אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש אני חדש דנדש', 'rtl');
INSERT INTO `post_body` VALUES (205, 'סבבה אחיייייייייייי \r\nברוך הבא כפרה עיניםם נשמה עיוני', 'rtl');
INSERT INTO `post_body` VALUES (206, 'חיייייייייייייי', 'rtl');
INSERT INTO `post_body` VALUES (208, 'goat', 'rtl');
INSERT INTO `post_body` VALUES (209, 'walla', 'rtl');
INSERT INTO `post_body` VALUES (210, 'asd', 'rtl');
INSERT INTO `post_body` VALUES (211, 'zoorrrr', 'rtl');
INSERT INTO `post_body` VALUES (212, 'adsf', 'rtl');
INSERT INTO `post_body` VALUES (213, '‎', 'rtl');
INSERT INTO `post_body` VALUES (215, 'gut', 'rtl');
INSERT INTO `post_body` VALUES (216, 'fagle', 'rtl');
INSERT INTO `post_body` VALUES (217, 'abashcha', 'rtl');
INSERT INTO `post_body` VALUES (218, 'safta shelha ha zona\r\nve ha forum ha buggy shelha', 'rtl');
INSERT INTO `post_body` VALUES (219, 'halo bli sabim\r\nedit: ve bli bugim!', 'rtl');
INSERT INTO `post_body` VALUES (221, 'sadf', 'rtl');
INSERT INTO `post_body` VALUES (222, 'goat', 'rtl');
INSERT INTO `post_body` VALUES (223, 'asd', 'rtl');
INSERT INTO `post_body` VALUES (224, 'כל הדמן', 'rtl');
INSERT INTO `post_body` VALUES (225, 'asd', 'rtl');
INSERT INTO `post_body` VALUES (238, 'דגכ', 'rtl');
INSERT INTO `post_body` VALUES (255, 'ככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככככ\nכככככככככככככככככ', 'rtl');
INSERT INTO `post_body` VALUES (257, 'דגכ', 'rtl');
INSERT INTO `post_body` VALUES (258, 'שדג', 'rtl');
INSERT INTO `post_body` VALUES (262, 'dfs', 'rtl');
INSERT INTO `post_body` VALUES (260, 'דגכ', 'rtl');
INSERT INTO `post_body` VALUES (261, '@@#!', 'rtl');
INSERT INTO `post_body` VALUES (263, 'ואל תתקשר אלי, אני לא עונה', 'rtl');
INSERT INTO `post_body` VALUES (264, 'שלום', 'rtl');
INSERT INTO `post_body` VALUES (265, 'מה קורה?', 'rtl');
INSERT INTO `post_body` VALUES (266, 'אנגלית', 'rtl');
INSERT INTO `post_body` VALUES (267, 'סבבי', 'rtl');
INSERT INTO `post_body` VALUES (353, '45354', 'rtl');
INSERT INTO `post_body` VALUES (354, 'sdf', 'rtl');
INSERT INTO `post_body` VALUES (355, 'sdf', 'rtl');
INSERT INTO `post_body` VALUES (268, 'asda', 'rtl');
INSERT INTO `post_body` VALUES (269, 'asdasd', 'rtl');
INSERT INTO `post_body` VALUES (384, 'http://www.blbla.com', 'rtl');
INSERT INTO `post_body` VALUES (272, '4363453', 'rtl');
INSERT INTO `post_body` VALUES (273, 'asdasd', 'rtl');
INSERT INTO `post_body` VALUES (274, 'another new post', 'rtl');
INSERT INTO `post_body` VALUES (275, 'הודעה 1', 'rtl');
INSERT INTO `post_body` VALUES (276, 'הודעה 2', 'rtl');
INSERT INTO `post_body` VALUES (277, 'הודעה 3', 'rtl');
INSERT INTO `post_body` VALUES (278, 'דיוט!', 'rtl');
INSERT INTO `post_body` VALUES (279, 'דכגדגכ', 'rtl');
INSERT INTO `post_body` VALUES (280, 'משה המנמניאק', 'rtl');
INSERT INTO `post_body` VALUES (281, '12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345\n12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345\n12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345\n12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345 12345', 'rtl');
INSERT INTO `post_body` VALUES (282, '456', 'rtl');
INSERT INTO `post_body` VALUES (283, '789', 'rtl');
INSERT INTO `post_body` VALUES (284, 'qweqwe', 'rtl');
INSERT INTO `post_body` VALUES (285, '234', 'rtl');
INSERT INTO `post_body` VALUES (286, '789', 'rtl');
INSERT INTO `post_body` VALUES (287, 'אניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאנ\nיאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניא\nחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחל\nהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהא\nניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאני\nאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלהאניאחלה', 'rtl');
INSERT INTO `post_body` VALUES (288, 'גכדכגד כגד כגד כגד כגד גדכ  דגכ דכג דגכ דכג דגכדגכ דגכ   דגכ דגכ כד דג כדג כדגכ דגכ דגכד גדכ דגכ דגכ\nדכ דגכ דג.\r\nדגכ דגכ דגכ דגכד כגד גד.\r\nגכדכגד כגד כגד כגד כגד גדכ  דגכ דכג דגכ דכג דגכדגכ דגכ   דגכ דגכ כד דג כדג כדגכ דגכ דגכד גדכ דגכ דגכ\nדכ דגכ דג.\r\n\r\nגכדכגד כגד כגד כגד כגד גדכ  דגכ דכג דגכ דכג דגכדגכ דגכ   דגכ דגכ כד דג כדג כדגכ דגכ דגכד גדכ דגכ דגכ\nדכ דגכ דג.\r\n\r\nגכדכגד כגד כגד כגד כגד גדכ  דגכ דכג דגכ דכג דגכדגכ דגכ   דגכ דגכ כד דג כדג כדגכ דגכ דגכד גדכ דגכ דגכ\nדכ דגכ דג.', 'rtl');
INSERT INTO `post_body` VALUES (289, 'מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה\nועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד\nמילה. מילה ועוד מילה. מילה ועוד מילה. מילה ועוד מילה.', 'rtl');
INSERT INTO `post_body` VALUES (290, '3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333\n3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333\n3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333\n3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333\n3333333333', 'rtl');
INSERT INTO `post_body` VALUES (291, '56465463453453', 'rtl');
INSERT INTO `post_body` VALUES (292, '654345634', 'rtl');
INSERT INTO `post_body` VALUES (293, '34141321', 'rtl');
INSERT INTO `post_body` VALUES (301, 'adsf', 'rtl');
INSERT INTO `post_body` VALUES (302, '435', 'rtl');
INSERT INTO `post_body` VALUES (303, '%%%%', 'rtl');
INSERT INTO `post_body` VALUES (304, 'מה אתה אומר!', 'rtl');
INSERT INTO `post_body` VALUES (305, 'חתולה', 'rtl');
INSERT INTO `post_body` VALUES (306, '1234!!!@', 'rtl');
INSERT INTO `post_body` VALUES (307, 'שלום לכולם!', 'rtl');
INSERT INTO `post_body` VALUES (294, '098089', 'rtl');
INSERT INTO `post_body` VALUES (295, '4352345', 'rtl');
INSERT INTO `post_body` VALUES (296, '', 'rtl');
INSERT INTO `post_body` VALUES (297, 'mkay??', 'rtl');
INSERT INTO `post_body` VALUES (298, 'asdasd', 'rtl');
INSERT INTO `post_body` VALUES (299, 'hhehehe', 'rtl');
INSERT INTO `post_body` VALUES (300, 'adsf', 'rtl');
INSERT INTO `post_body` VALUES (308, 'אהלן סער\r\nברוך הבא!', 'rtl');
INSERT INTO `post_body` VALUES (309, 'תודה!', 'rtl');
INSERT INTO `post_body` VALUES (310, 'על לא דבר!', 'rtl');
INSERT INTO `post_body` VALUES (311, 'שלום סער', 'rtl');
INSERT INTO `post_body` VALUES (312, 'מענין מי בחר את השם משתמש', 'rtl');
INSERT INTO `post_body` VALUES (313, 'מבדיחה מסוימת בחייו, וזהו.', 'rtl');
INSERT INTO `post_body` VALUES (314, 'שדגשד,דשגשד', 'rtl');
INSERT INTO `post_body` VALUES (321, 'העיקר אתה אומר\r\nשדג שדג שדג\r\n גדשגדש \r\nשדגדש', 'rtl');
INSERT INTO `post_body` VALUES (316, 'וטוב שכך', 'rtl');
INSERT INTO `post_body` VALUES (318, 'נסיון\r\nנסיון', 'rtl');
INSERT INTO `post_body` VALUES (319, 'נסיון\r\nנסיון\r\n*\r\n,', 'rtl');
INSERT INTO `post_body` VALUES (322, 'משהו.משהו.משהו.', 'rtl');
INSERT INTO `post_body` VALUES (323, 'test / test', 'rtl');
INSERT INTO `post_body` VALUES (324, 'test / test', 'rtl');
INSERT INTO `post_body` VALUES (325, 'test123', 'rtl');
INSERT INTO `post_body` VALUES (326, 'test123', 'rtl');
INSERT INTO `post_body` VALUES (327, 'test / / //test\r\n\r\ntest &quot;test&quot; test', 'rtl');
INSERT INTO `post_body` VALUES (328, 'test &quot;test&quot; test', 'rtl');
INSERT INTO `post_body` VALUES (340, 'חדש', 'rtl');
INSERT INTO `post_body` VALUES (341, 'שדגשד גדש גדש \r\nגדש גדש שדג \r\nגדש, גדש גדש, גדש גשד.', 'rtl');
INSERT INTO `post_body` VALUES (335, 'העיקר אתה אומר\r\n&quot;סיימתי פרוייקט&quot;\r\nזורק פצצות לאוויר ולא מגבה אותם\r\n\r\nציטוט מסרט/שיר', 'rtl');
INSERT INTO `post_body` VALUES (342, 'אאאאאאאא &quot;אאאאאאא&quot;אאאאאאאאאא&quot;אאא', 'rtl');
INSERT INTO `post_body` VALUES (339, 'human teleportation, moleculer decimation, breakdown reformation is inherently purging.\r\nIt Make a Man a KING!', 'rtl');
INSERT INTO `post_body` VALUES (343, '\\ משה \\ משון \\ דנה', 'rtl');
INSERT INTO `post_body` VALUES (344, 'עובד כמו MELECH', 'rtl');
INSERT INTO `post_body` VALUES (345, 'O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty O\'reilty', 'rtl');
INSERT INTO `post_body` VALUES (346, 'א\'וריילי', 'rtl');
INSERT INTO `post_body` VALUES (347, 'א\'א\r\na`a````', 'rtl');
INSERT INTO `post_body` VALUES (348, 'אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן   אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן  אהלן', 'rtl');
INSERT INTO `post_body` VALUES (352, '2311', 'rtl');
INSERT INTO `post_body` VALUES (349, 'מה המצב\r\nחצב\r\n:-)', 'rtl');
INSERT INTO `post_body` VALUES (350, '43234', 'rtl');
INSERT INTO `post_body` VALUES (351, '1111111111111111111111111111111111111111111\r\n11111111111111111111111', 'rtl');
INSERT INTO `post_body` VALUES (356, 'sdf', 'rtl');
INSERT INTO `post_body` VALUES (357, '13', 'rtl');
INSERT INTO `post_body` VALUES (358, '213fd\r\nfds', 'rtl');
INSERT INTO `post_body` VALUES (359, 'huhuhuhu\r\nמשה &quot;משה&quot; , \'משה\', `משה`', 'rtl');
INSERT INTO `post_body` VALUES (360, 'huhuhuhu\r\n\r\n&quot;מושון , \'משה\' מוש&quot;', 'ltr');
INSERT INTO `post_body` VALUES (361, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (362, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (363, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (364, 'huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (365, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (366, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (367, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (368, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (369, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (370, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (371, 'rrr', 'rtl');
INSERT INTO `post_body` VALUES (372, 'huhuhuhu', 'rtl');
INSERT INTO `post_body` VALUES (373, 'ךםך', 'rtl');
INSERT INTO `post_body` VALUES (383, 'ui', 'rtl');
INSERT INTO `post_body` VALUES (378, '123', 'rtl');
INSERT INTO `post_body` VALUES (379, 'דיוטט', 'rtl');
INSERT INTO `post_body` VALUES (380, 'werwer:', 'rtl');
INSERT INTO `post_body` VALUES (381, 'hi:hi', 'rtl');
INSERT INTO `post_body` VALUES (382, 'ki:ki;', 'rtl');
INSERT INTO `post_body` VALUES (385, '&quot;משה&quot;תכגדכגד\r\nגדכד ת דגכד, גדכד, ````משהqwe;;;', 'rtl');
INSERT INTO `post_body` VALUES (386, '34', '');
INSERT INTO `post_body` VALUES (387, '2134', '');
INSERT INTO `post_body` VALUES (388, 'i am teh zorba :D\r\n\r\nu can sell this forum', 'ltr');

# --------------------------------------------------------

#
# Table structure for table `post_header`
#

DROP TABLE IF EXISTS `post_header`;
CREATE TABLE `post_header` (
  `p_id` int(10) unsigned NOT NULL auto_increment,
  `d_id` int(10) unsigned NOT NULL default '0',
  `u_id` int(10) unsigned NOT NULL default '0',
  `p_parent` int(10) unsigned NOT NULL default '0',
  `p_order` int(10) unsigned NOT NULL default '0',
  `p_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `p_edit` datetime NOT NULL default '0000-00-00 00:00:00',
  `p_editby` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`p_id`),
  KEY `d_id` (`d_id`),
  KEY `u_id` (`u_id`),
  KEY `p_parent` (`p_parent`)
) TYPE=MyISAM AUTO_INCREMENT=389 ;

#
# Dumping data for table `post_header`
#

INSERT INTO `post_header` VALUES (1, 1, 5, 0, 0, '2004-03-06 12:50:15', '2004-04-09 14:40:21', 11);
INSERT INTO `post_header` VALUES (2, 1, 9, 1, 1, '2004-03-06 12:50:16', '2004-03-17 18:24:23', 11);
INSERT INTO `post_header` VALUES (170, 6, 11, 169, 3, '2004-03-20 16:38:48', '2004-03-20 16:38:48', 0);
INSERT INTO `post_header` VALUES (5, 1, 3, 1, 4, '2004-03-06 12:50:19', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (6, 1, 2, 1, 5, '2004-03-06 12:50:20', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (7, 1, 8, 1, 6, '2004-03-06 12:50:21', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (8, 1, 2, 1, 7, '2004-03-06 12:50:22', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (9, 1, 11, 1, 8, '2004-03-06 12:50:23', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (10, 1, 2, 1, 9, '2004-03-06 12:50:24', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (11, 1, 4, 1, 10, '2004-03-06 12:50:25', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (12, 1, 9, 1, 11, '2004-03-06 12:50:26', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (13, 1, 4, 1, 12, '2004-03-06 12:50:27', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (14, 1, 3, 1, 13, '2004-03-06 12:50:28', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (15, 1, 5, 1, 14, '2004-03-06 12:50:29', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (16, 1, 8, 1, 15, '2004-03-06 12:50:30', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (17, 1, 8, 1, 16, '2004-03-06 12:50:31', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (18, 1, 3, 1, 17, '2004-03-06 12:50:32', '2004-03-20 23:33:45', 11);
INSERT INTO `post_header` VALUES (19, 1, 9, 1, 18, '2004-03-06 12:50:33', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (20, 1, 4, 1, 19, '2004-03-06 12:50:34', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (21, 1, 7, 1, 20, '2004-03-06 12:50:35', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (22, 1, 4, 1, 21, '2004-03-06 12:50:36', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (23, 1, 11, 1, 22, '2004-03-06 12:50:37', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (24, 1, 12, 1, 23, '2004-03-06 12:50:38', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (25, 1, 4, 1, 24, '2004-03-06 12:50:39', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (26, 1, 7, 1, 25, '2004-03-06 12:50:40', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (27, 1, 10, 1, 26, '2004-03-06 12:50:41', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (28, 1, 3, 1, 27, '2004-03-06 12:50:42', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (29, 1, 7, 1, 28, '2004-03-06 12:50:43', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (30, 1, 2, 1, 29, '2004-03-06 12:50:44', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (31, 1, 11, 1, 30, '2004-03-06 12:50:45', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (32, 1, 1, 1, 31, '2004-03-06 12:50:46', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (33, 1, 8, 1, 32, '2004-03-06 12:50:47', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (34, 1, 12, 1, 33, '2004-03-06 12:50:48', '2004-04-06 19:25:41', 11);
INSERT INTO `post_header` VALUES (35, 1, 2, 1, 34, '2004-03-06 12:50:49', '2004-03-20 19:54:32', 11);
INSERT INTO `post_header` VALUES (36, 1, 2, 1, 35, '2004-03-06 12:50:50', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (37, 1, 2, 1, 36, '2004-03-06 12:50:51', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (38, 1, 5, 1, 37, '2004-03-06 12:50:52', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (39, 1, 2, 1, 38, '2004-03-06 12:50:53', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (40, 1, 6, 1, 39, '2004-03-06 12:50:54', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (41, 1, 5, 1, 40, '2004-03-06 12:50:55', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (42, 1, 3, 1, 41, '2004-03-06 12:50:56', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (43, 1, 8, 1, 42, '2004-03-06 12:50:57', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (44, 1, 9, 1, 43, '2004-03-06 12:50:58', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (45, 1, 12, 1, 44, '2004-03-06 12:50:59', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (46, 1, 11, 1, 45, '2004-03-06 12:51:00', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (47, 1, 4, 1, 46, '2004-03-06 12:51:01', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (48, 1, 1, 1, 47, '2004-03-06 12:51:02', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (49, 1, 4, 1, 48, '2004-03-06 12:51:03', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (50, 1, 2, 1, 49, '2004-03-06 12:51:04', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (51, 1, 1, 1, 50, '2004-03-06 12:51:05', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (52, 1, 12, 48, 51, '2004-03-06 12:51:06', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (53, 1, 4, 16, 52, '2004-03-06 12:51:07', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (54, 1, 2, 28, 53, '2004-03-06 12:51:08', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (55, 1, 1, 16, 54, '2004-03-06 12:51:09', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (56, 1, 8, 22, 55, '2004-03-06 12:51:10', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (57, 1, 9, 25, 56, '2004-03-06 12:51:11', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (58, 1, 9, 38, 57, '2004-03-06 12:51:12', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (59, 1, 5, 34, 58, '2004-03-06 12:51:13', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (60, 1, 12, 52, 59, '2004-03-06 12:51:14', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (62, 1, 8, 11, 61, '2004-03-06 12:51:16', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (63, 1, 11, 44, 62, '2004-03-06 12:51:17', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (64, 1, 7, 9, 63, '2004-03-06 12:51:18', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (65, 1, 2, 56, 64, '2004-03-06 12:51:19', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (66, 1, 10, 56, 65, '2004-03-06 12:51:20', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (67, 1, 3, 27, 66, '2004-03-06 12:51:21', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (68, 1, 3, 62, 67, '2004-03-06 12:51:22', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (69, 1, 7, 44, 68, '2004-03-06 12:51:23', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (70, 1, 11, 30, 69, '2004-03-06 12:51:24', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (71, 1, 3, 31, 70, '2004-03-06 12:51:25', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (72, 1, 8, 69, 71, '2004-03-06 12:51:26', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (73, 1, 7, 10, 72, '2004-03-06 12:51:27', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (74, 1, 8, 48, 73, '2004-03-06 12:51:28', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (75, 1, 7, 42, 74, '2004-03-06 12:51:29', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (169, 6, 11, 168, 2, '2004-03-20 16:38:37', '2004-03-20 16:38:37', 0);
INSERT INTO `post_header` VALUES (77, 1, 9, 7, 76, '2004-03-06 12:51:31', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (78, 1, 11, 21, 77, '2004-03-06 12:51:32', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (79, 1, 12, 42, 78, '2004-03-06 12:51:33', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (80, 1, 12, 71, 79, '2004-03-06 12:51:34', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (81, 1, 10, 20, 80, '2004-03-06 12:51:35', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (83, 1, 4, 7, 82, '2004-03-06 12:51:37', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (84, 1, 5, 23, 83, '2004-03-06 12:51:38', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (85, 1, 9, 31, 84, '2004-03-06 12:51:39', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (86, 1, 7, 60, 85, '2004-03-06 12:51:40', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (87, 1, 3, 83, 86, '2004-03-06 12:51:41', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (88, 1, 7, 80, 87, '2004-03-06 12:51:42', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (89, 1, 2, 18, 88, '2004-03-06 12:51:43', '2004-03-20 23:33:33', 11);
INSERT INTO `post_header` VALUES (90, 1, 7, 2, 89, '2004-03-06 12:51:44', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (91, 1, 6, 84, 90, '2004-03-06 12:51:45', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (92, 1, 3, 54, 91, '2004-03-06 12:51:46', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (93, 1, 10, 46, 92, '2004-03-06 12:51:47', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (94, 1, 11, 68, 93, '2004-03-06 12:51:48', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (95, 1, 11, 69, 94, '2004-03-06 12:51:49', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (168, 6, 11, 167, 1, '2004-03-20 16:33:50', '2004-03-20 16:33:50', 0);
INSERT INTO `post_header` VALUES (167, 6, 11, 0, 0, '2004-03-20 16:33:02', '2004-03-20 16:33:02', 0);
INSERT INTO `post_header` VALUES (98, 1, 7, 58, 97, '2004-03-06 12:51:52', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (99, 1, 3, 13, 98, '2004-03-06 12:51:53', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (100, 1, 5, 99, 99, '2004-03-06 12:51:54', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (101, 1, 10, 47, 100, '2004-03-06 12:51:55', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (102, 1, 1, 36, 101, '2004-03-06 12:51:56', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (103, 1, 2, 87, 102, '2004-03-06 12:51:57', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (104, 1, 3, 25, 103, '2004-03-06 12:51:58', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (105, 1, 8, 67, 104, '2004-03-06 12:51:59', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (106, 1, 3, 80, 105, '2004-03-06 12:52:00', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (107, 1, 5, 71, 106, '2004-03-06 12:52:01', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (108, 1, 9, 55, 107, '2004-03-06 12:52:02', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (109, 1, 9, 30, 108, '2004-03-06 12:52:03', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (110, 1, 11, 62, 109, '2004-03-06 12:52:04', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (111, 1, 10, 35, 110, '2004-03-06 12:52:05', '2004-04-06 19:03:20', 11);
INSERT INTO `post_header` VALUES (113, 1, 11, 14, 112, '2004-03-06 12:52:07', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (114, 1, 8, 60, 113, '2004-03-06 12:52:08', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (115, 1, 1, 63, 114, '2004-03-06 12:52:09', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (116, 1, 3, 12, 115, '2004-03-06 12:52:10', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (117, 1, 9, 109, 116, '2004-03-06 12:52:11', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (118, 1, 5, 45, 117, '2004-03-06 12:52:12', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (119, 1, 11, 15, 118, '2004-03-06 12:52:13', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (121, 1, 1, 55, 120, '2004-03-06 12:52:15', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (122, 1, 10, 107, 121, '2004-03-06 12:52:16', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (123, 1, 2, 95, 122, '2004-03-06 12:52:17', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (124, 1, 1, 99, 123, '2004-03-06 12:52:18', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (125, 1, 8, 54, 124, '2004-03-06 12:52:19', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (126, 1, 8, 98, 125, '2004-03-06 12:52:20', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (127, 1, 6, 35, 126, '2004-03-06 12:52:21', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (128, 1, 6, 55, 127, '2004-03-06 12:52:22', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (129, 1, 2, 81, 128, '2004-03-06 12:52:23', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (131, 1, 9, 46, 130, '2004-03-06 12:52:25', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (132, 1, 1, 77, 131, '2004-03-06 12:52:26', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (133, 1, 6, 103, 132, '2004-03-06 12:52:27', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (134, 1, 8, 104, 133, '2004-03-06 12:52:28', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (135, 1, 7, 103, 134, '2004-03-06 12:52:29', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (136, 1, 4, 2, 135, '2004-03-06 12:52:30', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (137, 1, 4, 88, 136, '2004-03-06 12:52:31', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (138, 1, 4, 52, 137, '2004-03-06 12:52:32', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (139, 1, 9, 37, 138, '2004-03-06 12:52:33', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (140, 1, 3, 65, 139, '2004-03-06 12:52:34', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (141, 1, 4, 136, 140, '2004-03-06 12:52:35', '2004-03-26 18:49:29', 11);
INSERT INTO `post_header` VALUES (142, 1, 5, 53, 141, '2004-03-06 12:52:36', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (143, 1, 1, 86, 142, '2004-03-06 12:52:37', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (144, 1, 5, 99, 143, '2004-03-06 12:52:38', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (145, 1, 5, 73, 144, '2004-03-06 12:52:39', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (146, 1, 8, 75, 145, '2004-03-06 12:52:40', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (147, 1, 3, 77, 146, '2004-03-06 12:52:41', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (148, 1, 8, 65, 147, '2004-03-06 12:52:42', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (149, 1, 2, 1, 148, '2004-03-06 12:52:43', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (150, 1, 10, 83, 149, '2004-03-06 12:52:44', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (151, 1, 1, 118, 150, '2004-03-06 12:52:45', '0000-00-00 00:00:00', 0);
INSERT INTO `post_header` VALUES (152, 1, 11, 2, 151, '2004-03-13 20:25:15', '2004-03-13 20:25:15', 0);
INSERT INTO `post_header` VALUES (153, 1, 11, 2, 152, '2004-03-13 20:26:56', '2004-03-13 20:26:56', 0);
INSERT INTO `post_header` VALUES (154, 1, 11, 2, 153, '2004-03-13 20:28:48', '2004-03-13 20:28:48', 0);
INSERT INTO `post_header` VALUES (155, 1, 11, 2, 154, '2004-03-13 20:29:13', '2004-03-13 20:29:13', 0);
INSERT INTO `post_header` VALUES (158, 4, 11, 0, 0, '2004-03-20 02:26:08', '2004-03-20 03:24:43', 11);
INSERT INTO `post_header` VALUES (159, 4, 11, 158, 1, '2004-03-20 02:47:36', '2004-03-20 02:47:36', 0);
INSERT INTO `post_header` VALUES (160, 4, 11, 159, 2, '2004-03-20 02:47:50', '2004-03-20 02:47:50', 0);
INSERT INTO `post_header` VALUES (161, 5, 11, 0, 0, '2004-03-20 02:49:36', '2004-03-20 02:49:36', 0);
INSERT INTO `post_header` VALUES (162, 5, 11, 161, 1, '2004-03-20 02:50:00', '2004-03-20 02:50:00', 0);
INSERT INTO `post_header` VALUES (163, 5, 11, 162, 2, '2004-03-20 02:51:46', '2004-03-20 02:51:46', 0);
INSERT INTO `post_header` VALUES (258, 36, 11, 0, 0, '2004-04-04 00:12:16', '2004-04-04 00:12:16', 0);
INSERT INTO `post_header` VALUES (165, 1, 11, 149, 155, '2004-03-20 02:52:50', '2004-03-20 02:52:50', 0);
INSERT INTO `post_header` VALUES (262, 40, 14, 0, 0, '2004-04-04 16:05:37', '2004-04-04 16:05:37', 0);
INSERT INTO `post_header` VALUES (171, 6, 11, 167, 4, '2004-03-20 16:38:56', '2004-03-20 16:38:56', 0);
INSERT INTO `post_header` VALUES (272, 9, 14, 268, 5, '2004-04-06 20:36:47', '2004-04-06 20:36:47', 0);
INSERT INTO `post_header` VALUES (173, 8, 11, 0, 0, '2004-03-20 16:42:12', '2004-04-19 20:28:31', 11);
INSERT INTO `post_header` VALUES (174, 8, 11, 173, 1, '2004-03-20 16:42:17', '2004-03-20 16:42:17', 0);
INSERT INTO `post_header` VALUES (175, 8, 11, 174, 2, '2004-03-20 16:42:20', '2004-03-20 16:42:20', 0);
INSERT INTO `post_header` VALUES (176, 8, 11, 175, 3, '2004-03-20 16:42:23', '2004-03-20 16:42:23', 0);
INSERT INTO `post_header` VALUES (177, 8, 11, 174, 4, '2004-03-20 16:42:32', '2004-03-20 16:42:32', 0);
INSERT INTO `post_header` VALUES (266, 41, 11, 265, 2, '2004-04-04 16:45:15', '2004-04-04 16:45:15', 0);
INSERT INTO `post_header` VALUES (179, 1, 11, 89, 156, '2004-03-20 19:25:54', '2004-03-20 19:26:16', 11);
INSERT INTO `post_header` VALUES (180, 1, 11, 1, 157, '2004-03-20 20:42:20', '2004-03-20 20:42:20', 0);
INSERT INTO `post_header` VALUES (181, 1, 11, 180, 158, '2004-03-20 20:42:48', '2004-03-20 20:42:48', 0);
INSERT INTO `post_header` VALUES (182, 1, 11, 181, 159, '2004-03-20 20:45:55', '2004-03-20 20:45:55', 0);
INSERT INTO `post_header` VALUES (183, 1, 11, 126, 160, '2004-03-20 20:46:17', '2004-03-20 20:46:17', 0);
INSERT INTO `post_header` VALUES (184, 1, 11, 183, 161, '2004-03-20 21:13:06', '2004-03-20 21:13:06', 0);
INSERT INTO `post_header` VALUES (185, 1, 11, 184, 162, '2004-03-20 21:13:23', '2004-03-20 21:13:23', 0);
INSERT INTO `post_header` VALUES (186, 1, 11, 182, 163, '2004-03-23 14:07:52', '2004-04-06 19:11:12', 11);
INSERT INTO `post_header` VALUES (187, 1, 11, 186, 164, '2004-03-25 15:19:52', '2004-04-06 19:08:29', 11);
INSERT INTO `post_header` VALUES (254, 1, 11, 187, 165, '2004-04-03 05:34:23', '2004-04-06 19:03:56', 11);
INSERT INTO `post_header` VALUES (189, 9, 11, 0, 0, '2004-03-25 19:05:05', '2004-03-25 19:05:05', 0);
INSERT INTO `post_header` VALUES (190, 10, 11, 0, 0, '2004-03-25 19:05:35', '2004-03-25 19:05:58', 11);
INSERT INTO `post_header` VALUES (191, 9, 11, 189, 1, '2004-03-25 20:10:14', '2004-03-25 20:10:14', 0);
INSERT INTO `post_header` VALUES (193, 9, 11, 191, 2, '2004-03-25 20:10:47', '2004-03-25 20:10:47', 0);
INSERT INTO `post_header` VALUES (194, 10, 11, 190, 1, '2004-03-25 20:12:29', '2004-03-25 20:12:29', 0);
INSERT INTO `post_header` VALUES (195, 10, 11, 194, 2, '2004-03-25 20:13:18', '2004-03-25 20:13:18', 0);
INSERT INTO `post_header` VALUES (196, 10, 11, 190, 3, '2004-03-25 20:13:24', '2004-03-25 20:13:24', 0);
INSERT INTO `post_header` VALUES (197, 10, 11, 196, 4, '2004-03-25 20:16:52', '2004-03-25 20:16:52', 0);
INSERT INTO `post_header` VALUES (260, 38, 11, 0, 0, '2004-04-04 00:20:58', '2004-04-04 00:20:58', 0);
INSERT INTO `post_header` VALUES (263, 9, 14, 193, 3, '2004-04-04 16:06:29', '2004-04-04 16:06:29', 0);
INSERT INTO `post_header` VALUES (261, 39, 11, 0, 0, '2004-04-04 00:21:35', '2004-04-04 00:21:35', 0);
INSERT INTO `post_header` VALUES (264, 41, 11, 0, 0, '2004-04-04 16:44:59', '2004-04-04 16:44:59', 0);
INSERT INTO `post_header` VALUES (273, 9, 11, 272, 6, '2004-04-06 21:43:02', '2004-04-06 21:43:02', 0);
INSERT INTO `post_header` VALUES (203, 6, 11, 171, 5, '2004-03-26 18:37:32', '2004-03-26 18:37:32', 0);
INSERT INTO `post_header` VALUES (204, 11, 14, 0, 0, '2004-03-26 19:13:05', '2004-04-10 03:57:10', 11);
INSERT INTO `post_header` VALUES (205, 11, 11, 204, 1, '2004-03-26 19:16:29', '2004-03-26 19:16:29', 0);
INSERT INTO `post_header` VALUES (206, 11, 11, 205, 2, '2004-03-26 19:22:38', '2004-03-26 19:22:38', 0);
INSERT INTO `post_header` VALUES (274, 9, 14, 273, 7, '2004-04-06 21:47:56', '2004-04-06 21:47:56', 0);
INSERT INTO `post_header` VALUES (208, 11, 14, 204, 3, '2004-03-26 19:25:29', '2004-03-26 19:25:29', 0);
INSERT INTO `post_header` VALUES (209, 11, 11, 208, 4, '2004-03-26 19:26:00', '2004-03-26 19:26:00', 0);
INSERT INTO `post_header` VALUES (210, 11, 11, 204, 5, '2004-03-26 19:48:04', '2004-03-26 19:48:04', 0);
INSERT INTO `post_header` VALUES (211, 11, 11, 204, 6, '2004-03-26 23:59:29', '2004-03-26 23:59:29', 0);
INSERT INTO `post_header` VALUES (212, 6, 14, 203, 6, '2004-03-27 02:10:41', '2004-03-27 02:10:41', 0);
INSERT INTO `post_header` VALUES (213, 12, 14, 0, 0, '2004-03-28 17:06:24', '2004-03-28 17:06:24', 0);
INSERT INTO `post_header` VALUES (380, 14, 11, 225, 2, '2004-04-16 13:29:51', '2004-04-16 13:29:51', 0);
INSERT INTO `post_header` VALUES (215, 12, 11, 213, 1, '2004-03-28 17:09:00', '2004-03-28 17:09:00', 0);
INSERT INTO `post_header` VALUES (216, 12, 14, 213, 2, '2004-03-28 17:10:06', '2004-03-28 17:10:06', 0);
INSERT INTO `post_header` VALUES (217, 12, 11, 216, 3, '2004-03-28 17:12:34', '2004-03-28 17:12:34', 0);
INSERT INTO `post_header` VALUES (218, 12, 14, 213, 4, '2004-03-28 17:13:12', '2004-03-28 17:13:12', 0);
INSERT INTO `post_header` VALUES (219, 12, 11, 218, 5, '2004-03-28 17:15:24', '2004-03-28 17:15:46', 11);
INSERT INTO `post_header` VALUES (265, 41, 11, 264, 1, '2004-04-04 16:45:05', '2004-04-04 16:45:05', 0);
INSERT INTO `post_header` VALUES (221, 5, 11, 163, 3, '2004-04-02 18:18:05', '2004-04-02 18:18:05', 0);
INSERT INTO `post_header` VALUES (222, 5, 14, 221, 4, '2004-04-02 18:26:22', '2004-04-02 18:26:22', 0);
INSERT INTO `post_header` VALUES (223, 5, 11, 222, 5, '2004-04-02 21:01:26', '2004-04-02 21:01:26', 0);
INSERT INTO `post_header` VALUES (224, 14, 11, 0, 0, '2004-04-03 01:30:37', '2004-04-03 01:30:37', 0);
INSERT INTO `post_header` VALUES (225, 14, 14, 224, 1, '2004-04-03 01:31:03', '2004-04-03 01:31:03', 0);
INSERT INTO `post_header` VALUES (276, 9, 11, 189, 9, '2004-04-06 21:53:47', '2004-04-06 21:53:47', 0);
INSERT INTO `post_header` VALUES (255, 11, 11, 211, 7, '2004-04-03 06:14:08', '2004-04-03 06:16:53', 11);
INSERT INTO `post_header` VALUES (257, 35, 11, 0, 0, '2004-04-04 00:12:10', '2004-04-04 00:12:10', 0);
INSERT INTO `post_header` VALUES (275, 9, 11, 189, 8, '2004-04-06 21:53:41', '2004-04-06 21:53:41', 0);
INSERT INTO `post_header` VALUES (238, 6, 11, 212, 7, '2004-04-03 03:53:26', '2004-04-03 03:53:26', 0);
INSERT INTO `post_header` VALUES (267, 41, 11, 264, 3, '2004-04-04 16:45:42', '2004-04-04 16:45:42', 0);
INSERT INTO `post_header` VALUES (268, 9, 14, 263, 4, '2004-04-06 20:14:32', '2004-04-06 20:14:32', 0);
INSERT INTO `post_header` VALUES (269, 1, 14, 254, 166, '2004-04-06 20:21:09', '2004-04-06 20:21:09', 0);
INSERT INTO `post_header` VALUES (381, 14, 11, 224, 3, '2004-04-16 13:29:58', '2004-04-16 13:29:58', 0);
INSERT INTO `post_header` VALUES (277, 9, 11, 189, 10, '2004-04-06 21:53:52', '2004-04-06 21:53:52', 0);
INSERT INTO `post_header` VALUES (278, 42, 11, 0, 0, '2004-04-06 21:57:11', '2004-04-06 21:57:11', 0);
INSERT INTO `post_header` VALUES (279, 42, 11, 278, 1, '2004-04-06 22:02:48', '2004-04-06 22:02:48', 0);
INSERT INTO `post_header` VALUES (280, 42, 14, 279, 2, '2004-04-06 22:05:05', '2004-04-06 22:05:05', 0);
INSERT INTO `post_header` VALUES (281, 43, 11, 0, 0, '2004-04-06 22:09:28', '2004-04-07 04:03:54', 11);
INSERT INTO `post_header` VALUES (282, 43, 11, 281, 1, '2004-04-06 22:09:35', '2004-04-06 22:09:35', 0);
INSERT INTO `post_header` VALUES (283, 43, 11, 281, 2, '2004-04-06 22:09:40', '2004-04-06 22:09:40', 0);
INSERT INTO `post_header` VALUES (284, 43, 11, 283, 3, '2004-04-06 23:36:45', '2004-04-06 23:36:45', 0);
INSERT INTO `post_header` VALUES (285, 43, 11, 284, 4, '2004-04-07 01:50:23', '2004-04-07 01:50:23', 0);
INSERT INTO `post_header` VALUES (286, 43, 11, 285, 5, '2004-04-07 03:45:44', '2004-04-07 04:03:06', 11);
INSERT INTO `post_header` VALUES (287, 43, 11, 281, 6, '2004-04-07 03:56:13', '2004-04-07 04:14:43', 11);
INSERT INTO `post_header` VALUES (288, 43, 11, 287, 7, '2004-04-07 04:05:10', '2004-04-07 04:05:10', 0);
INSERT INTO `post_header` VALUES (289, 44, 11, 0, 0, '2004-04-07 04:37:31', '2004-04-07 05:12:47', 11);
INSERT INTO `post_header` VALUES (290, 44, 11, 289, 1, '2004-04-07 04:37:57', '2004-04-07 05:11:39', 11);
INSERT INTO `post_header` VALUES (291, 44, 11, 289, 2, '2004-04-07 04:38:27', '2004-04-07 04:38:27', 0);
INSERT INTO `post_header` VALUES (292, 44, 11, 291, 3, '2004-04-07 04:38:54', '2004-04-07 04:38:54', 0);
INSERT INTO `post_header` VALUES (293, 44, 11, 292, 4, '2004-04-07 04:40:11', '2004-04-07 04:40:11', 0);
INSERT INTO `post_header` VALUES (294, 44, 11, 293, 5, '2004-04-07 05:13:50', '2004-04-07 05:13:50', 0);
INSERT INTO `post_header` VALUES (295, 44, 11, 294, 6, '2004-04-07 05:14:55', '2004-04-07 05:14:55', 0);
INSERT INTO `post_header` VALUES (296, 44, 11, 289, 7, '2004-04-07 15:38:28', '2004-04-07 15:38:28', 0);
INSERT INTO `post_header` VALUES (297, 45, 11, 0, 0, '2004-04-08 14:41:21', '2004-04-08 14:41:21', 0);
INSERT INTO `post_header` VALUES (298, 40, 11, 262, 1, '2004-04-08 17:06:11', '2004-04-08 17:06:11', 0);
INSERT INTO `post_header` VALUES (299, 47, 11, 0, 0, '2004-04-08 18:40:43', '2004-04-08 18:40:43', 0);
INSERT INTO `post_header` VALUES (300, 47, 11, 299, 1, '2004-04-08 18:40:53', '2004-04-08 18:40:53', 0);
INSERT INTO `post_header` VALUES (301, 47, 11, 299, 2, '2004-04-08 18:41:40', '2004-04-08 18:41:40', 0);
INSERT INTO `post_header` VALUES (302, 48, 11, 0, 0, '2004-04-08 18:43:59', '2004-04-08 18:43:59', 0);
INSERT INTO `post_header` VALUES (303, 48, 11, 302, 1, '2004-04-08 18:44:05', '2004-04-08 18:44:05', 0);
INSERT INTO `post_header` VALUES (304, 48, 14, 303, 2, '2004-04-08 18:46:01', '2004-04-08 18:46:01', 0);
INSERT INTO `post_header` VALUES (305, 49, 14, 0, 0, '2004-04-08 18:48:07', '2004-04-08 18:48:07', 0);
INSERT INTO `post_header` VALUES (306, 8, 11, 177, 5, '2004-04-08 18:50:21', '2004-04-08 18:50:21', 0);
INSERT INTO `post_header` VALUES (307, 50, 20, 0, 0, '2004-04-08 22:28:30', '2004-04-08 22:28:30', 0);
INSERT INTO `post_header` VALUES (308, 50, 11, 307, 1, '2004-04-08 22:28:58', '2004-04-08 22:28:58', 0);
INSERT INTO `post_header` VALUES (309, 50, 20, 308, 2, '2004-04-08 22:29:42', '2004-04-08 22:29:42', 0);
INSERT INTO `post_header` VALUES (310, 50, 11, 309, 3, '2004-04-08 22:30:06', '2004-04-08 22:30:06', 0);
INSERT INTO `post_header` VALUES (311, 50, 14, 307, 4, '2004-04-08 22:30:36', '2004-04-08 22:30:36', 0);
INSERT INTO `post_header` VALUES (312, 51, 11, 0, 0, '2004-04-08 23:23:45', '2004-04-08 23:23:45', 0);
INSERT INTO `post_header` VALUES (313, 52, 14, 0, 0, '2004-04-08 23:39:31', '2004-04-08 23:39:31', 0);
INSERT INTO `post_header` VALUES (314, 53, 11, 0, 0, '2004-04-08 23:52:21', '2004-04-08 23:52:21', 0);
INSERT INTO `post_header` VALUES (321, 56, 11, 0, 0, '2004-04-09 00:27:35', '2004-04-09 00:27:35', 0);
INSERT INTO `post_header` VALUES (316, 52, 11, 313, 1, '2004-04-09 00:01:05', '2004-04-09 00:01:05', 0);
INSERT INTO `post_header` VALUES (318, 52, 11, 316, 2, '2004-04-09 00:02:23', '2004-04-09 00:02:23', 0);
INSERT INTO `post_header` VALUES (319, 52, 11, 318, 3, '2004-04-09 00:16:34', '2004-04-09 00:16:34', 0);
INSERT INTO `post_header` VALUES (322, 57, 11, 0, 0, '2004-04-09 00:36:44', '2004-04-09 00:36:44', 0);
INSERT INTO `post_header` VALUES (324, 59, 11, 0, 0, '2004-04-09 00:48:07', '2004-04-09 00:48:07', 0);
INSERT INTO `post_header` VALUES (325, 60, 11, 0, 0, '2004-04-09 00:48:42', '2004-04-09 00:48:42', 0);
INSERT INTO `post_header` VALUES (326, 61, 11, 0, 0, '2004-04-09 00:50:40', '2004-04-09 00:50:40', 0);
INSERT INTO `post_header` VALUES (327, 62, 11, 0, 0, '2004-04-09 00:53:09', '2004-04-09 00:53:46', 11);
INSERT INTO `post_header` VALUES (328, 63, 11, 0, 0, '2004-04-09 00:58:41', '2004-04-09 00:58:41', 0);
INSERT INTO `post_header` VALUES (340, 75, 11, 0, 0, '2004-04-09 01:29:55', '2004-04-09 01:29:55', 0);
INSERT INTO `post_header` VALUES (341, 76, 11, 0, 0, '2004-04-09 01:36:07', '2004-04-09 01:36:07', 0);
INSERT INTO `post_header` VALUES (342, 77, 11, 0, 0, '2004-04-09 01:46:54', '2004-04-09 01:46:54', 0);
INSERT INTO `post_header` VALUES (335, 70, 11, 0, 0, '2004-04-09 01:12:34', '2004-04-09 01:12:34', 0);
INSERT INTO `post_header` VALUES (343, 78, 11, 0, 0, '2004-04-09 02:48:27', '2004-04-09 02:48:27', 0);
INSERT INTO `post_header` VALUES (344, 78, 11, 343, 1, '2004-04-09 02:48:41', '2004-04-09 02:48:41', 0);
INSERT INTO `post_header` VALUES (345, 79, 21, 0, 0, '2004-04-09 03:29:07', '2004-04-10 03:57:54', 11);
INSERT INTO `post_header` VALUES (339, 74, 11, 0, 0, '2004-04-09 01:18:25', '2004-04-09 01:18:25', 0);
INSERT INTO `post_header` VALUES (346, 80, 21, 0, 0, '2004-04-09 03:29:29', '2004-04-09 03:29:29', 0);
INSERT INTO `post_header` VALUES (347, 81, 21, 0, 0, '2004-04-09 03:31:04', '2004-04-09 03:31:19', 21);
INSERT INTO `post_header` VALUES (348, 82, 11, 0, 0, '2004-04-09 14:08:23', '2004-04-09 14:36:25', 11);
INSERT INTO `post_header` VALUES (349, 82, 11, 348, 1, '2004-04-09 14:44:01', '2004-04-09 14:44:01', 0);
INSERT INTO `post_header` VALUES (350, 83, 11, 0, 0, '2004-04-09 14:54:48', '2004-04-09 14:54:48', 0);
INSERT INTO `post_header` VALUES (351, 84, 11, 0, 0, '2004-04-09 15:13:11', '2004-04-09 15:13:11', 0);
INSERT INTO `post_header` VALUES (352, 84, 11, 351, 1, '2004-04-09 15:17:27', '2004-04-09 15:17:27', 0);
INSERT INTO `post_header` VALUES (353, 84, 11, 351, 2, '2004-04-09 15:17:30', '2004-04-09 15:17:30', 0);
INSERT INTO `post_header` VALUES (354, 85, 11, 0, 0, '2004-04-09 15:21:05', '2004-04-09 15:21:05', 0);
INSERT INTO `post_header` VALUES (355, 85, 11, 354, 1, '2004-04-09 15:21:08', '2004-04-09 15:21:08', 0);
INSERT INTO `post_header` VALUES (356, 85, 11, 354, 2, '2004-04-09 15:21:11', '2004-04-09 15:21:11', 0);
INSERT INTO `post_header` VALUES (357, 86, 11, 0, 0, '2004-04-09 15:21:35', '2004-04-09 15:21:35', 0);
INSERT INTO `post_header` VALUES (358, 86, 11, 357, 1, '2004-04-09 15:29:58', '2004-04-09 15:29:58', 0);
INSERT INTO `post_header` VALUES (359, 87, 11, 0, 0, '2004-04-09 15:49:11', '2004-04-18 16:39:31', 11);
INSERT INTO `post_header` VALUES (360, 87, 11, 359, 1, '2004-04-09 15:49:16', '2004-04-19 00:00:06', 11);
INSERT INTO `post_header` VALUES (361, 87, 11, 360, 2, '2004-04-09 15:49:22', '2004-04-09 15:49:22', 0);
INSERT INTO `post_header` VALUES (362, 87, 11, 361, 3, '2004-04-09 15:49:57', '2004-04-09 15:49:57', 0);
INSERT INTO `post_header` VALUES (363, 87, 11, 362, 4, '2004-04-09 15:50:05', '2004-04-09 15:50:05', 0);
INSERT INTO `post_header` VALUES (364, 87, 11, 359, 5, '2004-04-09 15:50:42', '2004-04-19 20:44:18', 11);
INSERT INTO `post_header` VALUES (365, 87, 11, 364, 6, '2004-04-09 15:55:02', '2004-04-09 15:55:02', 0);
INSERT INTO `post_header` VALUES (366, 87, 11, 365, 7, '2004-04-09 15:55:07', '2004-04-09 15:55:07', 0);
INSERT INTO `post_header` VALUES (367, 87, 11, 366, 8, '2004-04-09 15:56:13', '2004-04-09 15:56:13', 0);
INSERT INTO `post_header` VALUES (368, 87, 11, 367, 9, '2004-04-09 15:56:28', '2004-04-09 15:56:28', 0);
INSERT INTO `post_header` VALUES (369, 87, 11, 368, 10, '2004-04-09 15:56:34', '2004-04-09 15:56:34', 0);
INSERT INTO `post_header` VALUES (370, 87, 11, 369, 11, '2004-04-09 15:57:29', '2004-04-09 15:57:29', 0);
INSERT INTO `post_header` VALUES (371, 87, 11, 370, 12, '2004-04-09 15:59:29', '2004-04-09 15:59:29', 0);
INSERT INTO `post_header` VALUES (372, 87, 11, 371, 13, '2004-04-09 16:00:00', '2004-04-09 16:00:00', 0);
INSERT INTO `post_header` VALUES (373, 87, 11, 372, 14, '2004-04-10 06:18:25', '2004-04-10 06:18:25', 0);
INSERT INTO `post_header` VALUES (379, 88, 11, 0, 0, '2004-04-11 12:49:59', '2004-04-11 12:49:59', 0);
INSERT INTO `post_header` VALUES (378, 1, 11, 269, 167, '2004-04-11 06:41:07', '2004-04-11 06:41:07', 0);
INSERT INTO `post_header` VALUES (382, 14, 11, 381, 4, '2004-04-16 13:30:20', '2004-04-16 13:30:20', 0);
INSERT INTO `post_header` VALUES (383, 87, 30, 373, 15, '2004-04-16 19:50:36', '2004-04-16 19:50:36', 0);
INSERT INTO `post_header` VALUES (384, 87, 30, 359, 16, '2004-04-16 19:50:48', '2004-04-16 19:59:11', 30);
INSERT INTO `post_header` VALUES (385, 87, 11, 384, 17, '2004-04-18 16:40:45', '2004-04-18 16:40:45', 0);
INSERT INTO `post_header` VALUES (386, 87, 11, 385, 18, '2004-04-19 20:56:57', '2004-04-19 20:56:57', 0);
INSERT INTO `post_header` VALUES (387, 87, 11, 386, 19, '2004-04-19 21:01:15', '2004-04-19 21:01:15', 0);
INSERT INTO `post_header` VALUES (388, 89, 11, 0, 0, '2004-04-23 14:34:05', '2004-04-23 14:34:05', 0);

# --------------------------------------------------------

#
# Table structure for table `templates`
#

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `t_id` smallint(4) unsigned NOT NULL auto_increment,
  `t_group` varchar(100) NOT NULL default '',
  `t_name` varchar(100) NOT NULL default '',
  `t_contents` text NOT NULL,
  `t_original` text NOT NULL,
  `t_lastedit` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`t_id`),
  UNIQUE KEY `name` (`t_name`)
) TYPE=MyISAM AUTO_INCREMENT=92 ;

#
# Dumping data for table `templates`
#

INSERT INTO `templates` VALUES (1, 'Main', 'main_queries', '<td id="small" align="center">זמן ריצה: $scripttime שניות, $querycount שאילתות.</td>\r\n	</tr>\r\n	</table>\r\n	<!-- /BAR2 TABLE -->\r\n</td>\r\n</tr>\r\n</table>\r\n<!-- /SITE TABLE -->\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n<!-- /MAIN TABLE -->', '<td id="small" align="center">זמן ריצה: $scripttime שניות, $querycount שאילתות.</td>\r\n	</tr>\r\n	</table>\r\n	<!-- /BAR2 TABLE -->\r\n</td>\r\n</tr>\r\n</table>\r\n<!-- /SITE TABLE -->\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n<!-- /MAIN TABLE -->', '2004-02-18 18:10:57');
INSERT INTO `templates` VALUES (27, 'Main', 'main_main', '<p>עמוד הבית\r\n<br />מספר המשתמש: $_SESSION[u_id]\r\n<br />שם המשתמש: $_SESSION[u_name]\r\n<br />סיסמה: $_SESSION[u_pass]', '<p>עמוד הבית\r\n<br />מספר המשתמש: $_SESSION[u_id]\r\n<br />שם המשתמש: $_SESSION[u_name]\r\n<br />סיסמה: $_SESSION[u_pass]', '2004-04-18 22:35:59');
INSERT INTO `templates` VALUES (2, 'Main', 'main_headinclude', '<!-- no cache headers -->\r\n<meta http-equiv="Pragma" content="no-cache">\r\n<meta http-equiv="no-cache">\r\n<meta http-equiv="Expires" content="-1">\r\n<meta http-equiv="Cache-Control" content="no-cache">\r\n<!-- end no cache headers -->\r\n<meta content="text/html; charset=windows-1255" http-equiv="Content-Type" />\r\n<meta http-equiv="MSThemeCompatible" content="Yes" />\r\n<link rel="stylesheet" type="text/css" href="$siteurl/includes/style.css" />\r\n<script language="javascript" type="text/javascript">\r\n<!-- Begin\r\n  function reply(p_id)\r\n  {\r\n    document.post_form.r_parent.value = p_id;\r\n  }\r\n  function changeDir(dir)\r\n  {\r\n    if (dir == 0)\r\n    {\r\n      document.post_form.r_body.dir = "rtl";\r\n    }\r\n    else\r\n    {\r\n      document.post_form.r_body.dir = "ltr";\r\n    }\r\n  }\r\n// End -->\r\n</script>', '<!-- no cache headers -->\r\n<meta http-equiv="Pragma" content="no-cache">\r\n<meta http-equiv="no-cache">\r\n<meta http-equiv="Expires" content="-1">\r\n<meta http-equiv="Cache-Control" content="no-cache">\r\n<!-- end no cache headers -->\r\n<meta content="text/html; charset=windows-1255" http-equiv="Content-Type" />\r\n<meta http-equiv="MSThemeCompatible" content="Yes" />\r\n<link rel="stylesheet" type="text/css" href="$siteurl/includes/style.css" />\r\n<script language="javascript" type="text/javascript">\r\n<!-- Begin\r\n  function reply(p_id)\r\n  {\r\n    document.post_form.r_parent.value = p_id;\r\n  }\r\n  function changeDir(dir)\r\n  {\r\n    if (dir == 0)\r\n    {\r\n      document.post_form.r_body.dir = "rtl";\r\n    }\r\n    else\r\n    {\r\n      document.post_form.r_body.dir = "ltr";\r\n    }\r\n  }\r\n// End -->\r\n</script>', '2004-04-24 00:41:07');
INSERT INTO `templates` VALUES (3, 'Main', 'main_bodytag', '<body dir="rtl">', '<body dir="rtl">', '2004-04-19 20:49:53');
INSERT INTO `templates` VALUES (4, 'Main', 'main_header', '<html>\r\n<head>\r\n$headinclude\r\n</head>\r\n<body dir="rtl">\r\n<!-- SITE TABLE -->\r\n<table class="site" cellspacing="0" cellpadding="0">\r\n  <tr height="100">\r\n    <td>\r\n<!-- LOGO TABLE -->\r\n      <table class="logo" cellspacing="0" cellpadding="0">\r\n        <tr>\r\n          <td width="200"></td>\r\n          <td width="*"></td>\r\n<td width="468">\r\n            <!-- BANNER TABLE -->\r\n            <table class="banner" cellspacing="0" cellpadding="0">\r\n              <tr><td class="banner-pad"></td></tr>\r\n              <tr><td class="banner"></td></tr>\r\n              <tr><td class="banner-pad"></td></tr>\r\n            </table>\r\n            <!-- /BANNER TABLE -->\r\n          </td>\r\n          <td width="5"></td>\r\n        </tr>\r\n      </table>\r\n      <!-- /LOGO TABLE -->\r\n    </td>\r\n  </tr>\r\n<tr>\r\n<td height="20">\r\n<!-- TOP-BAR TABLE -->\r\n	<table class="bar" cellspacing="0" cellpadding="0">\r\n	<tr valign="top">\r\n	<td valign="top"> &nbsp;$logincode | כעת באתר: $num_members חברים ו-$num_guests אורחים | 780 מבקרים היום | <b><a href="$siteurl?p=news">חדשות</a></b> | <b><a href="$siteurl?p=forum">פורום</a></b> | <b><a href="$siteurl?p=user">משתמשים</a></b> | <b><a href="$siteurl?p=online">מי מחובר</a></b> | $userscount חברים, $discscount דיונים, $postscount הודעות | <a href="$siteurl/?p=post">$num_newposts הודעות חדשות</a> | \r\n	</td>\r\n	</tr>\r\n	</table>\r\n	<!-- /TOP-BAR TABLE -->\r\n</td>\r\n</tr>\r\n  <tr>\r\n    <td>\r\n      <!-- MAIN TABLE -->\r\n      <table class="main" cellspacing="0" cellpadding="0">\r\n        <tr>  \r\n	<td width="150" valign="top">\r\n		<!-- MENU TABLE -->\r\n		<table class="menu" cellspacing="0" cellpadding="0">\r\n		<tr>\r\n		<td></td>\r\n		</tr>\r\n		</table>\r\n		<!-- /MENU TABLE -->\r\n\r\n	</td>\r\n	<td width="*">\r\n		<!-- CONTENT TABLE -->\r\n		<table class="content" cellspacing="0" cellpadding="5">\r\n		<tr><td valign="top">', '<html>\r\n<head>\r\n$headinclude\r\n</head>\r\n<body dir="rtl">\r\n<!-- SITE TABLE -->\r\n<table class="site" cellspacing="0" cellpadding="0">\r\n  <tr height="100">\r\n    <td>\r\n<!-- LOGO TABLE -->\r\n      <table class="logo" cellspacing="0" cellpadding="0">\r\n        <tr>\r\n          <td width="200"></td>\r\n          <td width="*"></td>\r\n<td width="468">\r\n            <!-- BANNER TABLE -->\r\n            <table class="banner" cellspacing="0" cellpadding="0">\r\n              <tr><td class="banner-pad"></td></tr>\r\n              <tr><td class="banner"></td></tr>\r\n              <tr><td class="banner-pad"></td></tr>\r\n            </table>\r\n            <!-- /BANNER TABLE -->\r\n          </td>\r\n          <td width="5"></td>\r\n        </tr>\r\n      </table>\r\n      <!-- /LOGO TABLE -->\r\n    </td>\r\n  </tr>\r\n<tr>\r\n<td height="20">\r\n<!-- TOP-BAR TABLE -->\r\n	<table class="bar" cellspacing="0" cellpadding="0">\r\n	<tr valign="top">\r\n	<td valign="top"> &nbsp;$logincode | כעת באתר: $num_members חברים ו-$num_guests אורחים | 780 מבקרים היום | <b><a href="$siteurl?p=news">חדשות</a></b> | <b><a href="$siteurl?p=forum">פורום</a></b> | <b><a href="$siteurl?p=user">משתמשים</a></b> | <b><a href="$siteurl?p=online">מי מחובר</a></b> | $userscount חברים, $discscount דיונים, $postscount הודעות | <a href="$siteurl/?p=post">$num_newposts הודעות חדשות</a> | \r\n	</td>\r\n	</tr>\r\n	</table>\r\n	<!-- /TOP-BAR TABLE -->\r\n</td>\r\n</tr>\r\n  <tr>\r\n    <td>\r\n      <!-- MAIN TABLE -->\r\n      <table class="main" cellspacing="0" cellpadding="0">\r\n        <tr>  \r\n	<td width="150" valign="top">\r\n		<!-- MENU TABLE -->\r\n		<table class="menu" cellspacing="0" cellpadding="0">\r\n		<tr>\r\n		<td></td>\r\n		</tr>\r\n		</table>\r\n		<!-- /MENU TABLE -->\r\n\r\n	</td>\r\n	<td width="*">\r\n		<!-- CONTENT TABLE -->\r\n		<table class="content" cellspacing="0" cellpadding="5">\r\n		<tr><td valign="top">', '2004-04-25 21:41:10');
INSERT INTO `templates` VALUES (5, 'Main', 'main_footer', '</td></tr>\r\n		</table>\r\n		<!-- /CONTENT TABLE -->\r\n        </td> \r\n        </tr>\r\n      </table>\r\n      <!-- /MAIN TABLE -->\r\n    </td>\r\n  </tr>\r\n  <tr height="20">\r\n    <td valign="bottom">\r\n<!-- BOTTOM-BAR TABLE -->\r\n<table class="bar" cellspacing="0" cellpadding="0">\r\n<tr>\r\n<td align="center"><stats></td>\r\n</tr>\r\n</table>\r\n<!-- /BOTTOM-BAR TABLE -->\r\n    </td>\r\n  </tr>\r\n</table>\r\n<!-- /SITE TABLE -->\r\n</body>\r\n</html>', '</td></tr>\r\n		</table>\r\n		<!-- /CONTENT TABLE -->\r\n        </td> \r\n        </tr>\r\n      </table>\r\n      <!-- /MAIN TABLE -->\r\n    </td>\r\n  </tr>\r\n  <tr height="20">\r\n    <td valign="bottom">\r\n<!-- BOTTOM-BAR TABLE -->\r\n<table class="bar" cellspacing="0" cellpadding="0">\r\n<tr>\r\n<td align="center"><stats></td>\r\n</tr>\r\n</table>\r\n<!-- /BOTTOM-BAR TABLE -->\r\n    </td>\r\n  </tr>\r\n</table>\r\n<!-- /SITE TABLE -->\r\n</body>\r\n</html>', '2004-04-25 21:32:50');
INSERT INTO `templates` VALUES (8, 'Admin', 'admin_home', '<html>\r\n<head>\r\n$headinclude\r\n<title>$pagetitle</title>\r\n</head>\r\n$header\r\n\r\n$main\r\n\r\n$footer\r\n</body>\r\n</html>', '<html>\r\n<head>\r\n$headinclude\r\n<title>$pagetitle</title>\r\n</head>\r\n$header\r\n\r\n$main\r\n\r\n$footer\r\n</body>\r\n</html>', '2004-04-25 20:22:20');
INSERT INTO `templates` VALUES (9, 'Template', 'template_form', '<form name="t_edit" action="$t_action" method="POST">\r\n<table>\r\n<tr>\r\n<td>TEMPLATE GROUP: </td>\r\n<td><input type="text" name="t_group" value="$t_group" size="50" /></td>\r\n</tr>\r\n<tr>\r\n<td>TEMPLATE NAME: </td>\r\n<td><input type="text" name="t_name" value="$t_name" size="50" /></td>\r\n</tr>\r\n<tr>\r\n<td valign="top">TEMPLATE CONTENTS: </td>\r\n<td><textarea cols="70" rows="20" name="t_contents">$t_contents</textarea></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>\r\n<input type="submit" value="Submit" /> \r\n<input type="reset" value="Reset" /> \r\n<input name="string" type="text" accesskey="t" size="20" onchange="n=0;" />\r\n<input type="button" value="Find" accesskey="f" onclick="javascript:findInPage(document.t_edit.string.value)" />&nbsp;&nbsp;&nbsp;\r\n<input type="button" value="Preview" accesskey="p" onclick="javascript:displayHTML()" />\r\n<input type="button" value="Copy" accesskey="c" onclick="javascript:HighlightAll()" /></td>\r\n		</table></form>', '<form name="t_edit" action="$t_action" method="POST">\r\n<table>\r\n<tr>\r\n<td>TEMPLATE GROUP: </td>\r\n<td><input type="text" name="t_group" value="$t_group" size="50" /></td>\r\n</tr>\r\n<tr>\r\n<td>TEMPLATE NAME: </td>\r\n<td><input type="text" name="t_name" value="$t_name" size="50" /></td>\r\n</tr>\r\n<tr>\r\n<td valign="top">TEMPLATE CONTENTS: </td>\r\n<td><textarea cols="70" rows="20" name="t_contents">$t_contents</textarea></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>\r\n<input type="submit" value="Submit" /> \r\n<input type="reset" value="Reset" /> \r\n<input name="string" type="text" accesskey="t" size="20" onchange="n=0;" />\r\n<input type="button" value="Find" accesskey="f" onclick="javascript:findInPage(document.t_edit.string.value)" />&nbsp;&nbsp;&nbsp;\r\n<input type="button" value="Preview" accesskey="p" onclick="javascript:displayHTML()" />\r\n<input type="button" value="Copy" accesskey="c" onclick="javascript:HighlightAll()" /></td>\r\n		</table></form>', '2004-04-23 17:04:15');
INSERT INTO `templates` VALUES (10, 'Alias', 'pagetextcolor', '#FFFFFF', '#FFFFFF', '2004-02-07 21:56:40');
INSERT INTO `templates` VALUES (11, 'Alias', 'adminpagedir', 'ltr', 'ltr', '2004-02-07 21:57:55');
INSERT INTO `templates` VALUES (12, 'Register', 'register_rules_page', '<table class="wide">\r\n<tr>\r\n<th>\r\nחוקי האתר\r\n</th>\r\n</tr>\r\n<tr>\r\n<td>\r\n$rules\r\n</td>\r\n</tr>\r\n</table>\r\n<p align="center"><form name="t_edit" action="$siteurl/?p=register" method="post">\r\n<input type="hidden" name="accepted_rules" value="true">\r\n<input type="Submit" value="הבנתי את החוקים ואני מתחייב לקיימם"></form></p>', '<table class="wide">\r\n<tr>\r\n<th>\r\nחוקי האתר\r\n</th>\r\n</tr>\r\n<tr>\r\n<td>\r\n$rules\r\n</td>\r\n</tr>\r\n</table>\r\n<p align="center"><form name="t_edit" action="$siteurl/?p=register" method="post">\r\n<input type="hidden" name="accepted_rules" value="true">\r\n<input type="Submit" value="הבנתי את החוקים ואני מתחייב לקיימם"></form></p>', '2004-04-12 03:24:52');
INSERT INTO `templates` VALUES (13, 'Template', 'template_display_cat', '<tr align="center"><td class="cat" colspan="3"><a href="$adminurl/?p=templates&amp;view=$currentGroup">$currentGroup</a></td></tr>\r\n$t_fields', '<tr align="center"><td class="cat" colspan="3"><a href="$adminurl/?p=templates&amp;view=$currentGroup">$currentGroup</a></td></tr>\r\n$t_fields', '2004-04-28 21:35:51');
INSERT INTO `templates` VALUES (49, 'Forum', 'forum_discussion', '$navbar\r\n$pagination\r\n<a href="$siteurl/?p=forum&amp;f_id=$f_id&amp;a=new">צור דיון חדש</a><br />\r\n<table class="wide" cellspacing="1" cellpadding="2">\r\n<tr>\r\n<th>שם הדיון</th>\r\n	<th>תגובות</th>\r\n	<th>צפיות</th>\r\n	<th>תאריך</th>\r\n	<th>מאת</th>\r\n<th>הודעה אחרונה</th>\r\n</tr>\r\n$forum_discussion_row\r\n</table>\r\n$pagination', '$navbar\r\n$pagination\r\n<a href="$siteurl/?p=forum&amp;f_id=$f_id&amp;a=new">צור דיון חדש</a><br />\r\n<table class="wide" cellspacing="1" cellpadding="2">\r\n<tr>\r\n<th>שם הדיון</th>\r\n	<th>תגובות</th>\r\n	<th>צפיות</th>\r\n	<th>תאריך</th>\r\n	<th>מאת</th>\r\n<th>הודעה אחרונה</th>\r\n</tr>\r\n$forum_discussion_row\r\n</table>\r\n$pagination', '2004-04-18 22:36:42');
INSERT INTO `templates` VALUES (14, 'Template', 'template_display_row', '<tr><td class="$onetwo">$t_name</td>\r\n<td class="$onetwo"><a href="$adminurl/?p=templates&amp;a=edit&view=$view&amp;t_id=$t_id">[Current]</a> <a href="$adminurl/?p=templates&amp;a=edit&view=$view&amp;t_id=$t_id&amp;orig=true">[Original]</a> $t_restore</td><td class="$onetwo">$t_lastedit</td></tr>', '<tr><td class="$onetwo">$t_name</td>\r\n<td class="$onetwo"><a href="$adminurl/?p=templates&amp;a=edit&view=$view&amp;t_id=$t_id">[Current]</a> <a href="$adminurl/?p=templates&amp;a=edit&view=$view&amp;t_id=$t_id&amp;orig=true">[Original]</a> $t_restore</td><td class="$onetwo">$t_lastedit</td></tr>', '2004-04-18 22:47:10');
INSERT INTO `templates` VALUES (15, 'Template', 'template_display', '$errmsg\r\n<p>Number of templates found: $num_rows </p>\r\n<br />\r\n<a href="$adminurl/?p=templates&amp;a=new">Add New Template</a><br />\r\n<form name="search" action="$adminurl/?p=templates&amp;a=search" method="post">\r\nSearch Strings: <input type="text" name="term" value="$term">\r\n<input type="submit" value="Go!">\r\n</form>\r\n<table class="wide" cellpadding="2" cellspacing="1">\r\n$t_display\r\n</table>', '$errmsg\r\n<p>Number of templates found: $num_rows </p>\r\n<br />\r\n<a href="$adminurl/?p=templates&amp;a=new">Add New Template</a><br />\r\n<form name="search" action="$adminurl/?p=templates&amp;a=search" method="post">\r\nSearch Strings: <input type="text" name="term" value="$term">\r\n<input type="submit" value="Go!">\r\n</form>\r\n<table class="wide" cellpadding="2" cellspacing="1">\r\n$t_display\r\n</table>', '2004-04-18 22:34:55');
INSERT INTO `templates` VALUES (16, 'Admin', 'admin_header', '<html>\r\n<head>\r\n$headinclude\r\n</head>\r\n<body dir="ltr">\r\n<!-- SITE TABLE -->\r\n<table class="site" cellspacing="0" cellpadding="0">\r\n  <tr height="100">\r\n    <td>\r\n<!-- LOGO TABLE -->\r\n      <table class="logo" cellspacing="0" cellpadding="0">\r\n        <tr>\r\n          <td width="200"></td>\r\n          <td width="*"></td>\r\n<td width="468">\r\n            <!-- BANNER TABLE -->\r\n            <table class="banner" cellspacing="0" cellpadding="0">\r\n              <tr><td class="banner-pad"></td></tr>\r\n              <tr><td class="banner"></td></tr>\r\n              <tr><td class="banner-pad"></td></tr>\r\n            </table>\r\n            <!-- /BANNER TABLE -->\r\n          </td>\r\n          <td width="5"></td>\r\n        </tr>\r\n      </table>\r\n      <!-- /LOGO TABLE -->\r\n    </td>\r\n  </tr>\r\n<tr>\r\n<td height="20">\r\n<!-- TOP-BAR TABLE -->\r\n	<table class="bar" cellspacing="0" cellpadding="0">\r\n	<tr valign="top">\r\n	<td valign="top"> &nbsp;<b><a href="$adminurl/?p=forums">forums</a></b> | <b><a href="$adminurl?p=templates">templates</a></b> | <b><a href="$adminurl?p=users">users</a></b>\r\n	</td>\r\n	</tr>\r\n	</table>\r\n	<!-- /TOP-BAR TABLE -->\r\n</td>\r\n</tr>\r\n  <tr>\r\n    <td>\r\n      <!-- MAIN TABLE -->\r\n      <table class="main" cellspacing="0" cellpadding="0">\r\n        <tr>  \r\n	<td width="150" valign="top">\r\n		<!-- MENU TABLE -->\r\n		<table class="menu" cellspacing="0" cellpadding="0">\r\n		<tr>\r\n		<td></td>\r\n		</tr>\r\n		</table>\r\n		<!-- /MENU TABLE -->\r\n\r\n	</td>\r\n	<td width="*">\r\n		<!-- CONTENT TABLE -->\r\n		<table class="content" cellspacing="0" cellpadding="5">\r\n		<tr><td valign="top">', '<html>\r\n<head>\r\n$headinclude\r\n</head>\r\n<body dir="ltr">\r\n<!-- SITE TABLE -->\r\n<table class="site" cellspacing="0" cellpadding="0">\r\n  <tr height="100">\r\n    <td>\r\n<!-- LOGO TABLE -->\r\n      <table class="logo" cellspacing="0" cellpadding="0">\r\n        <tr>\r\n          <td width="200"></td>\r\n          <td width="*"></td>\r\n<td width="468">\r\n            <!-- BANNER TABLE -->\r\n            <table class="banner" cellspacing="0" cellpadding="0">\r\n              <tr><td class="banner-pad"></td></tr>\r\n              <tr><td class="banner"></td></tr>\r\n              <tr><td class="banner-pad"></td></tr>\r\n            </table>\r\n            <!-- /BANNER TABLE -->\r\n          </td>\r\n          <td width="5"></td>\r\n        </tr>\r\n      </table>\r\n      <!-- /LOGO TABLE -->\r\n    </td>\r\n  </tr>\r\n<tr>\r\n<td height="20">\r\n<!-- TOP-BAR TABLE -->\r\n	<table class="bar" cellspacing="0" cellpadding="0">\r\n	<tr valign="top">\r\n	<td valign="top"> &nbsp;<b><a href="$adminurl/?p=forums">forums</a></b> | <b><a href="$adminurl?p=templates">templates</a></b> | <b><a href="$adminurl?p=users">users</a></b>\r\n	</td>\r\n	</tr>\r\n	</table>\r\n	<!-- /TOP-BAR TABLE -->\r\n</td>\r\n</tr>\r\n  <tr>\r\n    <td>\r\n      <!-- MAIN TABLE -->\r\n      <table class="main" cellspacing="0" cellpadding="0">\r\n        <tr>  \r\n	<td width="150" valign="top">\r\n		<!-- MENU TABLE -->\r\n		<table class="menu" cellspacing="0" cellpadding="0">\r\n		<tr>\r\n		<td></td>\r\n		</tr>\r\n		</table>\r\n		<!-- /MENU TABLE -->\r\n\r\n	</td>\r\n	<td width="*">\r\n		<!-- CONTENT TABLE -->\r\n		<table class="content" cellspacing="0" cellpadding="5">\r\n		<tr><td valign="top">', '2004-04-25 21:36:09');
INSERT INTO `templates` VALUES (60, 'Forum', 'forum_admin_form', '<a name="forumform"></a>\r\n<form name="forum_form" action="$action" method="POST">\r\n<table border="0">\r\n<tr>\r\n<td>שם הפורום: </td>\r\n<td colspan="5">\r\n<input size="50" type="text" name="f_name" value="$f_name">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>תיאור: </td>\r\n<td colspan="5"><textarea dir="rtl" name="f_desc" cols="50" rows="5">$f_desc</textarea></td>\r\n</tr>\r\n<tr>\r\n<td colspan="6"><input type="submit" value="שלח"></td>\r\n</tr>\r\n</table>\r\n</form>', '<a name="forumform"></a>\r\n<form name="forum_form" action="$action" method="POST">\r\n<table border="0">\r\n<tr>\r\n<td>שם הפורום: </td>\r\n<td colspan="5">\r\n<input size="50" type="text" name="f_name" value="$f_name">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>תיאור: </td>\r\n<td colspan="5"><textarea dir="rtl" name="f_desc" cols="50" rows="5">$f_desc</textarea></td>\r\n</tr>\r\n<tr>\r\n<td colspan="6"><input type="submit" value="שלח"></td>\r\n</tr>\r\n</table>\r\n</form>', '2004-04-03 23:30:48');
INSERT INTO `templates` VALUES (51, 'Main', 'main_bar_unlogged', '<b><a href="$siteurl/?p=register">הרשם</a></b> | <b><a href="$siteurl/?p=login&amp;ref=$ref">התחבר</a></b>', '<b><a href="$siteurl/?p=register">הרשם</a></b> | <b><a href="$siteurl/?p=login&amp;ref=$ref">התחבר</a></b>', '2004-04-18 22:28:40');
INSERT INTO `templates` VALUES (52, 'Main', 'main_bar_logged', '<b>שלום <a href="$siteurl/?p=user&amp;u_id=$_SESSION[u_id]">$_SESSION[u_name]</a> | <a href="$siteurl/?p=logout&amp;ref=$ref">התנתק</a></b>', '<b>שלום <a href="$siteurl/?p=user&amp;u_id=$_SESSION[u_id]">$_SESSION[u_name]</a> | <a href="$siteurl/?p=logout&amp;ref=$ref">התנתק</a></b>', '2004-04-18 22:28:50');
INSERT INTO `templates` VALUES (53, 'Forum', 'forum_nav', '<table class="box"><tr>\r\n$forum_nav_list\r\n$forum_nav_forum\r\n$forum_nav_thread\r\n</tr></table>', '<table class="box"><tr>\r\n$forum_nav_list\r\n$forum_nav_forum\r\n$forum_nav_thread\r\n</tr></table>', '2004-04-08 17:17:28');
INSERT INTO `templates` VALUES (54, 'Forum', 'forum_nav_list', '<td class="one"><a href="$siteurl/?p=forum">פורומים</a></td>', '<td class="one"><a href="$siteurl/?p=forum">פורומים</a></td>', '2004-03-27 01:54:18');
INSERT INTO `templates` VALUES (55, 'Forum', 'forum_nav_forum', '<td><b>></b></td><td class="one"><a href="$siteurl/?p=forum&amp;f_id=$f_id">$f_name</a></td>', '<td><b>></b></td><td class="one"><a href="$siteurl/?p=forum&amp;f_id=$f_id">$f_name</a></td>', '2004-04-18 22:30:06');
INSERT INTO `templates` VALUES (56, 'Forum', 'forum_nav_thread', '<td><b>></b></td><td class="one"><a href="$siteurl/?p=post&amp;f_id=$f_id&amp;d_id=$d_id&amp;view=$view">$d_name</a></td>', '<td><b>></b></td><td class="one"><a href="$siteurl/?p=post&amp;f_id=$f_id&amp;d_id=$d_id&amp;view=$view">$d_name</a></td>', '2004-04-18 22:29:45');
INSERT INTO `templates` VALUES (17, 'Admin', 'admin_bodytag', '<body dir="{adminpagedir}" text="{pagetextcolor}" marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="{pagebgcolor}">', '<body dir="{adminpagedir}" text="{pagetextcolor}" marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="{pagebgcolor}">', '2004-04-18 19:14:42');
INSERT INTO `templates` VALUES (18, 'Admin', 'admin_headinclude', '<!-- no cache headers -->\r\n<meta http-equiv="Pragma" content="no-cache">\r\n<meta http-equiv="no-cache">\r\n<meta http-equiv="Expires" content="-1">\r\n<meta http-equiv="Cache-Control" content="no-cache">\r\n<!-- end no cache headers -->\r\n<meta content="text/html; charset=windows-1255" http-equiv="Content-Type" />\r\n<meta http-equiv="MSThemeCompatible" content="Yes" />\r\n<link rel="stylesheet" type="text/css" href="$siteurl/includes/style.css" />\r\n<script language="javascript" type="text/javascript" src="../includes/templates.js">\r\n</script>\r\n<title>$pagetitle</title>', '<!-- no cache headers -->\r\n<meta http-equiv="Pragma" content="no-cache">\r\n<meta http-equiv="no-cache">\r\n<meta http-equiv="Expires" content="-1">\r\n<meta http-equiv="Cache-Control" content="no-cache">\r\n<!-- end no cache headers -->\r\n<meta content="text/html; charset=windows-1255" http-equiv="Content-Type" />\r\n<meta http-equiv="MSThemeCompatible" content="Yes" />\r\n<link rel="stylesheet" type="text/css" href="$siteurl/includes/style.css" />\r\n<script language="javascript" type="text/javascript" src="../includes/templates.js">\r\n</script>\r\n<title>$pagetitle</title>', '2004-04-25 20:31:59');
INSERT INTO `templates` VALUES (19, 'Admin', 'admin_footer', '</td></tr>\r\n		</table>\r\n		<!-- /CONTENT TABLE -->\r\n        </td> \r\n        </tr>\r\n      </table>\r\n      <!-- /MAIN TABLE -->\r\n    </td>\r\n  </tr>\r\n  <tr height="20">\r\n    <td valign="bottom">\r\n<!-- BOTTOM-BAR TABLE -->\r\n<table class="bar" cellspacing="0" cellpadding="0">\r\n<tr>\r\n<td align="center"><stats></td>\r\n</tr>\r\n</table>\r\n<!-- /BOTTOM-BAR TABLE -->\r\n    </td>\r\n  </tr>\r\n</table>\r\n<!-- /SITE TABLE -->\r\n</body>\r\n</html>', '</td></tr>\r\n		</table>\r\n		<!-- /CONTENT TABLE -->\r\n        </td> \r\n        </tr>\r\n      </table>\r\n      <!-- /MAIN TABLE -->\r\n    </td>\r\n  </tr>\r\n  <tr height="20">\r\n    <td valign="bottom">\r\n<!-- BOTTOM-BAR TABLE -->\r\n<table class="bar" cellspacing="0" cellpadding="0">\r\n<tr>\r\n<td align="center"><stats></td>\r\n</tr>\r\n</table>\r\n<!-- /BOTTOM-BAR TABLE -->\r\n    </td>\r\n  </tr>\r\n</table>\r\n<!-- /SITE TABLE -->\r\n</body>\r\n</html>', '2004-04-25 21:34:02');
INSERT INTO `templates` VALUES (20, 'Main', 'main_home', '<!DOCTYPE html\r\nPUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"\r\n"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" lang="EN">\r\n<head>\r\n$headinclude\r\n<title>$pagetitle</title>\r\n</head>\r\n$bodytag\r\n$header\r\n\r\n$main\r\n\r\n$footer\r\n</body>\r\n</html>', '<!DOCTYPE html\r\nPUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"\r\n"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" lang="EN">\r\n<head>\r\n$headinclude\r\n<title>$pagetitle</title>\r\n</head>\r\n$bodytag\r\n$header\r\n\r\n$main\r\n\r\n$footer\r\n</body>\r\n</html>', '2004-04-25 18:09:36');
INSERT INTO `templates` VALUES (23, 'Alias', 'pagebgcolor', '#557FAA', '#557FAA', '2004-03-23 23:45:20');
INSERT INTO `templates` VALUES (21, 'Register', 'register_form', '$errmsg\r\nטופס הרשמה\r\n<form name="t_edit" action="$siteurl/?p=register" method="post">\r\n<table class="wide">\r\n<tr>\r\n<th colspan="2">פרטים הכרחיים</th>\r\n</tr>\r\n<td class="one">שם משתמש: </td>\r\n<td class="one"><input type="text" name="u_name" value="$u_name" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="two">סיסמה: </td>\r\n<td class="two"><input type="password" name="u_pass" value="$u_pass" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">דואר אלקטרוני: </td>\r\n<td class="one"><input type="text" name="u_email" value="$u_email" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<th colspan="2">פרטים נוספים</th>\r\n</tr>\r\n<tr>\r\n<td class="two">שם אמיתי: </td>\r\n<td class="two"><input type="text" name="u_realname" value="$u_realname" dir="rtl"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">תאריך לידה: </td>\r\n<td class="one">\r\nיום: <select name="b_day">\r\n<option value="0" ></option>\r\n<option value="1" >1</option>\r\n<option value="2" >2</option>\r\n<option value="3" >3</option>\r\n<option value="4" >4</option>\r\n<option value="5" >5</option>\r\n<option value="6" >6</option>\r\n<option value="7" >7</option>\r\n<option value="8" >8</option>\r\n<option value="9" >9</option>\r\n<option value="10" >10</option>\r\n<option value="11" >11</option>\r\n<option value="12" >12</option>\r\n<option value="13" >13</option>\r\n<option value="14" >14</option>\r\n<option value="15" >15</option>\r\n<option value="16" >16</option>\r\n<option value="17" >17</option>\r\n<option value="18" >18</option>\r\n<option value="19" >19</option>\r\n<option value="20" >20</option>\r\n<option value="21" >21</option>\r\n<option value="22" >22</option>\r\n<option value="23" >23</option>\r\n<option value="24" >24</option>\r\n<option value="25" >25</option>\r\n<option value="26" >26</option>\r\n<option value="27" >27</option>\r\n<option value="28" >28</option>\r\n<option value="29" >29</option>\r\n<option value="30" >30</option>\r\n<option value="31" >31</option>\r\n</select> \r\nחודש: <select name="b_month">\r\n<option value="0" ></option>\r\n<option value="1" >ינואר</option>\r\n<option value="2" >פברואר</option>\r\n<option value="3" >מרץ</option>\r\n<option value="4" >אפריל</option>\r\n<option value="5" >מאי</option>\r\n<option value="6" >יוני</option>\r\n<option value="7" >יולי</option>\r\n<option value="8" >אוגוסט</option>\r\n<option value="9" >ספטמבר</option>\r\n<option value="10" >אוקטובר</option>\r\n<option value="11" >נובמבר</option>\r\n<option value="12" >דצמבר</option>\r\n</select> \r\nשנה: <select name="b_year">\r\n<option value="0"></option>\r\n<option value="2003">2003</option>\r\n<option value="2002">2002</option>\r\n<option value="2001">2001</option>\r\n<option value="2000">2000</option>\r\n<option value="1999">1999</option>\r\n<option value="1998">1998</option>\r\n<option value="1997">1997</option>\r\n<option value="1996">1996</option>\r\n<option value="1995">1995</option>\r\n<option value="1994">1994</option>\r\n<option value="1993">1993</option>\r\n<option value="1992">1992</option>\r\n<option value="1991">1991</option>\r\n<option value="1990">1990</option>\r\n<option value="1989">1989</option>\r\n<option value="1988">1988</option>\r\n<option value="1987">1987</option>\r\n<option value="1986">1986</option>\r\n<option value="1985">1985</option>\r\n<option value="1984">1984</option>\r\n<option value="1983">1983</option>\r\n<option value="1982">1982</option>\r\n<option value="1981">1981</option>\r\n<option value="1980">1980</option>\r\n<option value="1979">1979</option>\r\n<option value="1978">1978</option>\r\n<option value="1977">1977</option>\r\n<option value="1976">1976</option>\r\n<option value="1975">1975</option>\r\n<option value="1974">1974</option>\r\n<option value="1973">1973</option>\r\n<option value="1972">1972</option>\r\n<option value="1971">1971</option>\r\n<option value="1970">1970</option>\r\n<option value="1969">1969</option>\r\n<option value="1968">1968</option>\r\n<option value="1967">1967</option>\r\n<option value="1966">1966</option>\r\n<option value="1965">1965</option>\r\n<option value="1964">1964</option>\r\n<option value="1963">1963</option>\r\n<option value="1962">1962</option>\r\n<option value="1961">1961</option>\r\n<option value="1960">1960</option>\r\n<option value="1959">1959</option>\r\n<option value="1958">1958</option>\r\n<option value="1957">1957</option>\r\n<option value="1956">1956</option>\r\n<option value="1955">1955</option>\r\n<option value="1954">1954</option>\r\n<option value="1953">1953</option>\r\n<option value="1952">1952</option>\r\n<option value="1951">1951</option>\r\n<option value="1950">1950</option>\r\n<option value="1949">1949</option>\r\n<option value="1948">1948</option>\r\n<option value="1947">1947</option>\r\n<option value="1946">1946</option>\r\n<option value="1945">1945</option>\r\n<option value="1944">1944</option>\r\n<option value="1943">1943</option>\r\n<option value="1942">1942</option>\r\n<option value="1941">1941</option>\r\n<option value="1940">1940</option>\r\n<option value="1939">1939</option>\r\n<option value="1938">1938</option>\r\n<option value="1937">1937</option>\r\n<option value="1936">1936</option>\r\n<option value="1935">1935</option>\r\n<option value="1934">1934</option>\r\n<option value="1933">1933</option>\r\n<option value="1932">1932</option>\r\n<option value="1931">1931</option>\r\n<option value="1930">1930</option>\r\n<option value="1929">1929</option>\r\n<option value="1928">1928</option>\r\n<option value="1927">1927</option>\r\n<option value="1926">1926</option>\r\n<option value="1925">1925</option>\r\n<option value="1924">1924</option>\r\n<option value="1923">1923</option>\r\n<option value="1922">1922</option>\r\n<option value="1921">1921</option>\r\n<option value="1920">1920</option>\r\n<option value="1919">1919</option>\r\n<option value="1918">1918</option>\r\n<option value="1917">1917</option>\r\n<option value="1916">1916</option>\r\n<option value="1915">1915</option>\r\n<option value="1914">1914</option>\r\n<option value="1913">1913</option>\r\n<option value="1912">1912</option>\r\n<option value="1911">1911</option>\r\n<option value="1910">1910</option>\r\n<option value="1909">1909</option>\r\n<option value="1908">1908</option>\r\n<option value="1907">1907</option>\r\n<option value="1906">1906</option>\r\n<option value="1905">1905</option>\r\n<option value="1904">1904</option>\r\n<option value="1903">1903</option>\r\n<option value="1902">1902</option>\r\n<option value="1901">1901</option>\r\n<option value="1900">1900</option>\r\n</select></td>\r\n</tr>\r\n<tr>\r\n<td class="two">דף הבית: </td>\r\n<td class="two"><input type="text" name="u_homepage" value="$u_homepage" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">מספר ICQ: </td>\r\n<td class="one"><input type="text" name="u_icq" value="$u_icq" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="two">ספר על עצמך: </td>\r\n<td class="two"><textarea cols="100" name="u_self" dir="rtl">$u_self</textarea></td>\r\n</tr>\r\n<tr>\r\n<th colspan="2">העדפות</th>\r\n</tr>\r\n<tr>\r\n<td class="one">האם ברצונך לקבל דוא"ל הנשלח לכל החברים הרשומים מצוות האתר? </td>\r\n<td class="one">כן: <input type="radio" name="p_getsitemail" value="1" checked> לא: <input type="radio" name="p_getsitemail" value="0"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">האם ברצונך לחשוף את כתובת הדוא"ל שלך לשאר הגולשים? </td>\r\n<td class="one">כן: <input type="radio" name="p_exposemail" value="2"> לא: <input type="radio" name="p_exposemail" value="0" checked></td>\r\n</tr>\r\n</table>\r\n<p align="center"><input type="Submit" value="שלח"></p> </form>', '$errmsg\r\nטופס הרשמה\r\n<form name="t_edit" action="$siteurl/?p=register" method="post">\r\n<table class="wide">\r\n<tr>\r\n<th colspan="2">פרטים הכרחיים</th>\r\n</tr>\r\n<td class="one">שם משתמש: </td>\r\n<td class="one"><input type="text" name="u_name" value="$u_name" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="two">סיסמה: </td>\r\n<td class="two"><input type="password" name="u_pass" value="$u_pass" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">דואר אלקטרוני: </td>\r\n<td class="one"><input type="text" name="u_email" value="$u_email" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<th colspan="2">פרטים נוספים</th>\r\n</tr>\r\n<tr>\r\n<td class="two">שם אמיתי: </td>\r\n<td class="two"><input type="text" name="u_realname" value="$u_realname" dir="rtl"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">תאריך לידה: </td>\r\n<td class="one">\r\nיום: <select name="b_day">\r\n<option value="0" ></option>\r\n<option value="1" >1</option>\r\n<option value="2" >2</option>\r\n<option value="3" >3</option>\r\n<option value="4" >4</option>\r\n<option value="5" >5</option>\r\n<option value="6" >6</option>\r\n<option value="7" >7</option>\r\n<option value="8" >8</option>\r\n<option value="9" >9</option>\r\n<option value="10" >10</option>\r\n<option value="11" >11</option>\r\n<option value="12" >12</option>\r\n<option value="13" >13</option>\r\n<option value="14" >14</option>\r\n<option value="15" >15</option>\r\n<option value="16" >16</option>\r\n<option value="17" >17</option>\r\n<option value="18" >18</option>\r\n<option value="19" >19</option>\r\n<option value="20" >20</option>\r\n<option value="21" >21</option>\r\n<option value="22" >22</option>\r\n<option value="23" >23</option>\r\n<option value="24" >24</option>\r\n<option value="25" >25</option>\r\n<option value="26" >26</option>\r\n<option value="27" >27</option>\r\n<option value="28" >28</option>\r\n<option value="29" >29</option>\r\n<option value="30" >30</option>\r\n<option value="31" >31</option>\r\n</select> \r\nחודש: <select name="b_month">\r\n<option value="0" ></option>\r\n<option value="1" >ינואר</option>\r\n<option value="2" >פברואר</option>\r\n<option value="3" >מרץ</option>\r\n<option value="4" >אפריל</option>\r\n<option value="5" >מאי</option>\r\n<option value="6" >יוני</option>\r\n<option value="7" >יולי</option>\r\n<option value="8" >אוגוסט</option>\r\n<option value="9" >ספטמבר</option>\r\n<option value="10" >אוקטובר</option>\r\n<option value="11" >נובמבר</option>\r\n<option value="12" >דצמבר</option>\r\n</select> \r\nשנה: <select name="b_year">\r\n<option value="0"></option>\r\n<option value="2003">2003</option>\r\n<option value="2002">2002</option>\r\n<option value="2001">2001</option>\r\n<option value="2000">2000</option>\r\n<option value="1999">1999</option>\r\n<option value="1998">1998</option>\r\n<option value="1997">1997</option>\r\n<option value="1996">1996</option>\r\n<option value="1995">1995</option>\r\n<option value="1994">1994</option>\r\n<option value="1993">1993</option>\r\n<option value="1992">1992</option>\r\n<option value="1991">1991</option>\r\n<option value="1990">1990</option>\r\n<option value="1989">1989</option>\r\n<option value="1988">1988</option>\r\n<option value="1987">1987</option>\r\n<option value="1986">1986</option>\r\n<option value="1985">1985</option>\r\n<option value="1984">1984</option>\r\n<option value="1983">1983</option>\r\n<option value="1982">1982</option>\r\n<option value="1981">1981</option>\r\n<option value="1980">1980</option>\r\n<option value="1979">1979</option>\r\n<option value="1978">1978</option>\r\n<option value="1977">1977</option>\r\n<option value="1976">1976</option>\r\n<option value="1975">1975</option>\r\n<option value="1974">1974</option>\r\n<option value="1973">1973</option>\r\n<option value="1972">1972</option>\r\n<option value="1971">1971</option>\r\n<option value="1970">1970</option>\r\n<option value="1969">1969</option>\r\n<option value="1968">1968</option>\r\n<option value="1967">1967</option>\r\n<option value="1966">1966</option>\r\n<option value="1965">1965</option>\r\n<option value="1964">1964</option>\r\n<option value="1963">1963</option>\r\n<option value="1962">1962</option>\r\n<option value="1961">1961</option>\r\n<option value="1960">1960</option>\r\n<option value="1959">1959</option>\r\n<option value="1958">1958</option>\r\n<option value="1957">1957</option>\r\n<option value="1956">1956</option>\r\n<option value="1955">1955</option>\r\n<option value="1954">1954</option>\r\n<option value="1953">1953</option>\r\n<option value="1952">1952</option>\r\n<option value="1951">1951</option>\r\n<option value="1950">1950</option>\r\n<option value="1949">1949</option>\r\n<option value="1948">1948</option>\r\n<option value="1947">1947</option>\r\n<option value="1946">1946</option>\r\n<option value="1945">1945</option>\r\n<option value="1944">1944</option>\r\n<option value="1943">1943</option>\r\n<option value="1942">1942</option>\r\n<option value="1941">1941</option>\r\n<option value="1940">1940</option>\r\n<option value="1939">1939</option>\r\n<option value="1938">1938</option>\r\n<option value="1937">1937</option>\r\n<option value="1936">1936</option>\r\n<option value="1935">1935</option>\r\n<option value="1934">1934</option>\r\n<option value="1933">1933</option>\r\n<option value="1932">1932</option>\r\n<option value="1931">1931</option>\r\n<option value="1930">1930</option>\r\n<option value="1929">1929</option>\r\n<option value="1928">1928</option>\r\n<option value="1927">1927</option>\r\n<option value="1926">1926</option>\r\n<option value="1925">1925</option>\r\n<option value="1924">1924</option>\r\n<option value="1923">1923</option>\r\n<option value="1922">1922</option>\r\n<option value="1921">1921</option>\r\n<option value="1920">1920</option>\r\n<option value="1919">1919</option>\r\n<option value="1918">1918</option>\r\n<option value="1917">1917</option>\r\n<option value="1916">1916</option>\r\n<option value="1915">1915</option>\r\n<option value="1914">1914</option>\r\n<option value="1913">1913</option>\r\n<option value="1912">1912</option>\r\n<option value="1911">1911</option>\r\n<option value="1910">1910</option>\r\n<option value="1909">1909</option>\r\n<option value="1908">1908</option>\r\n<option value="1907">1907</option>\r\n<option value="1906">1906</option>\r\n<option value="1905">1905</option>\r\n<option value="1904">1904</option>\r\n<option value="1903">1903</option>\r\n<option value="1902">1902</option>\r\n<option value="1901">1901</option>\r\n<option value="1900">1900</option>\r\n</select></td>\r\n</tr>\r\n<tr>\r\n<td class="two">דף הבית: </td>\r\n<td class="two"><input type="text" name="u_homepage" value="$u_homepage" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">מספר ICQ: </td>\r\n<td class="one"><input type="text" name="u_icq" value="$u_icq" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td class="two">ספר על עצמך: </td>\r\n<td class="two"><textarea cols="100" name="u_self" dir="rtl">$u_self</textarea></td>\r\n</tr>\r\n<tr>\r\n<th colspan="2">העדפות</th>\r\n</tr>\r\n<tr>\r\n<td class="one">האם ברצונך לקבל דוא"ל הנשלח לכל החברים הרשומים מצוות האתר? </td>\r\n<td class="one">כן: <input type="radio" name="p_getsitemail" value="1" checked> לא: <input type="radio" name="p_getsitemail" value="0"></td>\r\n</tr>\r\n<tr>\r\n<td class="one">האם ברצונך לחשוף את כתובת הדוא"ל שלך לשאר הגולשים? </td>\r\n<td class="one">כן: <input type="radio" name="p_exposemail" value="2"> לא: <input type="radio" name="p_exposemail" value="0" checked></td>\r\n</tr>\r\n</table>\r\n<p align="center"><input type="Submit" value="שלח"></p> </form>', '2004-04-16 11:14:56');
INSERT INTO `templates` VALUES (22, 'Register', 'register_done', '<p>ההרשמה בוצעה בהצלחה. דואר אלקטרוני נשלח לכתובת שסיפקת ובו קוד הפעלה לחשבון. את קוד ההפעלה יש להזין בטופס <a href="$siteurl/?p=register&amp;a=activate">הבא</a></p>\r\n', '<p>ההרשמה בוצעה בהצלחה. דואר אלקטרוני נשלח לכתובת שסיפקת ובו קוד הפעלה לחשבון. את קוד ההפעלה יש להזין בטופס <a href="$siteurl/?p=register&amp;a=activate">הבא</a></p>\r\n', '2004-04-18 22:19:51');
INSERT INTO `templates` VALUES (24, 'Alias', 'pagedir', 'rtl', 'rtl', '2004-02-07 21:59:32');
INSERT INTO `templates` VALUES (25, 'Error', 'error_404', '<p>הדף שחיפשת איננו קיים!</p>', '<p>הדף שחיפשת איננו קיים!</p>', '2004-04-18 22:33:15');
INSERT INTO `templates` VALUES (26, 'Register', 'register_activate_form', '$errmsg\r\nטופס הפעלה\r\n<FORM NAME="activate" ACTION="$siteurl/?p=register&amp;a=activate" METHOD="POST">\r\n<INPUT TYPE="hidden" NAME="step" VALUE="2">\r\n<TABLE BORDER="1">\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td><INPUT TYPE="text" NAME="u_name" VALUE="$u_name" DIR="LTR"></td>\r\n</tr>\r\n<tr>\r\n<td>קוד הפעלה: </td>\r\n<td><INPUT TYPE="password" NAME="u_code" VALUE="$u_code" DIR="LTR"></td>\r\n</tr>\r\n</table>\r\n<INPUT TYPE="Submit" VALUE="שלח"> </form>', '$errmsg\r\nטופס הפעלה\r\n<FORM NAME="activate" ACTION="$siteurl/?p=register&amp;a=activate" METHOD="POST">\r\n<INPUT TYPE="hidden" NAME="step" VALUE="2">\r\n<TABLE BORDER="1">\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td><INPUT TYPE="text" NAME="u_name" VALUE="$u_name" DIR="LTR"></td>\r\n</tr>\r\n<tr>\r\n<td>קוד הפעלה: </td>\r\n<td><INPUT TYPE="password" NAME="u_code" VALUE="$u_code" DIR="LTR"></td>\r\n</tr>\r\n</table>\r\n<INPUT TYPE="Submit" VALUE="שלח"> </form>', '2004-04-18 22:19:38');
INSERT INTO `templates` VALUES (36, 'Error', 'error_401', '<p>אין לך הרשאה לצפות בדף זה!</p>', '<p>אין לך הרשאה לצפות בדף זה!</p>', '2004-04-18 22:33:22');
INSERT INTO `templates` VALUES (28, 'Register', 'register_activate_done', '<p>הפעלת המשתמש בוצעה בהצלחה!</p>', '<p>הפעלת המשתמש בוצעה בהצלחה!</p>', '2004-04-16 15:29:17');
INSERT INTO `templates` VALUES (29, 'Main', 'main_login_form', '$errmsg\r\nטופס התחברות\r\n<form name="login" action="$siteurl/?p=login" method="post">\r\n<input type="hidden" name="ref" value="$ref">\r\n<table border="1">\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td><input type="text" name="u_name" value="$u_name" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td>סיסמה: </td>\r\n<td><input type="password" name="u_pass" value="$u_code" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td>סוג התחברות: </td>\r\n<td>זמני <input type="radio" name="login_type" value="temp" dir="ltr">\r\nקבוע <input type="radio" name="login_type" value="const" dir="ltr" checked="checked">\r\n</td>\r\n</tr>\r\n</table>\r\n<input type="Submit" value="שלח"> </form>', '$errmsg\r\nטופס התחברות\r\n<form name="login" action="$siteurl/?p=login" method="post">\r\n<input type="hidden" name="ref" value="$ref">\r\n<table border="1">\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td><input type="text" name="u_name" value="$u_name" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td>סיסמה: </td>\r\n<td><input type="password" name="u_pass" value="$u_code" dir="ltr"></td>\r\n</tr>\r\n<tr>\r\n<td>סוג התחברות: </td>\r\n<td>זמני <input type="radio" name="login_type" value="temp" dir="ltr">\r\nקבוע <input type="radio" name="login_type" value="const" dir="ltr" checked="checked">\r\n</td>\r\n</tr>\r\n</table>\r\n<input type="Submit" value="שלח"> </form>', '2004-04-18 22:28:28');
INSERT INTO `templates` VALUES (33, 'Error', 'error_already_registered', '<p><b>Error! - You are already registered</b></p>', '<p><b>Error! - You are already registered</b></p>', '2004-02-20 01:30:34');
INSERT INTO `templates` VALUES (30, 'Error', 'error_empty_fields', '<p><b>Error! - Empty Vital Fields</b></p>', '<p><b>Error! - Empty Vital Fields</b></p>', '2004-02-20 00:35:53');
INSERT INTO `templates` VALUES (31, 'Error', 'error_invalid_user', '<p><b>Error! - Invalid User Name</b></p>', '<p><b>Error! - Invalid User Name</b></p>', '2004-02-20 00:38:34');
INSERT INTO `templates` VALUES (32, 'Error', 'error_invalid_pass', '<p><b>Error! - Invalid Password</b></p>', '<p><b>Error! - Invalid Password</b></p>', '2004-02-20 00:52:22');
INSERT INTO `templates` VALUES (34, 'Error', 'error_invalid_email', '<p><b>Error! - Invalid Email Address</b></p>', '<p><b>Error! - Invalid Email Address</b></p>', '2004-02-20 01:35:00');
INSERT INTO `templates` VALUES (35, 'Error', 'error_user_exists', '<p><b>Error! - Username allready exists</b></p>', '<p><b>Error! - Username allready exists</b></p>', '2004-02-20 01:36:40');
INSERT INTO `templates` VALUES (37, 'Error', 'error_template_exists', '<p><b>Error! - Template name allready exists</b></p>', '<p><b>Error! - Template name allready exists</b></p>', '2004-02-20 15:07:28');
INSERT INTO `templates` VALUES (38, 'Post', 'post_thread', '$error_frame\r\n$post_edit_form\r\n$navbar\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tr>\r\n<td>\r\n$p_parent\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n$pagination\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n$p_children\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n$pagination\r\n</td>\r\n</tr>\r\n</table>\r\n$post_reply_form', '$error_frame\r\n$post_edit_form\r\n$navbar\r\n<table width="100%" border="0" cellspacing="0" cellpadding="0">\r\n<tr>\r\n<td>\r\n$p_parent\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n$pagination\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n$p_children\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n$pagination\r\n</td>\r\n</tr>\r\n</table>\r\n$post_reply_form', '2004-04-07 16:00:44');
INSERT INTO `templates` VALUES (39, 'Post', 'post_parent', '<a name="1"></a>\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%">\r\n<tr><td>\r\n\r\n<table class="parent">\r\n<tr>\r\n<td class="cat" align="right"><b>$d_name</b></td>\r\n</tr>\r\n<tr>\r\n<th align="right">פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date | מיין תגובות לפי: <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=flat">[תאריך]</a> <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=tree">[שייכות]</a></th>\r\n</tr>\r\n<tr>\r\n<td class="four" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td></tr>\r\n<tr><td class="three">\r\n$lastedited\r\n</td></tr>\r\n<tr>\r\n<td></td></tr>\r\n</table>', '<a name="1"></a>\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%">\r\n<tr><td>\r\n\r\n<table class="parent">\r\n<tr>\r\n<td class="cat" align="right"><b>$d_name</b></td>\r\n</tr>\r\n<tr>\r\n<th align="right">פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date | מיין תגובות לפי: <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=flat">[תאריך]</a> <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=tree">[שייכות]</a></th>\r\n</tr>\r\n<tr>\r\n<td class="four" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td></tr>\r\n<tr><td class="three">\r\n$lastedited\r\n</td></tr>\r\n<tr>\r\n<td></td></tr>\r\n</table>', '2004-04-18 23:16:54');
INSERT INTO `templates` VALUES (40, 'Post', 'post_child', '<a id="$p_id" name="$p_id"></a>\r\n<table class="childblock" cellspacing="0" cellpadding="0">\r\n<tr><td rowspan="2" width="$spacer"></td>\r\n<td>\r\n\r\n<table class="child">\r\n<tr>\r\n<th align="right"><b>[$p_order]</b>פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date $p_parentorder</th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n<tr><td class="edited-text"> $lastedited\r\n</td></tr>\r\n<tr>\r\n<td colspan="2"></td></tr>\r\n</table>', '<a id="$p_id" name="$p_id"></a>\r\n<table class="childblock" cellspacing="0" cellpadding="0">\r\n<tr><td rowspan="2" width="$spacer"></td>\r\n<td>\r\n\r\n<table class="child">\r\n<tr>\r\n<th align="right"><b>[$p_order]</b>פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date $p_parentorder</th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n<tr><td class="edited-text"> $lastedited\r\n</td></tr>\r\n<tr>\r\n<td colspan="2"></td></tr>\r\n</table>', '2004-04-19 20:46:35');
INSERT INTO `templates` VALUES (59, 'Online', 'online_guest_row', '<tr>\r\n<td class="two">$guest_name</td>\r\n<td class="two">$guest_ip</td>\r\n<td class="two">$guest_level</td>\r\n<td class="two"><a href="$guest_action">$guest_action</a></td>\r\n<td class="two">$guest_idle דקות</td>\r\n</tr>', '<tr>\r\n<td class="two">$guest_name</td>\r\n<td class="two">$guest_ip</td>\r\n<td class="two">$guest_level</td>\r\n<td class="two"><a href="$guest_action">$guest_action</a></td>\r\n<td class="two">$guest_idle דקות</td>\r\n</tr>', '2004-04-24 11:49:10');
INSERT INTO `templates` VALUES (41, 'Error', 'error_frame', '<table class="error"><tr>\r\n<th>שגיאה!</th>\r\n</tr>\r\n<tr>\r\n<td class="one">$errmsg</td>\r\n</tr>\r\n</table>', '<table class="error"><tr>\r\n<th>שגיאה!</th>\r\n</tr>\r\n<tr>\r\n<td class="one">$errmsg</td>\r\n</tr>\r\n</table>', '2004-04-07 16:01:09');
INSERT INTO `templates` VALUES (42, 'Post', 'post_current_page', '<td class="one">$sign</td>', '<td class="one">$sign</td>', '2004-03-20 20:14:23');
INSERT INTO `templates` VALUES (43, 'Post', 'post_reply_form', '<a name="postform"></a>\r\n<form name="post_form" action="$action" method="post">\r\n<table border="0" align="center">\r\n\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td><input type="text" name="r_name" value="$_SESSION[u_name]" /></td>\r\n<td>סיסמא: </td>\r\n<td><input type="password" name="r_pass" value="$_SESSION[u_name]" /></td>\r\n</tr>\r\n\r\n<tr>\r\n<td>תגובה ל: </td>\r\n<td>\r\n<select name="r_parent">\r\n$r_parent\r\n</select>\r\n</td>\r\n<td>עברית: <input type="radio" value="rtl" name="r_lang" onclick="changeDir(0)" $hebcheck /></td>\r\n<td>אנגלית: <input type="radio" value="ltr" name="r_lang" onclick="changeDir(1)" $engcheck /></td>\r\n</tr>\r\n\r\n<tr>\r\n<td>התגובה: </td>\r\n<td colspan="3"><textarea dir="rtl" name="r_body" cols="50" rows="10">$r_body</textarea></td>\r\n</tr>\r\n\r\n<tr>\r\n<td colspan="4"><input type="submit" value="שלח" /></td>\r\n</tr>\r\n\r\n</table>\r\n</form>', '<a name="postform"></a>\r\n<form name="post_form" action="$action" method="post">\r\n<table border="0" align="center">\r\n\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td><input type="text" name="r_name" value="$_SESSION[u_name]" /></td>\r\n<td>סיסמא: </td>\r\n<td><input type="password" name="r_pass" value="$_SESSION[u_name]" /></td>\r\n</tr>\r\n\r\n<tr>\r\n<td>תגובה ל: </td>\r\n<td>\r\n<select name="r_parent">\r\n$r_parent\r\n</select>\r\n</td>\r\n<td>עברית: <input type="radio" value="rtl" name="r_lang" onclick="changeDir(0)" $hebcheck /></td>\r\n<td>אנגלית: <input type="radio" value="ltr" name="r_lang" onclick="changeDir(1)" $engcheck /></td>\r\n</tr>\r\n\r\n<tr>\r\n<td>התגובה: </td>\r\n<td colspan="3"><textarea dir="rtl" name="r_body" cols="50" rows="10">$r_body</textarea></td>\r\n</tr>\r\n\r\n<tr>\r\n<td colspan="4"><input type="submit" value="שלח" /></td>\r\n</tr>\r\n\r\n</table>\r\n</form>', '2004-04-19 18:12:28');
INSERT INTO `templates` VALUES (44, 'Post', 'post_edit_form', '<a name="postform"></a>\r\n<form name="post_form" action="$action" method="POST">\r\n<input type="hidden" name="editor" value="$_SESSION[u_id]" />\r\n<table border="0">\r\n<tr>\r\n<td>ההודעה: </td>\r\n<td colspan="5"><textarea dir="rtl" name="r_body" cols="50" rows="10">$r_body</textarea></td>\r\n</tr>\r\n<tr>\r\n<td colspan="3"><input type="submit" value="שלח"></td>\r\n<td colspan="3"> עברית: <input type="radio" value="rtl" name="r_lang" onClick="changeDir(0)" $hebcheck> אנגלית: <input type="radio" value="ltr" name="r_lang" onClick="changeDir(1)" $engcheck />\r\n</tr>\r\n</table>\r\n</form>', '<a name="postform"></a>\r\n<form name="post_form" action="$action" method="POST">\r\n<input type="hidden" name="editor" value="$_SESSION[u_id]" />\r\n<table border="0">\r\n<tr>\r\n<td>ההודעה: </td>\r\n<td colspan="5"><textarea dir="rtl" name="r_body" cols="50" rows="10">$r_body</textarea></td>\r\n</tr>\r\n<tr>\r\n<td colspan="3"><input type="submit" value="שלח"></td>\r\n<td colspan="3"> עברית: <input type="radio" value="rtl" name="r_lang" onClick="changeDir(0)" $hebcheck> אנגלית: <input type="radio" value="ltr" name="r_lang" onClick="changeDir(1)" $engcheck />\r\n</tr>\r\n</table>\r\n</form>', '2004-04-18 23:33:02');
INSERT INTO `templates` VALUES (45, 'Post', 'post_lastedited', 'ההודעה נערכה בתאריך $p_edit ע"י $editor', 'ההודעה נערכה בתאריך $p_edit ע"י $editor', '2004-03-05 17:56:35');
INSERT INTO `templates` VALUES (46, 'Forum', 'forum_discussion_row', '<tr><td class="$onetwo">\r\n<a href="$siteurl/?p=post&amp;d_id=$d_id">$d_name</a>\r\n</td>\r\n<td class="$onetwo" align="center">$d_replies</td>\r\n<td class="$onetwo" align="center">$d_views</td>\r\n<td class="$onetwo" align="center">$d_date</td>\r\n<td class="$onetwo" align="center"><a href="$siteurl/?p=user&amp;u_id=$d_by">$d_byname</a></td>\r\n<td class="$onetwo">מאת <a href="$siteurl/?p=user&amp;u_id=$d_lastuser">$d_lastusername</a> בתאריך:<br />$d_lastdate</td>\r\n</tr>', '<tr><td class="$onetwo">\r\n<a href="$siteurl/?p=post&amp;d_id=$d_id">$d_name</a>\r\n</td>\r\n<td class="$onetwo" align="center">$d_replies</td>\r\n<td class="$onetwo" align="center">$d_views</td>\r\n<td class="$onetwo" align="center">$d_date</td>\r\n<td class="$onetwo" align="center"><a href="$siteurl/?p=user&amp;u_id=$d_by">$d_byname</a></td>\r\n<td class="$onetwo">מאת <a href="$siteurl/?p=user&amp;u_id=$d_lastuser">$d_lastusername</a> בתאריך:<br />$d_lastdate</td>\r\n</tr>', '2004-04-25 23:14:04');
INSERT INTO `templates` VALUES (47, 'Forum', 'forum_row', '<tr>\r\n<td class="$onetwo"><a href="$siteurl/?p=forum&amp;f_id=$f_id">$f_name</a>\r\n</td>\r\n<td class="$onetwo">$f_discs</td>\r\n<td class="$onetwo">$f_posts</td>\r\n</tr>', '<tr>\r\n<td class="$onetwo"><a href="$siteurl/?p=forum&amp;f_id=$f_id">$f_name</a>\r\n</td>\r\n<td class="$onetwo">$f_discs</td>\r\n<td class="$onetwo">$f_posts</td>\r\n</tr>', '2004-04-18 22:29:19');
INSERT INTO `templates` VALUES (48, 'Forum', 'forum_new_form', '$errmsg\r\n<a name="postform"></a>\r\n<form name="post_form" action="$action" method="POST">\r\n<table border="0">\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td colspan="2"><input type="text" name="r_name" value="$_SESSION[u_name]"></td>\r\n<td>סיסמא: </td>\r\n<td colspan="2"><input type="password" name="r_pass" value="$_SESSION[u_name]"></td>\r\n</tr>\r\n<tr>\r\n<td>כותרת: </td>\r\n<td colspan="5">\r\n<input size="50" type="text" name="r_title">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>התגובה: </td>\r\n<td colspan="5"><textarea dir="rtl" name="r_body" cols="50" rows="20">$r_body</textarea></td>\r\n</tr>\r\n<tr>\r\n<td colspan="3"><input type="submit" value="שלח"></td>\r\n<td colspan="3"> עברית: <input type="radio" value="rtl" name="r_lang" onClick="changeDir(0)" $hebcheck> אנגלית: <input type="radio" value="ltr" name="r_lang" onClick="changeDir(1)" $engcheck>\r\n</tr>\r\n</table>\r\n</form>', '$errmsg\r\n<a name="postform"></a>\r\n<form name="post_form" action="$action" method="POST">\r\n<table border="0">\r\n<tr>\r\n<td>שם משתמש: </td>\r\n<td colspan="2"><input type="text" name="r_name" value="$_SESSION[u_name]"></td>\r\n<td>סיסמא: </td>\r\n<td colspan="2"><input type="password" name="r_pass" value="$_SESSION[u_name]"></td>\r\n</tr>\r\n<tr>\r\n<td>כותרת: </td>\r\n<td colspan="5">\r\n<input size="50" type="text" name="r_title">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>התגובה: </td>\r\n<td colspan="5"><textarea dir="rtl" name="r_body" cols="50" rows="20">$r_body</textarea></td>\r\n</tr>\r\n<tr>\r\n<td colspan="3"><input type="submit" value="שלח"></td>\r\n<td colspan="3"> עברית: <input type="radio" value="rtl" name="r_lang" onClick="changeDir(0)" $hebcheck> אנגלית: <input type="radio" value="ltr" name="r_lang" onClick="changeDir(1)" $engcheck>\r\n</tr>\r\n</table>\r\n</form>', '2004-04-04 00:16:39');
INSERT INTO `templates` VALUES (58, 'Online', 'online_member_row', '<tr>\r\n<td class="one"><a href="$siteurl/?p=user&amp;u_id=$member_id">$member_name</a></td><td class="one">$member_ip</td><td class="one">$member_usergroup</td>\r\n<td class="one"><a href="$member_action">$member_action</a></td>\r\n<td class="one">$member_idle דקות</td>\r\n</tr>', '<tr>\r\n<td class="one"><a href="$siteurl/?p=user&amp;u_id=$member_id">$member_name</a></td><td class="one">$member_ip</td><td class="one">$member_usergroup</td>\r\n<td class="one"><a href="$member_action">$member_action</a></td>\r\n<td class="one">$member_idle דקות</td>\r\n</tr>', '2004-05-15 14:46:51');
INSERT INTO `templates` VALUES (50, 'Forum', 'forum_main', '<table class="wide" cellspacing="1" cellpadding="2">\r\n<tr><th>פורום</th>\r\n<th>דיונים</th>\r\n<th>הודעות</th></tr>\r\n$forum_row\r\n</table>', '<table class="wide" cellspacing="1" cellpadding="2">\r\n<tr><th>פורום</th>\r\n<th>דיונים</th>\r\n<th>הודעות</th></tr>\r\n$forum_row\r\n</table>', '2004-04-03 18:10:40');
INSERT INTO `templates` VALUES (57, 'Online', 'online_table', '<table class="wide">\r\n<tr>\r\n<th>משתמש</th><th>IP</th><th>רמה</th>\r\n<th>פעולה אחרונה</th><th>לפני</th>\r\n</tr>\r\n$online_rows\r\n</table>', '<table class="wide">\r\n<tr>\r\n<th>משתמש</th><th>IP</th><th>רמה</th>\r\n<th>פעולה אחרונה</th><th>לפני</th>\r\n</tr>\r\n$online_rows\r\n</table>', '2004-04-04 01:50:35');
INSERT INTO `templates` VALUES (61, 'Error', 'error_invalid_input', '<p><b>Error! - Invalid Input</b></p>', '<p><b>Error! - Invalid Input</b></p>', '2004-04-03 23:24:28');
INSERT INTO `templates` VALUES (62, 'Forum', 'forum_admin_main', '<p><a href="$adminurl/?p=forums&amp;a=new">Create New Forum</a></p>\r\n<table class="wide" cellspacing="1" cellpadding="2">\r\n<tr><th>Forum</th>\r\n<th>Discussions</th>\r\n<th>Posts</th>\r\n<th>Options</th></tr>\r\n$forum_row\r\n</table>', '<p><a href="$adminurl/?p=forums&amp;a=new">Create New Forum</a></p>\r\n<table class="wide" cellspacing="1" cellpadding="2">\r\n<tr><th>Forum</th>\r\n<th>Discussions</th>\r\n<th>Posts</th>\r\n<th>Options</th></tr>\r\n$forum_row\r\n</table>', '2004-04-18 22:31:45');
INSERT INTO `templates` VALUES (63, 'Forum', 'forum_admin_row', '<tr>\r\n<td class="$onetwo"><a href="$adminurl/?p=forums&amp;a=edit&amp;f_id=$f_id">$f_name</a></td>\r\n<td class="$onetwo">$f_discs</td>\r\n<td class="$onetwo">$f_posts</td>\r\n<td class="$onetwo"><a href="$adminurl/?p=forums&amp;a=delete&amp;f_id=$f_id">[delete]</a></td>\r\n</tr>', '<tr>\r\n<td class="$onetwo"><a href="$adminurl/?p=forums&amp;a=edit&amp;f_id=$f_id">$f_name</a></td>\r\n<td class="$onetwo">$f_discs</td>\r\n<td class="$onetwo">$f_posts</td>\r\n<td class="$onetwo"><a href="$adminurl/?p=forums&amp;a=delete&amp;f_id=$f_id">[delete]</a></td>\r\n</tr>', '2004-04-18 22:30:52');
INSERT INTO `templates` VALUES (64, 'User', 'user_profile', '<table class="wide">\r\n<tr><th>name</th><th>posts</th></tr>\r\n<tr><td class="one">$u_name</td><td class="one">$u_posts</td></tr>\r\n</table>', '<table class="wide">\r\n<tr><th>name</th><th>posts</th></tr>\r\n<tr><td class="one">$u_name</td><td class="one">$u_posts</td></tr>\r\n</table>', '2004-04-04 00:36:56');
INSERT INTO `templates` VALUES (65, 'User', 'user_list', '$pagination\r\n<table class="wide">\r\n<tr><th>שם</th><th>תאריך הרשמה</th></tr>\r\n$user_rows\r\n</table>\r\n$pagination', '$pagination\r\n<table class="wide">\r\n<tr><th>שם</th><th>תאריך הרשמה</th></tr>\r\n$user_rows\r\n</table>\r\n$pagination', '2004-04-08 19:23:32');
INSERT INTO `templates` VALUES (66, 'User', 'user_row', '<tr><td class="one">\r\n<a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a></td>\r\n<td class="one">$u_joindate</td></tr>', '<tr><td class="one">\r\n<a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a></td>\r\n<td class="one">$u_joindate</td></tr>', '2004-04-18 22:08:07');
INSERT INTO `templates` VALUES (67, 'News', 'news_item', '<a name="1"></a>\r\n<table cellspacing="0" cellpadding="0" border="0" bordercolor="yellow" width="100%">\r\n<tr><td>\r\n\r\n<table class="wide">\r\n<tr>\r\n<td class="cat" align="center"><b><a href="$siteurl/?p=post&amp;d_id=$d_id">$d_name</a></b></td>\r\n</tr>\r\n<tr>\r\n<th align="right">פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date | $d_replies תגובות</th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n</table>\r\n\r\n</td><tr>\r\n<tr><td class="three">\r\n$lastedited\r\n</td></tr>\r\n<tr><td class="three" height="20">\r\n</td></tr>\r\n</table>', '<a name="1"></a>\r\n<table cellspacing="0" cellpadding="0" border="0" bordercolor="yellow" width="100%">\r\n<tr><td>\r\n\r\n<table class="wide">\r\n<tr>\r\n<td class="cat" align="center"><b><a href="$siteurl/?p=post&amp;d_id=$d_id">$d_name</a></b></td>\r\n</tr>\r\n<tr>\r\n<th align="right">פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date | $d_replies תגובות</th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n</table>\r\n\r\n</td><tr>\r\n<tr><td class="three">\r\n$lastedited\r\n</td></tr>\r\n<tr><td class="three" height="20">\r\n</td></tr>\r\n</table>', '2004-04-18 22:24:31');
INSERT INTO `templates` VALUES (68, 'News', 'news_main', '<p><b>חדשות - </b></p>\r\n$news_items\r\n$pagination', '<p><b>חדשות - </b></p>\r\n$news_items\r\n$pagination', '2004-04-06 18:20:40');
INSERT INTO `templates` VALUES (69, 'Post', 'post_page', '<td class="two"><a href="$url/?$ref" title="$alt">$sign</a></td>', '<td class="two"><a href="$url/?$ref" title="$alt">$sign</a></td>', '2004-04-08 20:26:16');
INSERT INTO `templates` VALUES (70, 'Post', 'post_pages', '<table class="box"><tr>\r\n$p_pages\r\n</tr></table>', '<table class="box"><tr>\r\n$p_pages\r\n</tr></table>', '2004-04-08 17:16:19');
INSERT INTO `templates` VALUES (71, 'Post', 'post_newchild', '<a id="$p_id" name="$p_id"></a>\r\n<table class="childblock" cellspacing="0" cellpadding="0">\r\n<tr><td rowspan="2" width="$spacer"></td>\r\n<td>\r\n\r\n<table class="newchild">\r\n<tr>\r\n<th align="right"><b><font color="yellow">(*חדש*)</font>[$p_order]</b>פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date $p_parentorder</th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n<tr><td class="edited-text"> $lastedited\r\n</td></tr>\r\n<tr>\r\n<td colspan="2"></td></tr>\r\n</table>', '<a id="$p_id" name="$p_id"></a>\r\n<table class="childblock" cellspacing="0" cellpadding="0">\r\n<tr><td rowspan="2" width="$spacer"></td>\r\n<td>\r\n\r\n<table class="newchild">\r\n<tr>\r\n<th align="right"><b><font color="yellow">(*חדש*)</font>[$p_order]</b>פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date $p_parentorder</th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n<tr><td class="edited-text"> $lastedited\r\n</td></tr>\r\n<tr>\r\n<td colspan="2"></td></tr>\r\n</table>', '2004-04-23 13:33:25');
INSERT INTO `templates` VALUES (72, 'Post', 'post_newparent', '<a name="1"></a>\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%">\r\n<tr><td>\r\n\r\n<table class="newparent">\r\n<tr>\r\n<td class="newcat" align="right"><b><font color="yellow">(*חדש*)</font> $d_name</b></td>\r\n</tr>\r\n<tr>\r\n<th align="right">פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date | מיין תגובות לפי: <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=flat">[תאריך]</a> <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=tree">[שייכות]</a></th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td><tr>\r\n<tr><td class="three">\r\n$lastedited\r\n</td></tr>\r\n<tr>\r\n<td></td></tr>\r\n</table>', '<a name="1"></a>\r\n<table cellspacing="0" cellpadding="0" border="0" width="100%">\r\n<tr><td>\r\n\r\n<table class="newparent">\r\n<tr>\r\n<td class="newcat" align="right"><b><font color="yellow">(*חדש*)</font> $d_name</b></td>\r\n</tr>\r\n<tr>\r\n<th align="right">פורסם ע"י <a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a> בתאריך $p_date | מיין תגובות לפי: <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=flat">[תאריך]</a> <a href="$siteurl/?p=post&amp;d_id=$d_id&amp;f_id=$f_id&amp;pn=$pn&amp;view=tree">[שייכות]</a></th>\r\n</tr>\r\n<tr>\r\n<td class="two" dir="$p_lang">$p_body</td>\r\n</tr>\r\n<tr>\r\n<td class="one">$delpostcode $editpostcode $replycode</td>\r\n</tr>\r\n</table>\r\n\r\n</td><tr>\r\n<tr><td class="three">\r\n$lastedited\r\n</td></tr>\r\n<tr>\r\n<td></td></tr>\r\n</table>', '2004-04-18 23:07:17');
INSERT INTO `templates` VALUES (73, 'Test', 'test98', 'test123981423\r\naaaa\r\nbbbb\r\ncccc\r\ndddd\r\n\r\neeee\r\n1111', 'test123981423\r\naaaa\r\nbbbb\r\ncccc\r\ndddd\r\n\r\neeee\r\n1111', '2004-04-08 18:27:39');
INSERT INTO `templates` VALUES (74, 'Template', 'template_fields_bar', '<tr><th>Template</th>\r\n<th>Options</th> \r\n<th>Last Changed</th></tr>', '<tr><th>Template</th>\r\n<th>Options</th> \r\n<th>Last Changed</th></tr>', '2004-04-08 11:44:49');
INSERT INTO `templates` VALUES (75, 'Test2', '1414', '1414', '1414', '2004-04-08 11:48:59');
INSERT INTO `templates` VALUES (76, 'Test', 'timetest', 'asdasd', 'asdasd', '2004-04-08 17:59:57');
INSERT INTO `templates` VALUES (77, 'Post', 'post_new_row', '<tr><td class="$onetwo"><a href="$siteurl/?p=post&amp;d_id=$d_id">$d_name</a></td>\r\n<td class="$onetwo"><a href="$siteurl/?p=forum&amp;f_id=$f_id">$f_name</a></td>\r\n<td class="$onetwo"><a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a></td>\r\n<td class="$onetwo">$d_replies ($d_newreplies חדשות)</td>\r\n<td class="$onetwo">מאת: <a href="$siteurl/?p=user&amp;u_id=$d_lastuser">$d_lastusername</a><br />בתאריך: $d_lastdate</td>\r\n</tr>', '<tr><td class="$onetwo"><a href="$siteurl/?p=post&amp;d_id=$d_id">$d_name</a></td>\r\n<td class="$onetwo"><a href="$siteurl/?p=forum&amp;f_id=$f_id">$f_name</a></td>\r\n<td class="$onetwo"><a href="$siteurl/?p=user&amp;u_id=$u_id">$u_name</a></td>\r\n<td class="$onetwo">$d_replies ($d_newreplies חדשות)</td>\r\n<td class="$onetwo">מאת: <a href="$siteurl/?p=user&amp;u_id=$d_lastuser">$d_lastusername</a><br />בתאריך: $d_lastdate</td>\r\n</tr>', '2004-04-18 22:35:30');
INSERT INTO `templates` VALUES (78, 'Post', 'post_new_mark', '<table class="box" align="center">\r\n<tr>\r\n<td><a href="$siteurl/?p=post&amp;a=mark">סמן את כל ההודעות כהודעות שנקראו</a></td>\r\n</tr>\r\n</table>', '<table class="box" align="center">\r\n<tr>\r\n<td><a href="$siteurl/?p=post&amp;a=mark">סמן את כל ההודעות כהודעות שנקראו</a></td>\r\n</tr>\r\n</table>', '2004-04-18 22:22:00');
INSERT INTO `templates` VALUES (80, 'Error', 'error_invalid_pid', 'error_invalid_pid', 'error_invalid_pid', '2004-04-10 22:41:40');
INSERT INTO `templates` VALUES (79, 'Post', 'post_new_table', '$error_frame\r\n$pagination\r\n<table class="parent" width="100%" border="0" cellspacing="1" cellpadding="1">\r\n<tr>\r\n<th>שם הדיון</th>\r\n<th>פורום</th>\r\n<th>מאת</th>\r\n<th>הודעות</th>\r\n<th>הודעה אחרונה</th>\r\n</tr>\r\n$post_new_rows\r\n</table>\r\n$pagination\r\n$post_new_mark', '$error_frame\r\n$pagination\r\n<table class="parent" width="100%" border="0" cellspacing="1" cellpadding="1">\r\n<tr>\r\n<th>שם הדיון</th>\r\n<th>פורום</th>\r\n<th>מאת</th>\r\n<th>הודעות</th>\r\n<th>הודעה אחרונה</th>\r\n</tr>\r\n$post_new_rows\r\n</table>\r\n$pagination\r\n$post_new_mark', '2004-04-09 15:32:39');
INSERT INTO `templates` VALUES (81, 'Error', 'error_no_access', 'error_no_access', 'error_no_access', '2004-04-10 22:44:57');
INSERT INTO `templates` VALUES (82, 'Error', 'error_cant_del_children', '<p><b>You are not allowed to delete posts that have child posts</b></p>', '<p><b>You are not allowed to delete posts that have child posts</b></p>', '2004-04-10 22:48:03');
INSERT INTO `templates` VALUES (83, 'User', 'user_admin_list', '$pagination\r\n<table class="wide">\r\n<tr><th>שם</th><th>תאריך הרשמה</th></tr>\r\n$user_rows\r\n</table>\r\n$pagination', '$pagination\r\n<table class="wide">\r\n<tr><th>שם</th><th>תאריך הרשמה</th></tr>\r\n$user_rows\r\n</table>\r\n$pagination', '2004-04-11 04:03:41');
INSERT INTO `templates` VALUES (84, 'User', 'user_admin_row', '<tr><td class="one">\r\n<a href="$adminurl/?p=users&amp;u_id=$u_id">$u_name</a></td>\r\n<td class="one">$u_joindate</td></tr>', '<tr><td class="one">\r\n<a href="$adminurl/?p=users&amp;u_id=$u_id">$u_name</a></td>\r\n<td class="one">$u_joindate</td></tr>', '2004-04-18 22:16:01');
INSERT INTO `templates` VALUES (85, 'User', 'user_admin_edit', '$error_frame\r\n<form name="user_edit" method="post" action="$adminurl/?p=users&amp;u_id=$u_id&amp;a=update">\r\n<input type="hidden" name="oldgid" value="$g_id">\r\n<table>\r\n<tr>\r\n<td valign="top">\r\n\r\n<table class="box" cellpadding="0" cellspacing="1">\r\n<tr>\r\n<td class="one">User Name: </td>\r\n<td class="one">\r\n<input type="text" name="u_name" value="$u_name">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Password: </td>\r\n<td class="one">\r\n<input type="password" name="u_pass" value="">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Email: </td>\r\n<td class="one">\r\n<input type="text" name="u_email" value="$u_email">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="one">User Group: </td>\r\n<td class="one">$groupselect</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n<td valign="top">\r\n\r\n<table class="box" cellpadding="1" cellspacing="1">\r\n<tr>\r\n<td class="one">Join Date: </td>\r\n<td class="one">$u_joindate</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Last Login: </td>\r\n<td class="one">$u_lastlogin</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Last Logout: </td>\r\n<td class="one">$u_lastlogout</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Last IP: </td>\r\n<td class="one">$u_ip</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Posts: </td>\r\n<td class="one">$u_posts</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td colspan="2">\r\n\r\n<table class="box" cellpadding="1" cellspacing="1">\r\n<tr>\r\n<td class="one">Real Name: </td>\r\n<td class="one"><input type="text" name="u_realname" value="$u_realname" /></td>\r\n</tr>\r\n<tr>\r\n<td class="one">Birth Day: </td>\r\n<td class="one">$u_birthday</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Homepage: </td>\r\n<td class="one"><input type="text" name="u_homepage" value="$u_homepage" /></td>\r\n</tr>\r\n<tr>\r\n<td class="one">ICQ: </td>\r\n<td class="one"><input type="text" name="u_icq" value="$u_icq" /></td>\r\n</tr>\r\n<tr>\r\n<td class="one">Self Info: </td>\r\n<td class="one"><textarea name="u_self">$u_self</textarea></td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td colspan="2">\r\n\r\n$access_list\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n<input type="submit" value="Submit">\r\n\r\n</form>', '$error_frame\r\n<form name="user_edit" method="post" action="$adminurl/?p=users&amp;u_id=$u_id&amp;a=update">\r\n<input type="hidden" name="oldgid" value="$g_id">\r\n<table>\r\n<tr>\r\n<td valign="top">\r\n\r\n<table class="box" cellpadding="0" cellspacing="1">\r\n<tr>\r\n<td class="one">User Name: </td>\r\n<td class="one">\r\n<input type="text" name="u_name" value="$u_name">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Password: </td>\r\n<td class="one">\r\n<input type="password" name="u_pass" value="">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Email: </td>\r\n<td class="one">\r\n<input type="text" name="u_email" value="$u_email">\r\n</td>\r\n</tr>\r\n<tr>\r\n<td class="one">User Group: </td>\r\n<td class="one">$groupselect</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n<td valign="top">\r\n\r\n<table class="box" cellpadding="1" cellspacing="1">\r\n<tr>\r\n<td class="one">Join Date: </td>\r\n<td class="one">$u_joindate</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Last Login: </td>\r\n<td class="one">$u_lastlogin</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Last Logout: </td>\r\n<td class="one">$u_lastlogout</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Last IP: </td>\r\n<td class="one">$u_ip</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Posts: </td>\r\n<td class="one">$u_posts</td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td colspan="2">\r\n\r\n<table class="box" cellpadding="1" cellspacing="1">\r\n<tr>\r\n<td class="one">Real Name: </td>\r\n<td class="one"><input type="text" name="u_realname" value="$u_realname" /></td>\r\n</tr>\r\n<tr>\r\n<td class="one">Birth Day: </td>\r\n<td class="one">$u_birthday</td>\r\n</tr>\r\n<tr>\r\n<td class="one">Homepage: </td>\r\n<td class="one"><input type="text" name="u_homepage" value="$u_homepage" /></td>\r\n</tr>\r\n<tr>\r\n<td class="one">ICQ: </td>\r\n<td class="one"><input type="text" name="u_icq" value="$u_icq" /></td>\r\n</tr>\r\n<tr>\r\n<td class="one">Self Info: </td>\r\n<td class="one"><textarea name="u_self">$u_self</textarea></td>\r\n</tr>\r\n</table>\r\n\r\n</td>\r\n</tr>\r\n\r\n<tr>\r\n<td colspan="2">\r\n\r\n$access_list\r\n\r\n</td>\r\n</tr>\r\n</table>\r\n\r\n<input type="submit" value="Submit">\r\n\r\n</form>', '2004-04-23 19:46:40');
INSERT INTO `templates` VALUES (86, 'User', 'user_admin_access_row_yes', '<tr>\r\n<td class="$onetwo">$a_key</td>\r\n<td class="$onetwo"> <b>Yes</b> <input type="radio" name="$a_key" value="$a_value" checked></td>\r\n<td class="$onetwo"> <b>No</b> <input type="radio" name="$a_key" value="0"></td>\r\n</tr>', '<tr>\r\n<td class="$onetwo">$a_key</td>\r\n<td class="$onetwo"> <b>Yes</b> <input type="radio" name="$a_key" value="$a_value" checked></td>\r\n<td class="$onetwo"> <b>No</b> <input type="radio" name="$a_key" value="0"></td>\r\n</tr>', '2004-04-18 16:44:48');
INSERT INTO `templates` VALUES (87, 'User', 'user_admin_access_row_no', '<tr>\r\n<td class="$onetwo">$a_key</td>\r\n<td class="$onetwo"> <b>Yes</b> <input type="radio" name="$a_key" value="$a_value"></td>\r\n<td class="$onetwo"> <b>No</b> <input type="radio" name="$a_key" value="0" checked></td>\r\n</tr>', '<tr>\r\n<td class="$onetwo">$a_key</td>\r\n<td class="$onetwo"> <b>Yes</b> <input type="radio" name="$a_key" value="$a_value"></td>\r\n<td class="$onetwo"> <b>No</b> <input type="radio" name="$a_key" value="0" checked></td>\r\n</tr>', '2004-04-18 16:45:03');
INSERT INTO `templates` VALUES (88, 'User', 'user_admin_access_list', '<table cellpadding="0" cellspacing="1">\r\n<tr>\r\n<td valign="top">\r\n<table class="box">\r\n<tr>\r\n<th colspan="3">Forum Access</th>\r\n</tr>\r\n$forum_rows\r\n</table>\r\n</td>\r\n<td valign="top">\r\n<table class="box">\r\n<tr>\r\n<th colspan="3">Admin Access</th>\r\n</tr>\r\n$admin_rows\r\n</table>\r\n</td>\r\n<td valign="top">\r\n<table class="box">\r\n<tr>\r\n<th colspan="3">Preferences</th>\r\n</tr>\r\n$prefs_rows\r\n</table>\r\n</td>\r\n</tr>\r\n</table>', '<table cellpadding="0" cellspacing="1">\r\n<tr>\r\n<td valign="top">\r\n<table class="box">\r\n<tr>\r\n<th colspan="3">Forum Access</th>\r\n</tr>\r\n$forum_rows\r\n</table>\r\n</td>\r\n<td valign="top">\r\n<table class="box">\r\n<tr>\r\n<th colspan="3">Admin Access</th>\r\n</tr>\r\n$admin_rows\r\n</table>\r\n</td>\r\n<td valign="top">\r\n<table class="box">\r\n<tr>\r\n<th colspan="3">Preferences</th>\r\n</tr>\r\n$prefs_rows\r\n</table>\r\n</td>\r\n</tr>\r\n</table>', '2004-04-17 10:28:44');
INSERT INTO `templates` VALUES (89, 'Error', 'error_cant_reply', '<p><b>error_cant_reply</b></p>', '<p><b>error_cant_reply</b></p>', '2004-04-11 05:44:37');
INSERT INTO `templates` VALUES (90, 'Register', 'register_rules', 'לאתר יש מספר חוקים בסיסיים כדי לדאוג לשמירה על רגשותיהם של הגולשים ובלהבלהבלה', 'לאתר יש מספר חוקים בסיסיים כדי לדאוג לשמירה על רגשותיהם של הגולשים ובלהבלהבלה', '2004-04-12 02:54:01');
INSERT INTO `templates` VALUES (91, 'Test2', 'testoron', 'ole ole\r\nnash\'ir beyahad', 'ole ole\r\nnash\'ir beyahad', '2004-04-26 10:29:11');

# --------------------------------------------------------

#
# Table structure for table `user`
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(10) unsigned NOT NULL auto_increment,
  `g_id` smallint(5) unsigned NOT NULL default '0',
  `u_name` varchar(50) NOT NULL default '',
  `u_pass` varchar(32) NOT NULL default '',
  `u_email` varchar(50) NOT NULL default '',
  `u_realname` varchar(50) NOT NULL default '',
  `u_birthday` datetime NOT NULL default '0000-00-00 00:00:00',
  `u_homepage` varchar(100) NOT NULL default '',
  `u_icq` varchar(20) NOT NULL default '',
  `u_self` varchar(255) NOT NULL default '',
  `u_joindate` datetime NOT NULL default '0000-00-00 00:00:00',
  `u_lastlogin` datetime NOT NULL default '0000-00-00 00:00:00',
  `u_lastlogout` datetime NOT NULL default '0000-00-00 00:00:00',
  `u_ip` varchar(15) NOT NULL default '0.0.0.0',
  `u_lastpost` int(10) unsigned NOT NULL default '0',
  `u_posts` int(10) unsigned NOT NULL default '0',
  `u_prefs` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`u_id`),
  UNIQUE KEY `username` (`u_name`),
  KEY `usergroupid` (`g_id`),
  KEY `birthday` (`u_birthday`)
) TYPE=MyISAM AUTO_INCREMENT=34 ;

#
# Dumping data for table `user`
#

INSERT INTO `user` VALUES (3, 2, 'ewq', 'caf1a3dfb505ffed0d024130f58c5cfa', '', '', '0000-00-00 00:00:00', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (1, 1, 'qwe', '202cb962ac59075b964b07152d234b70', '', '', '0000-00-00 00:00:00', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (4, 2, 'asd', '202cb962ac59075b964b07152d234b70', '', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 00:46:02', '2004-02-14 00:46:02', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (5, 2, 'asd123', 'bfd59291e825b5f2bbf1eb76569f8fe7', '', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 00:50:45', '2004-02-14 00:50:45', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (6, 0, 'zbro', 'e10adc3949ba59abbe56e057f20f883e', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 01:27:34', '2004-02-14 01:27:34', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (7, 0, 'asd5', '7815696ecbf1c96e6894b779456d330e', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 14:56:06', '2004-02-14 14:56:06', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (8, 0, 'asd52', '7815696ecbf1c96e6894b779456d330e', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 14:57:37', '2004-02-14 14:57:37', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (9, 2, 'asd654', 'ab233b682ec355648e7891e66c54191b', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 14:59:06', '2004-02-14 14:59:06', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (10, 1, 'asd6541', '7815696ecbf1c96e6894b779456d330e', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 15:05:28', '2004-02-14 15:05:28', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (11, 6, 'zorba', '0d57401765fabb1c1d5f207058908929', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-02-18 19:41:50', '2004-05-15 14:41:11', '2004-05-15 14:41:03', '127.0.0.1', 0, 96, 0);
INSERT INTO `user` VALUES (12, 2, 'arr', 'd41d8cd98f00b204e9800998ecf8427e', 'zbro@012.net.il', 'ab', '0000-00-00 00:00:00', '1', '1312a', 'asdas', '2004-02-20 01:48:19', '2004-02-20 01:49:42', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (2, 2, 'mosh', 'ab233b682ec355648e7891e66c54191b', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-02-14 14:59:06', '2004-02-14 14:59:06', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (13, 2, 'joatmon', '1e14d9346e95410c238f307a5a200544', 'goat_cx@fastmail.fm', '', '0000-00-00 00:00:00', '', '', '', '2004-03-02 16:44:35', '2004-03-02 18:35:58', '0000-00-00 00:00:00', '127.0.0.1', 0, 0, 0);
INSERT INTO `user` VALUES (14, 2, 'goat', 'a94aa000f9a94cc51775bd5eac97c926', 'goat_cx@fastmail.fm', '', '0000-00-00 00:00:00', '', '', '', '2004-03-26 19:10:22', '2004-04-29 00:10:08', '2004-04-24 12:54:26', '80.178.184.222', 0, 11, 0);
INSERT INTO `user` VALUES (15, 0, 'mushon', '1ef5d8188560e8e85c9847756c2d360d', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-03 01:42:18', '2004-04-03 01:42:18', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (16, 0, 'gushon', '657d307e8c35ee0cd64e0dcdaa20fe50', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-03 01:44:01', '2004-04-03 01:44:01', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (17, 1, 'bushon', '5107d8cdb0a2dffa0d2f0935402b569c', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-03 01:45:55', '2004-04-03 01:45:55', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (18, 0, 'tushon', '3f112a196a3db827a0ba7fc3ccc6b7a6', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-03 01:53:07', '2004-04-03 01:53:07', '0000-00-00 00:00:00', '0.0.0.0', 0, 0, 0);
INSERT INTO `user` VALUES (19, 1, 'ushon', '373894878d1504c7ab9304c3f42f34a2', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-03 01:55:07', '2004-04-04 21:15:12', '0000-00-00 00:00:00', '127.0.0.1', 0, 0, 0);
INSERT INTO `user` VALUES (20, 1, 'saar', 'aa20d239b0ab4229c275d88a1c33879d', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-08 22:26:42', '2004-04-08 22:29:32', '2004-04-08 22:29:54', '127.0.0.1', 0, 2, 0);
INSERT INTO `user` VALUES (22, 1, 'new2', '82f2ec5f5ed4dfed2b55c68496d7bac4', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-09 15:40:22', '2004-04-09 15:42:52', '2004-04-09 15:45:27', '127.0.0.1', 0, 0, 0);
INSERT INTO `user` VALUES (21, 1, 'new', '22af645d1859cb5ca6da0c484f1f37ea', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-09 03:20:57', '2004-04-09 14:07:52', '2004-04-09 14:07:55', '127.0.0.1', 0, 3, 0);
INSERT INTO `user` VALUES (23, 1, 'new3', '51bb788eb8fe3a72ca7a3cdb276b4cb7', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-09 15:45:42', '2004-04-09 15:46:26', '2004-04-09 15:47:35', '127.0.0.1', 0, 0, 0);
INSERT INTO `user` VALUES (24, 2, 'ryu', 'd4cfab1b518d245bc1fc8db52b6d8ddc', 'zbro@012.net.il', 'tyu', '1998-04-03 00:00:00', 'ryu.com', '123456', 'hii gud', '2004-04-16 11:16:22', '2004-04-16 11:18:22', '2004-04-16 11:22:14', '127.0.0.1', 0, 0, 3);
INSERT INTO `user` VALUES (25, 2, 'jo', '674f33841e2309ffdd24c85dc3b999de', 'zbro@012.net.il', 'יוני', '1904-03-02 00:00:00', 'http://narshell-bog.security.com/index.php?op=56&amp;', '1234567', 'אני אחלה גבר גבר', '2004-04-16 15:22:55', '2004-04-16 15:24:58', '2004-04-16 15:28:39', '127.0.0.1', 0, 0, 1);
INSERT INTO `user` VALUES (31, 2, 'err', '56bd7107802ebe56c6918992f0608ec6', 'zbro@012.net.il', 'err', '0000-00-00 00:00:00', '', '', '', '2004-04-26 12:28:18', '2004-04-26 12:28:18', '2004-04-26 12:28:18', '0.0.0.0', 0, 0, 1);
INSERT INTO `user` VALUES (29, 1, 'bob1', '9f9d51bc70ef21ca5c14f307980a29d8', 'zbro@012.net.ilaa', '', '0000-00-00 00:00:00', '', '', '', '2004-04-16 18:46:17', '2004-04-16 18:46:17', '2004-04-16 18:46:17', '0.0.0.0', 0, 0, 1);
INSERT INTO `user` VALUES (30, 2, 'bog', 'e07cd1723fbeb38e9e7485d54b593f64', 'zbro@012.net.il', '', '0000-00-00 00:00:00', '', '', '', '2004-04-16 19:43:17', '2004-04-17 01:05:18', '2004-04-17 01:05:22', '127.0.0.1', 0, 2, 1);
INSERT INTO `user` VALUES (32, 2, 'mogul', '46a2e117cd5f5fa9095975071b6b6f3b', 'zbro@012.net.il', 'mogulevski', '1983-08-10 00:00:00', 'http://narshell-bog.security.com/index.php?op=56&amp;', '12345676', 'היי אני גבר גבר', '2004-04-26 14:53:49', '2004-04-26 14:53:49', '2004-04-26 14:53:49', '0.0.0.0', 0, 0, 1);
INSERT INTO `user` VALUES (33, 1, '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '0000-00-00 00:00:00', '', '12341341', '', '2004-04-26 18:31:04', '2004-04-26 18:31:04', '2004-04-26 18:31:04', '0.0.0.0', 0, 0, 1);

# --------------------------------------------------------

#
# Table structure for table `user_activate`
#

DROP TABLE IF EXISTS `user_activate`;
CREATE TABLE `user_activate` (
  `u_id` int(10) unsigned NOT NULL default '0',
  `u_code` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`u_id`)
) TYPE=MyISAM;

#
# Dumping data for table `user_activate`
#

INSERT INTO `user_activate` VALUES (8, 70057);
INSERT INTO `user_activate` VALUES (15, 92156);
INSERT INTO `user_activate` VALUES (16, 84430);
INSERT INTO `user_activate` VALUES (18, 66187);
INSERT INTO `user_activate` VALUES (33, 30445);

# --------------------------------------------------------

#
# Table structure for table `user_group`
#

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `g_id` smallint(5) unsigned NOT NULL default '0',
  `g_name` char(50) NOT NULL default '',
  `g_forum` int(10) unsigned NOT NULL default '0',
  `g_admin` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`g_id`),
  UNIQUE KEY `g_name` (`g_name`)
) TYPE=MyISAM;

#
# Dumping data for table `user_group`
#

INSERT INTO `user_group` VALUES (0, 'Banned User', 0, 0);
INSERT INTO `user_group` VALUES (1, 'Guest', 1, 0);
INSERT INTO `user_group` VALUES (2, 'Member', 47, 0);
INSERT INTO `user_group` VALUES (3, 'Trusted Member', 127, 10);
INSERT INTO `user_group` VALUES (6, 'Head Admin', 2047, 131071);
