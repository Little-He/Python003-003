/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:33306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 04/11/2020 21:45:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$Hc6oLKEnbecn$XreCmjOyYEKOaYGSCfjVrg7hvcqo6Lw/FVj2eVeAA6c=', '2020-11-04 13:20:36.155381', 1, 'admin', '', '', 'admin@163.com', 1, 1, '2020-11-04 13:10:09.888379');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$150000$0k2nnJ9uybKv$QxFG7Ze1/XUE/ZXk1oXRkgP2DmItuCvOHQusfHZ0Lkg=', NULL, 1, 'xiaohe', '', '', 'xiaohe@163.com', 1, 1, '2020-11-04 13:11:08.617456');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '品论内容',
  `star` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论星级',
  `username` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论人',
  `pdate` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, '反对逢煽情就批判的另类政治正确，这样的题材就应该有这样的张力。陈可辛是实打实的细节狂魔与情绪大师，从袁伟民到陈忠和到郎平，三代脊梁，选的片段太过合适。前期争议很大的“和平大战”的魅力在于中国教练、中国理念与中国技术的碰撞，这就是最“中国”的女排故事，又完美地串联起女排的兴替脉络，远比单纯的胜利来得更重要。看过很多十几年前报道的老球迷表示白浪太像她妈了，陈忠和的形象没有半毛钱歪曲，而巩俐就是郎平，她...', 5, 'BARRYoung', '2020-09-25 00:57:04');
INSERT INTO `comment` VALUES (2, '有点尴尬，卖弄情怀，得不偿失', 1, '豆友209430872', '2020-09-25 16:15:39');
INSERT INTO `comment` VALUES (3, '非常不满意巩俐的表演，纸片人的演法，看似气场满满，但空如纸老虎。', 3, '朝阳区陆依萍', '2020-09-24 21:40:59');
INSERT INTO `comment` VALUES (4, '大小点都很好，情绪饱满，泪点一环扣一环。当你在影院正被热血和辛酸感动，吴刚就会蹦出一句“别哭”制止你。朱婷那个“为了爸妈、为了成为你” 简直暴击，梦想面前，我们卑微的只能做好当下事，理由还重要吗？国歌响起时，巩皇语音给黄渤听，太细了，那是我们在演唱会打给心里惦记的人才做的事…成为一个优秀的运动员，还是一个优秀的人？放下历史包袱，轻装上阵，内心不够强大，赢才是唯一标准。时代变了，我们还需要女排精神吗...', 5, '影志', '2020-09-22 15:15:10');
INSERT INTO `comment` VALUES (5, '这个片子真的没办法打高分，幸亏换名字了，不然分更低。拍的不伦不类，要么就拍成郎平传，但是又有拍集体故事的野心，可最后被场外因素搞得老女排都没有姓名，让人心里很不爽。', 3, 'nana', '2020-09-24 08:34:29');
INSERT INTO `comment` VALUES (6, '一部把结局写在片名的电影。看之前大家都已经知道最终我们夺冠了，但是陈可辛想让我们看到的，是30多年来女排姑娘们背后的心酸和来之不易。拍第一次夺冠时我真的眼泪都到眼眶里了。导演找来郎平的女儿白浪来演年轻时的郎平，后半段几乎就是现实中的奥运阵容，全员演技超水平发挥，巩俐更是让你觉得她就是郎平本人。全片刚柔并济，展现出了中国女排的气魄。真心期待在今年东京奥运会上再夺冠军！', 5, '阿朱', '2020-09-23 12:15:11');
INSERT INTO `comment` VALUES (7, '还是疯狂地输出、廉价地煽情，只是停留在空喊口号上，只会借助体育本身的剧本张力来带动情绪。有些场景太失真，最后是不知道如何结尾了吗？', 2, 'double', '2020-09-23 22:56:57');
INSERT INTO `comment` VALUES (8, ' 迄今为止中国最好的体育电影，能不能被超越，就看《李娜》的了。开场40分钟了，以为不过是一碗鸡汤，但到后期渐入佳境，露出锋芒。知道片子为什么要改名了，不如叫《郎平传》。复刻的三场比赛选择的很妙，有输有赢，又不完全是决赛，三战封神又见人。', 5, 'senna', '2020-09-22 10:00:26');
INSERT INTO `comment` VALUES (9, '和脑海中所想象的完全吻合分毫不差，换言之，是一部被民众想象与民族期望绊住的电影。“无路可退”本是电影的题眼，前半程暗指挣脱物质匮乏，后半程靠近抛弃精神压抑，但无法明说无法深谈。眼神和身体足够强悍，更倾向于瞬时的捕捉而非常态的构建，相较之下语言则显得苍白，无论是赛前鼓舞、赛事解说还是赛后感慨，都不如沉默更加有力。', 3, '嘟嘟熊之父', '2020-09-24 22:10:46');
INSERT INTO `comment` VALUES (10, '总体过于冗长，个人戏份太多了，叫《郎平传》更合适，中国女排在我看来应该是几代人一个大集体，而不是某个很突出的个人，比赛戏挺燃的，算是亮点', 3, 'xkc1117', '2020-09-25 19:35:15');
INSERT INTO `comment` VALUES (11, '叫《夺冠》也可叫《郎平》，巩俐四个字：君临天下。和之前《中国合伙人》类似，找真实存在的社会名人，让演员用适当的方法派表演还原其神态和举止，再从主角半生经历扩展时代变迁，从“成功中国人”里提炼出“普遍中国人”，这类电影，华语可追溯到《跛豪》。还是典型陈可辛式的反戏剧，巩俐一代巨星却只演半部好戏，和《亲爱的》前面一小时主要剧情危急解除后赵薇才出场是相同的。另外这还是一部成功使用非专业演员的电影，有真人...', 4, '室内滂沱', '2020-09-25 00:24:16');
INSERT INTO `comment` VALUES (12, '最好的中国体育电影，很燃，止不住的抹泪。\n巩俐真的演活了“铁榔头”郎平，霸气又柔情、赤城又坦然；而黄渤也极尽真挚地将陈忠和一角拿捏得恰到好处；吴刚饰演的来自神界的魔鬼教练对中国女排燃爆的训练简直比爆裂鼓手还要爆裂。当然，女排群像无疑是不折不扣的主角，在数场历史性比赛中，她们是绝对焦点。她们选择投身女排，既不是为了爸妈，也不是要成为别人，而是为了真正对得起自己。\n球场上，女排队员抛头颅洒热血，每一声...', 5, '杨德青   ོ', '2020-09-24 12:06:47');
INSERT INTO `comment` VALUES (13, '一边要求电影必须还原，一边拒绝太写实要电影表达，观众情感和电影评析高度矛盾。这是在狭路上的陈可辛。但是依然拍出了中国目前最高水平的体育电影，至少目前，没有之一。换了谁都不能比夺冠更好，不能更拍出中国女排。', 5, '不吃葱', '2020-09-25 13:06:18');
INSERT INTO `comment` VALUES (14, '人物没立起来。太悬浮了。个人不咋喜欢', 3, '胸柿', '2020-09-25 21:33:42');
INSERT INTO `comment` VALUES (15, '（春节前点映版）题材本身拍摄难度巨大，也的确适合陈可辛这样勤恳规矩的“好学生”来拍，不出差错也看不到丝毫惊喜。对影片的失望和删改关系不大，除了陈可辛的问题，巩俐用全程扑克脸演绎的这个郎平，真的很难让人认可。', 3, '凹凸', '2020-09-24 21:16:37');
INSERT INTO `comment` VALUES (16, '二刷时，再一次被郎平的人格魅力打动，被女排的拼搏精神所感染，紧张刺激的比赛画面，仿佛在看奥运直播，心悬在嗓子眼。真正的体育电影，是对体育精神的终极追求，“你为什么打排球？”\n陈可辛最难能可贵的，是后半程抛出了这个设问，超越了集体回忆和感动泪水，汇入了新时代的自信从容。八十年代的质感复原得很到位，老女排的拼搏精神在吴刚、彭昱畅、白浪和一众女排姑娘的演绎下，又燃又令人钦佩。而新千年的中国女排则在巩俐和...', 5, 'Luc', '2020-09-23 23:13:48');
INSERT INTO `comment` VALUES (17, '体育电影热血青春！几场比赛看得非常燃！紧张刺激感动万分，当然主线还是郎平，运动员和教练身份作为影片的分水岭。这更改后的片名感觉和影片里呈现的朗平欲言又止的表达思想相违和，and全片都没有提到黄渤角色的名字，老牌女排也只有郎平有姓名，新女排倒是个个本色出演名字特别整齐！', 5, '落隐落闲', '2020-09-24 14:02:53');
INSERT INTO `comment` VALUES (18, '比想象中好。平行剪辑剪得淋漓畅快，节奏行云流水。女排真实队员演技也不俗，不错！ 当年机场的速溶咖啡苦如药，如今机场的瑞幸咖啡香饽饽；当年国人为女排精神振奋上街摇旗呐喊，如今哪儿还有这份狂热与躁动？陈可辛点题点到了关键，使得后半段猛于前半段。结局收尾得恰到好处，简单、有力量！最后王菲+那英的片尾曲动听极了！ （彭昱畅被黑得好惨…哈哈，也很可爱~）', 4, '科林', '2020-09-23 23:01:37');
INSERT INTO `comment` VALUES (19, '从合伙人、亲爱的，再到这部夺冠，陈可辛越来越匠气了，准确、平稳，能获得一定的情感认同，但却毫无惊喜，而且愈发以情绪作为主导，彻底拥抱主旋律，郎平身上能深挖的点那么多，最后呈现的浮皮潦草，无论是对巩俐的表演，还是梅林茂的配乐、余静萍的摄影，都是一种浪费。', 3, '一口大井子', '2020-09-25 01:10:52');
INSERT INTO `comment` VALUES (20, '5/10，任何认为这部把比赛部分拍的好看的都只能证明这个人压根就没看过排球比赛。说句不好听的，随便拉一场真的排球比赛都比这拍的好看。陈可辛说这电影很难拍说的没错，不过我也很佩服这电影居然能拍的没有任何节奏。', 3, '童年末日', '2020-09-25 21:10:08');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'douban', 'comment');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-11-04 13:01:33.104544');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-11-04 13:01:33.385807');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-11-04 13:01:34.142041');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-11-04 13:01:34.314560');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-11-04 13:01:34.331377');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-11-04 13:01:34.499318');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-11-04 13:01:34.596224');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-11-04 13:01:34.703031');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-11-04 13:01:34.718627');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-11-04 13:01:34.815386');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-11-04 13:01:34.824101');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-11-04 13:01:34.846096');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-11-04 13:01:34.951775');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-11-04 13:01:35.059305');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-11-04 13:01:35.179571');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-11-04 13:01:35.205689');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2020-11-04 13:01:35.281380');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('lf77mec38rkxxx4t8u9xah3335kizony', 'MmFhMDJiMTFkZmE3MTAxYWIwNzc1MzM3YzY5MThkMTM2NDFhZGYwZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOGM1MThhN2EyNjEyYzc1YWRjY2VhYTgxOGM3ZWQ4ZTgxZjYzMWZhIn0=', '2020-11-18 13:20:36.162191');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (1, 'lqh', 60, 1);
INSERT INTO `student` VALUES (2, 'cs', 99, 1);
INSERT INTO `student` VALUES (3, 'wzy', 60, 1);
INSERT INTO `student` VALUES (4, 'zqc', 88, 2);
INSERT INTO `student` VALUES (5, 'bll', 100, 2);
COMMIT;

-- ----------------------------
-- Procedure structure for idata
-- ----------------------------
DROP PROCEDURE IF EXISTS `idata`;
delimiter ;;
CREATE PROCEDURE `test`.`idata`()
begin
declare i int;
set i=1;
while(i<=100000)do
insert into t values(i, i, i);
set i=i+1;
end while;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
