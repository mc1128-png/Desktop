DROP TABLE IF EXISTS `registered_user`;
CREATE TABLE `registered_user`(
	   `registered_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '注册用户ID',
`user_name` varchar(64) NOT NULL UNIQUE comment '用户名',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (registered_user_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '注册用户';

DROP TABLE IF EXISTS `word_classification`;
CREATE TABLE `word_classification`(
	   `word_classification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词分类ID',
`word_category` varchar(64) comment '单词类别',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (word_classification_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '单词分类';
insert into `word_classification` values (1,'单词类别1','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `word_classification` values (2,'单词类别2','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `word_classification` values (3,'单词类别3','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `word_classification` values (4,'单词类别4','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `word_classification` values (5,'单词类别5','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `word_classification` values (6,'单词类别6','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `word_classification` values (7,'单词类别7','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `word_classification` values (8,'单词类别8','0','2022-10-20 11:45:53','2022-10-20 11:45:53');

DROP TABLE IF EXISTS `encyclopedia_of_words`;
CREATE TABLE `encyclopedia_of_words`(
	   `encyclopedia_of_words_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词大全ID',
`word` varchar(64) comment '单词',
`interpretation` varchar(64) comment '释义',
`pronunciation` varchar(255) comment '读音',
`picture` varchar(255) comment '图片',
`word_category` varchar(64) comment '单词类别',
`memory_skills` text comment '记忆技巧',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

	   PRIMARY KEY (encyclopedia_of_words_id)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '单词大全';
insert into `encyclopedia_of_words` values (1,'单词1','释义1','点此播放','点此播放','单词类别1','记忆技巧1','48','933','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `encyclopedia_of_words` values (2,'单词2','释义2','点此播放','点此播放','单词类别2','记忆技巧2','182','931','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `encyclopedia_of_words` values (3,'单词3','释义3','点此播放','点此播放','单词类别3','记忆技巧3','391','990','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `encyclopedia_of_words` values (4,'单词4','释义4','点此播放','点此播放','单词类别4','记忆技巧4','104','105','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `encyclopedia_of_words` values (5,'单词5','释义5','点此播放','点此播放','单词类别5','记忆技巧5','666','546','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `encyclopedia_of_words` values (6,'单词6','释义6','点此播放','点此播放','单词类别6','记忆技巧6','580','839','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `encyclopedia_of_words` values (7,'单词7','释义7','点此播放','点此播放','单词类别7','记忆技巧7','824','526','0','2022-10-20 11:45:53','2022-10-20 11:45:53');
insert into `encyclopedia_of_words` values (8,'单词8','释义8','点此播放','点此播放','单词类别8','记忆技巧8','329','155','0','2022-10-20 11:45:53','2022-10-20 11:45:53');

DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='临时访问牌';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2',"2022-01-14 07:32:09.000 ","2022-01-14 07:32:09.000 ",'1');
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章频道：用于汇总浏览文章，在不同频道下展示不同文章。';

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏：';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论：';
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '论坛id',
  `display` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `praise_len` int(10) unsigned DEFAULT '0' COMMENT '点赞数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(125) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  `img` text COMMENT '封面图',
  `content` longtext COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '发帖人头像：',
  `type` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '论坛分类：[0,1000]用来搜索指定类型的论坛帖',
  PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='论坛：';
insert into `forum` values ('1','100','1','小明','0','149','测试标题','关键字1','描述','#','标签','/static/img/img_temp.jpg','<h1>fafgwagbagbwgwag</h1>',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'http://localhost:5000/upload/jingdian (11)_15.jpg','0');
insert into `forum` values ('2','100','2','小明','0','30','测试标题2','关键字2','dec','#','标签','/static/img/img_temp.jpg','测试文章内容2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",null,'0');
insert into `forum` values ('3','100','2','小红','0','42','测试标题3','关键字3','dec2','#','标签','/static/img/img_temp.jpg','测试文章内容3',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",null,'0');
insert into `forum` values ('4','100','2','小红','0','22','测试标题4','关键字4','dec3','#','标签','/static/img/img_temp.jpg','测试文章内容4',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",null,'0');
DROP TABLE IF EXISTS `forum_type`;
CREATE TABLE `forum_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类图标：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='论坛频道：用于汇总浏览论坛，在不同频道下展示不同论坛。';
insert into `forum_type` values ('1','休闲','描述','/article/list?type_id=1','0',null,"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `forum_type` values ('2','娱乐','企业信息描述描述描述描述','/article/list?type_id=2','0',null,"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `forum_type` values ('3','开心','操作帮助描述描述描述','/article/list?type_id=3','0',null,"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告：';
insert into `notice` values ('1','公告标题1','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `notice` values ('2','公告标题2','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `notice` values ('3','公告标题3','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `notice` values ('4','公告标题4','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞：';
insert into `praise` values ('2','1',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('25','5',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','9','1');
insert into `praise` values ('26','5',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('27','5',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('44','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'forum','forum_id','2','1');
insert into `praise` values ('50','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'forum','forum_id','2','1');
insert into `praise` values ('54','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','9','1');
insert into `praise` values ('57','0',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','10','1');
insert into `praise` values ('86','0',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','6','1');
insert into `praise` values ('101','7',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','7','1');
insert into `praise` values ('108','2',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','8','1');
insert into `praise` values ('221','0',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ",'article','article_id','2','1');
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图：';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员',"2022-04-30 12:03:25.000 ",null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/avatar.jpg',"2022-05-19 07:32:09.000 ");
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam` (
  `exam_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '考试id',
  `name` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '考试名称：[2,32]',
  `duration` int(11) DEFAULT NULL COMMENT '答题时长',
  `score` double(8,2) DEFAULT NULL COMMENT '总分',
  `status` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '状态：启用、禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='考试';
insert into `exam` values ('1','计算机基础考试','60','100','启用',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `exam` values ('2','大学语文','90','120','启用',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `exam` values ('3','C语言考试','70','100','禁用',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question` (
  `exam_question_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '类型',
  `title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '题目',
  `question_item` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '选项',
  `answer` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '参考答案',
  `score` double(8,2) DEFAULT NULL COMMENT '总分',
  `question_order` int(11) DEFAULT NULL COMMENT '排序',
  `exam_id` mediumint(8) DEFAULT NULL COMMENT '所属试卷',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`exam_question_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
insert into `exam_question` values ('1','单选题','启动Word后，空白文档的文档名为（　　）。','A、untitled
B、文档1.DOC
C、新文档.DOC
D、我的文档.DOC','C、新文档.DOC','10','1','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('2','单选题','Word软件处理的主要对象是（　　）。','A、表格
B、文档
C、图片
D、数据','B、文档','10','2','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('3','单选题','当前活动窗口是文档dl.doc的窗口，单击该窗口的“最小化”按钮（　　）。','A、不显示dl.doc文档内容，但dl.doc文档并未关闭
B、dl.doc文档未关闭，且继续显示其内容
C、该窗口和dl.doc文档都被关闭
D、关闭了dl.doc文档但该窗口并未关闭','A、不显示dl.doc文档内容，但dl.doc文档并未关闭','10','3','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('4','多选题','文件或文件夹的属性一般有（　　）。','A、只读
B、隐藏
C、存档
D、系统','A、只读|B、隐藏','10','4','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('5','多选题','电子计算机根据外观可以分为（　　）。','A、巨型机
B、便携机
C、微型机
D、游戏机','A、巨型机|B、便携机|C、微型机','10','5','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('6','判断题','Word和Windows都是系统软件。','A、正确
B、错误','B、错误','5','6','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('7','判断题','ROM的是只读存储器。','A、正确
B、错误','A、正确','5','7','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('8','判断题','在存储器容量的表示中,1MB的含义是1024K个汉字。','A、正确
B、错误','B、错误','5','8','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('9','填空题','在Word文档中，每个段落都有自己的段落标记，段落标记的位置在______。','','段落的结尾处','10','9','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('10','填空题','能显示页眉和页脚的方式是______。','','页面视图','10','10','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('11','主观题','请简述一下计算机的工作原理？','','计算机最主要的工作原理是存储程序与程序控制','15','11','1',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('18','单选题','下列诗歌属于乐府旧题的有( )','A、《短歌行》
B、《饮酒》
C、《蛇》','A、《短歌行》','5','1','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('19','单选题','提倡“文章合为时而著，歌诗合为事而作”的唐代诗人是( )','A、韩愈
B、柳宗元
C、白居易','C、白居易','5','2','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('20','单选题','“甘其食，美其服，乐其俗”中的“甘”“美”“乐”属( )','A、使动词
B、意动词
C、名词','B、意动词','5','3','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('21','单选题','“功施到今”中“施”读作( )','A、yi
B、si
C、shi','A、yi','5','4','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('22','单选题','“回眸一笑百媚生，六宫粉黛无颜色”的作者是(  )','A、陆游
B、唐琬
C、白居易','C、白居易','5','5','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('23','多选题','《采薇》一诗的艺术特点是( )','A、反复咏叹
B、抒情和写景融为一体
C、起兴手法','A、反复咏叹|B、抒情和写景融为一体|C、起兴手法','10','6','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('24','多选题','“回眸一笑百媚生，六宫粉黛无颜色”运用的修辞手法有( )','A、夸张
B、对比
C、借代','A、夸张|B、对比|C、借代','10','7','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('25','多选题','不是《西厢记.长亭送别》一折戏的主角是( )','A、崔莺莺
B、张珙
C、红娘','C、红娘','10','8','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('26','填空题','《铸剑》属于____。','','小说','5','9','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('27','填空题','“对酒当歌，人生几何?”的作者是____。','','曹操','5','10','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('28','填空题','《诗经》中的“风”是____。','','国风','5','11','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('29','填空题','《采薇》是选自《诗经》的____。','','《小雅》','5','12','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('30','判断题','王维的《送梓州李使君》是一首赠别诗','A、正确
B、错误','A、正确','5','13','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('31','判断题','《乡愁》属于余秋雨的作品','A、正确
B、错误','B、错误','5','14','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('32','判断题','《雅舍》属于梁实秋的作品','A、正确
B、错误','A、正确','5','15','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('33','主观题','默写《短歌行》','','对酒当歌，人生几何！ 譬如朝露，去日苦多。 慨当以慷，忧思难忘。 何以解忧？唯有杜康。 青青子衿，悠悠我心。 但为君故，沉吟至今。 呦呦鹿鸣，食野之苹。 我有嘉宾，鼓瑟吹笙。 明明如月，何时可掇？ 忧从中来，不可断绝。 越陌度阡，枉用相存。 契阔谈讌，心念旧恩。 月明星稀，乌鹊南飞。 绕树三匝，何枝可依？ 山不厌高，海不厌深。 周公吐哺，天下归心。','15','16','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('34','主观题','分析王维的《送梓州李使君》是在什么时代背景下抒写的？体现了当时的社会环境是如何的？','','这是一首送别之作。具体创作时间不详，李使君当是初往梓州（治今四川三台）赴任，王维写此诗相赠。','15','17','2',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('35','单选题','以下选项中，不能作为合法常量的是______。','A、1.234e04
B、1.234e0.4
C、1.234e+4
D、1.234e0','B、1.234e0.4','5','1','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('36','单选题','以下符合C语言语法的实型常量是______。','A、1.2E0.5
B、3.14159E
C、.5E-3
D、E15','C、.5E-3','5','2','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('37','单选题','设int a=12，则执行完语句a+=a-=a*a后，a的值是______。','A、552
B、264
C、144
D、-264','D、-264','5','3','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('38','单选题','若要求在if后一对圆括号中表示a不等于0的关系,则能正确表示这一关系的表达式为______','A、a<>0
B、!a
C、a=0
D、a','D、a','5','4','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('39','单选题','已知有double型变量x=2.5,y=4.7,整型变量a=7,  则表达式 x+a%3*(int)(x+y)%2/4 的值是_______','A、2.4
B、2.5
C、2.75
D、0','B、2.5','5','5','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('40','判断题','一个C语言的执行是从本程序的第一个函数开始,到本程序的最后一个函数结束','A、正确
B、错误','B、错误','5','6','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('41','判断题','为了避免嵌套的if-else语句的二义性，C语言规定else总是与在其之前未配对的if组成配对关系.','A、正确
B、错误','B、错误','5','7','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('42','判断题','设x 、y 、z 、t均为int型变量,则执行以下语句后,t的值为1.  x=y=z=1;  t=++x || ++y && ++z;','A、正确
B、错误','A、正确','5','8','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('43','判断题','下面程序段的输出结果是输出错误信息.  x=3;  do { y=x--;  if (!y) {printf("*");continue;}  printf("#");  } while(x=2);','A、正确
B、错误','B、错误','5','9','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('44','判断题','下面程序段的运行结果是123.  int n=0;  while (n++<=2)  printf("%d",n);','A、正确
B、错误','A、正确','5','10','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('45','主观题','下面程序的运行结果是_______.  #include<stdio.h>  void main( )  { int a,b;  a=-1;  b=0;  do {  ++a;  ++a;  b+=a;  } while(a<9);  printf("%d
",b);  }','','25','8','11','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('46','主观题','以下函数的功能是：求x的y次方，请填空._______  #include<stdio.h>  void main()  { int i,x,y;  double z;  scanf("%d %d",&x,&y);  for(i=1,z=x;i<y;i++)  z=z*______ ;  printf("x^y=%e
",z);  }','','x','8','12','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('47','主观题','下面程序的输出结果是_____.  #include<stdio.h>  void main( )  { int i;  for(i=1;i<6;i++)  { if (i%2!=0) {printf("#");continue;}  printf("*");  }  printf("
");  }','','#*#*#','8','13','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('48','主观题','有如下程序  #include<stdio.h>  void main( )  { int n=9;  while(n>6) {n--;printf("%d",n);}  }  该程序段的输出结果是_____.','','876','8','14','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('49','主观题','阅读以下程序，程序运行后的输出结果是____.  #include<stdio.h>  void main( )  { int x;  for(x=5;x>0;x--)  if (x--<5) printf("%d,",x);  else printf("%d,",x++); }','','4,3,1','8','15','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
insert into `exam_question` values ('50','主观题','#include <stdio.h>  void main()  { int a[4][4]={{1,3,5,},{2,4,6},{3,5,7}};  printf("%d%d%d%d
",a[0][3],a[1][2],a[2][1],a[3][0]);  }，程序的输出结果是？','','0650','10','16','5',"2022-04-19 07:32:09.000 ","2022-04-19 07:32:09.000 ");
DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE `user_answer` (
  `user_answer_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `exam_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '考试id',
  `score` double(8,2) DEFAULT '0.00' COMMENT '分数',
  `answers` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '答案',
  `score_detail` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '评分详情',
  `objective_score` double(8,2) DEFAULT '0.00' COMMENT '客观题得分',
  `subjective_score` double(8,2) DEFAULT '0.00' COMMENT '主观题得分',
  `score_state` tinyint(2) DEFAULT '0' COMMENT '评分状态',
  `nickname` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '提交人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`user_answer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
insert into `user_answer` values ('1','1','2','100','[{"exam_question_id":12,"answer":"A.1"},{"exam_question_id":13,"answer":["A.1","B.5"]},{"exam_question_id":14,"answer":"A.正确"},{"exam_question_id":15,"answer":"挂号费"},{"exam_question_id":16,"answer":"发货的共和国"}]','[{"exam_question_id":12,"score":10},{"exam_question_id":13,"score":20},{"exam_question_id":14,"score":30},{"exam_question_id":15,"score":20},{"exam_question_id":16,"score":20}]','60','40','1','admin',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `user_answer` values ('2','1','1','75','[{"exam_question_id":1,"answer":"C、新文档.DOC"},{"exam_question_id":2,"answer":"B、文档"},{"exam_question_id":3,"answer":"A、不显示dl.doc文档内容，但dl.doc文档并未关闭"},{"exam_question_id":4,"answer":["B、隐藏","A、只读"]},{"exam_question_id":5,"answer":["A、巨型机","B、便携机","C、微型机"]},{"exam_question_id":6,"answer":"B、错误"},{"exam_question_id":7,"answer":"A、正确"},{"exam_question_id":8,"answer":"B、错误"},{"exam_question_id":9,"answer":"页面尾部"},{"exam_question_id":10,"answer":"页面尾部"},{"exam_question_id":11,"answer":"我也不知道呀"}]','[{"exam_question_id":1,"score":10},{"exam_question_id":2,"score":10},{"exam_question_id":3,"score":10},{"exam_question_id":4,"score":10},{"exam_question_id":5,"score":10},{"exam_question_id":6,"score":5},{"exam_question_id":7,"score":5},{"exam_question_id":8,"score":5},{"exam_question_id":9,"score":0},{"exam_question_id":10,"score":10},{"exam_question_id":11,"score":0}]','65','10','1','admin',"2022-05-19 07:32:09.000 ","2022-05-19 07:32:09.000 ");
insert into `user_group` values ('1','100','管理员',null,'','','0',null,"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `user_group` values ('2','100','游客',null,'','','0','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `user_group` values ('3','100','注册用户',null,'registered_user','registered_user_id','0','3',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/upload/image_1644424236189.jpg','380',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/upload/image_1644424236188.jpg','56',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/upload/image_1644424236188.jpg','246',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `slides` values ('4','轮播图4','内容4','/article/details?article=4','/upload/image_1644424236181.jpg','789',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `slides` values ('5','轮播图5','内容5','/article/details?article=5','/upload/image_1644424236188.jpg','258',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `slides` values ('6','轮播图6','内容6','/article/details?article=6','/upload/image_1644424236188.jpg','761',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
insert into `article` values ('1','表演课堂™ 2021年课程推介会在南宁国际会展中心隆重举行','课程','901','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p><strong>中国艺术科技研究所社会艺术水平考级中心少儿戏剧表演（课本剧)专业广西区考级委员会讯&nbsp;</strong>3月25号，由中国艺术科技研究所社会艺术水平考级（课本剧）考务中心主办，中国艺术科技研究所社会艺术水平考级中心“少儿戏剧表演（课本剧）专业”广西考级委员会承办的——表演课堂™2021年课程推介会在南宁国际会展中心顺利举行。表演课堂™戏剧表演课程自研发面世以来，得到了中国影视艺术行业联盟教育委员会和中国表演艺术测评中心的认可与支持，本次课程推介会有表演课堂™全国市场负责人陈辰，中国舞蹈家协会会员、广西舞蹈家协会副主席覃海，中国艺术科技研究所社会艺术水平考级（课本剧）考务中心主任王岳，中国艺术科技研究所全国社会艺术水平考级考务中心副主任、中国影视艺术行业协会教育委员会委员徐婕，中国影视艺术行业协会教育委员会委员、中国艺术科技研究所课本剧社会艺术水平考级官闻枫等嘉宾隆重出席。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/gx/transform/162/w550h412/20210326/6929-kmvwsvy0714721.jpg"></p><p><a href="http://saxn.sina.com.cn/click?type=bottom&amp;t=UERQUzAwMDAwMDA1NjE3MA%3D%3D&amp;url=http%3A%2F%2Fweibo.com%2F3583545095&amp;sign=4040d8f7d5170a8e" rel="noopener noreferrer" target="_blank" style="color: rgb(51, 51, 51);"><img src="http://d1.sina.com.cn/201609/07/1431636.jpg" alt="广告"></a></p><p>在观众和媒体朋友共同见证下，表演课堂™总部为广西考级委员会进行了现场授牌仪式，表演课堂™项目在广西正式落地。此后专家还邀请到场参会的老师和小朋友们上台，通过戏剧游戏对表演课堂™的内容进行了课堂展示，老师引导舞台上的小朋友们自我介绍，引入《我是总指挥》、《你看起来很好吃》等小游戏，初步引导孩子们进行角色扮演，闻枫老师带领孩子们们发挥想象力，投入到游戏中去，寓教于乐，使他们在扮演角色“恐龙蛋”的过程中感受戏剧的乐趣。几轮游戏结束，快速拉近老师与小朋友的距离，减少对舞台的恐惧，再次进行自我介绍时，已然与初上台时的羞涩形成鲜明的对比，放开自我，自信表达，让在场观众更近距离的直观感受教材的魅力，充分调动了大家深入了解表演课堂™的积极性。播放和讲解中级公开课视频后，徐婕老师开展了戏剧教育相关专题讲座，紧扣现今社会“美育”焦点，向大家进行了戏剧教育的多层次介绍，从专业的角度解析课程，精彩的教程视频和演讲赢得台下热烈的掌声。会后还有表演课堂™北京总部专家延展了对品牌及教材的现场问答，为老师家长们进行解疑答惑，减轻大家对教材的疑虑，增强对品牌方之间的信任，进而举行了教材加盟签约仪式。推介会到此圆满结束。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/gx/transform/94/w550h344/20210326/6963-kmvwsvy0715529.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/gx/transform/132/w550h382/20210326/86c7-kmvwsvy0716951.png"></p><p>在此次活动中，表演课堂™利用现场游戏开展综合性教育，向到场来宾展示了美育、戏剧、表演等多方面共融的新型舞台展现模式，从声、台、形、表多个方面充分挖掘孩子的潜能，<span style="color: black;">让孩子更好的面向大众，逐渐认识自己、肯定自己，更好的适应社会、建立价值，为在</span>场的老师、家长打造了一场别开生面的舞台展示，得到了现场嘉宾观众的一致认可。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/gx/transform/162/w550h412/20210326/c479-kmvwsvy0717958.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('2','特色课堂，快乐学习|东昌府区斗虎屯镇阮庄小学特色课程开课啦','课程','575','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/378/w230h148/20210326/a216-kmvwsvy1511911.jpg"></p><p>学校教育不仅是知识的学习，更要注重学生德智体美劳全面发展，因此对学生兴趣爱好的发展成为当下素质教育的一个主要着力点。东昌府区斗虎屯镇阮庄小学的特色课程秉承素质教育基本理念，从多方面入手发掘学生潜质，力争使学生成为新时代的优秀继承人。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/cfa0-kmvwsvy1511914.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/c695-kmvwsvy1512289.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/80/w720h960/20210326/d2d3-kmvwsvy1512290.jpg"></p><p>《橡皮泥手工制作》是孩子们最喜爱的课程之一。在老师的指导下，孩子们放飞想象力和动手能力，塑造出一个个创意无限、色彩鲜艳的手工作品。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/1288-kmvwsvy1512672.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/767e-kmvwsvy1512669.jpg"></p><p>操场上，一根根彩绳在阳光下飞舞，激情洋溢的同学们动作刚劲有力。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/5fb2-kmvwsvy1513058.jpg"></p><p>舞台上，优美的舞姿尽情释放，让它变得更加光彩夺目，魅力四射。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/80/w720h960/20210326/99bc-kmvwsvy1513060.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('3','东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动开展','课程','983','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/713/w428h285/20210328/2751-kmvwsvy9134947.jpg"></p><p>根据东营市教科院安排，更好的推进新课程实施，促进课堂教学改革和发展，引领东营市青年骨干教师快速成长，3月26日，东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动在陈庄镇中学开展。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/400/w720h480/20210328/899c-kmvwsvy9134951.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('4','东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动开展','课程','883','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/713/w428h285/20210328/2751-kmvwsvy9134947.jpg"></p><p>根据东营市教科院安排，更好的推进新课程实施，促进课堂教学改革和发展，引领东营市青年骨干教师快速成长，3月26日，东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动在陈庄镇中学开展。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/400/w720h480/20210328/899c-kmvwsvy9134951.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('5','东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动开展','课程','533','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/713/w428h285/20210328/2751-kmvwsvy9134947.jpg"></p><p>根据东营市教科院安排，更好的推进新课程实施，促进课堂教学改革和发展，引领东营市青年骨干教师快速成长，3月26日，东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动在陈庄镇中学开展。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/400/w720h480/20210328/899c-kmvwsvy9134951.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('6','山大附中奥体中路学校推出剪纸课程','课程','359','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p>齐鲁晚报·齐鲁壹点记者 潘世金 通讯员 周晗</p><p>为进一步贯彻落实基础教育改革与发展的相关要求，发挥校本课程的育人作用，山大附中奥体中路学校积极参与了山东省优秀校本课例的征集与遴选。经过专家评审，教师乜洪梅的校本课例《有趣的剪刻纸》荣获山东省校本课程优秀设计案例。</p><p>山东山大基础教育集团积极促进学习方式的变革，关注每一名学生的个性发展和健康成长。在幸福奥中的沃土上，学校教师积极探索校本课程，引领学生快乐成长，学校真正成为了“教师发展的沃土，学生成长的乐园。”</p><p class="ql-align-center">在幸福奥中的校园里，教师牵着孩子的手做课程已成为常态。《剪纸》《趣味科学小实验》《健美操》《超脑麦斯》《古文新演》《乐理与音乐欣赏》《多彩插画》《英语绘本》《玩转编程世界》《古诗词学社》《少儿财经》《“小桔灯”趣味习作》《丰人物语》等诸多个性化课程应运而生，极具特色的奥中剧团、奥中民乐团也在各项活动中大放异彩！<img src="http://n.sinaimg.cn/sinakd2021325s/453/w720h533/20210325/481a-kmvwsvx9673324.png">剪纸作为“人类非物质文化遗产”，是中国优秀传统文化中重要的文化之一，具有非常广泛的群众基础，它是全国各族人民社会生活的交融，传承了特有的视觉形象和造型格式，具有认知、教化、表意、抒情、娱乐、交往等多重社会价值。</p><p class="ql-align-center">为培养学生对非遗文化的热爱，我校进行课程研究并开设了《有趣的剪刻纸》这一校本课程。本课程面向小学中高年级学生，学生通过剪纸和刻纸，能深切地感受中国民间艺术的魅力，深刻地理解中国民间传统文化，还能养成良好的行为习惯和人文精神。<img src="http://n.sinaimg.cn/sinakd2021325s/455/w720h535/20210325/5e89-kmvwsvx9673322.png">本课程共分为三个单元：邂逅剪纸艺术。学生初次了解剪纸艺术形式，欣赏剪纸作品，体会其独特的艺术魅力。百变“纸”造型。以不同的折纸方式为主线，学生通过合作探究的方式，欣赏、临摹并简单创作寄托美好寓意的剪纸作品。记录“剪”影生活。尝试进行主题性剪纸和套色剪纸创作。</p><p>《有趣的剪刻纸》课程评价注重主体性、多元性、过程性和发展性，该评价可以全方位的关注每一位学生自身的发展过程，并将过程性评价和总结性评价相结合。教师设计的“小小剪纸艺术家的足迹”评价表，将评价的主动权交给学生，学生的积极性非常高！</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021325s/80/w373h507/20210325/ed43-kmvwsvx9673395.png"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021325s/740/w422h318/20210325/773f-kmvwsvx9673394.png"></p><p class="ql-align-center"><br></p><p><span style="color: rgb(77, 79, 83);">自2017年开始至今，《有趣的剪刻纸》在校内组织过《我是中国好少年》、《十二生肖》、《民俗故事》等多次展览，受到家长、师生的一致好评。</span></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021325s/441/w714h527/20210325/f0ed-kmvwsvx9673456.png"></p><p class="ql-align-center"><br></p><p><span style="color: rgb(77, 79, 83);">《有趣的剪刻纸》校本课程的开设，深度符合集团“共享生命成长”的教育理念。该课程不仅让孩子成为学习的主人，也给老师带来了挑战和喜悦，“教育是个苦差事，但成果是甜美的，因为它丰富孩子的一生”。</span></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('7','特色课堂，快乐学习|东昌府区斗虎屯镇阮庄小学特色课程开课啦','课程','179','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/378/w230h148/20210326/a216-kmvwsvy1511911.jpg"></p><p>学校教育不仅是知识的学习，更要注重学生德智体美劳全面发展，因此对学生兴趣爱好的发展成为当下素质教育的一个主要着力点。东昌府区斗虎屯镇阮庄小学的特色课程秉承素质教育基本理念，从多方面入手发掘学生潜质，力争使学生成为新时代的优秀继承人。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/cfa0-kmvwsvy1511914.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/c695-kmvwsvy1512289.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/80/w720h960/20210326/d2d3-kmvwsvy1512290.jpg"></p><p>《橡皮泥手工制作》是孩子们最喜爱的课程之一。在老师的指导下，孩子们放飞想象力和动手能力，塑造出一个个创意无限、色彩鲜艳的手工作品。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/1288-kmvwsvy1512672.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/767e-kmvwsvy1512669.jpg"></p><p>操场上，一根根彩绳在阳光下飞舞，激情洋溢的同学们动作刚劲有力。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/5fb2-kmvwsvy1513058.jpg"></p><p>舞台上，优美的舞姿尽情释放，让它变得更加光彩夺目，魅力四射。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/80/w720h960/20210326/99bc-kmvwsvy1513060.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('8','特色课堂，快乐学习|东昌府区斗虎屯镇阮庄小学特色课程开课啦','课程','616','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/378/w230h148/20210326/a216-kmvwsvy1511911.jpg"></p><p>学校教育不仅是知识的学习，更要注重学生德智体美劳全面发展，因此对学生兴趣爱好的发展成为当下素质教育的一个主要着力点。东昌府区斗虎屯镇阮庄小学的特色课程秉承素质教育基本理念，从多方面入手发掘学生潜质，力争使学生成为新时代的优秀继承人。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/cfa0-kmvwsvy1511914.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/c695-kmvwsvy1512289.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/80/w720h960/20210326/d2d3-kmvwsvy1512290.jpg"></p><p>《橡皮泥手工制作》是孩子们最喜爱的课程之一。在老师的指导下，孩子们放飞想象力和动手能力，塑造出一个个创意无限、色彩鲜艳的手工作品。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/1288-kmvwsvy1512672.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/767e-kmvwsvy1512669.jpg"></p><p>操场上，一根根彩绳在阳光下飞舞，激情洋溢的同学们动作刚劲有力。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/460/w720h540/20210326/5fb2-kmvwsvy1513058.jpg"></p><p>舞台上，优美的舞姿尽情释放，让它变得更加光彩夺目，魅力四射。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021326s/80/w720h960/20210326/99bc-kmvwsvy1513060.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('9','济南三中“品格教育”特色校本课程助力提升核心素养','课程','146','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p>期待着，期待着，春暖花开之季，本学期品格校本课程如期而至。济南三中同学们兴奋地来到走班教室，学习自己心仪的校本课程。</p><p><a href="http://saxn.sina.com.cn/click?type=bottom&amp;t=UERQUzAwMDAwMDA0Nzc4NQ%3D%3D&amp;url=https%3A%2F%2Fs.weibo.com%2Fweibo%3Fq%3D%2523%25E6%2588%2591%25E7%259A%2584%25E5%25AE%25B6%25E4%25B9%25A1%25E6%259C%2589%25E7%2582%25B9%25E7%2594%259C%2523&amp;sign=c3e8b9933a50cc41" rel="noopener noreferrer" target="_blank" style="color: rgb(51, 51, 51);"><img src="http://n.sinaimg.cn/sd/d782a208/20190306/ShanDongXinWenZhengWenYe250x220HuaZhongHua01.jpg" alt="广告"></a></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/65ce-kmrcuma2826697.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/d7f0-kmrcuma2827099.jpg"></p><p>本学期，济南三中两校区共开设40多门基于提升学生核心素养的 “品格教育”特色校本课程，多层次的丰富校本课程极大地满足了同学们各种学习和求知需求，目的是让同学们学有所长，业有所精，切实提升学生的核心素养。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/556b-kmrcuma2828195.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/11f0-kmrcuma2828103.jpg"></p><p>同学们提前根据自己的特长、爱好、素养发展需求和职业取向进行在线抢课，有犹豫，有不舍，更多的还是兴奋。开设的校本课程中，有语数外、政史地的学科拓展课程，有充满实践特色的理化趣味实验，有突出学习力培养的学法指导课程，有快乐歌唱、篆刻、素描等艺术类课程，有创意思维、3D打印、信息编程、flash动画制作等科技类课程，还有中国精神之“四史教育”、中学生民典法、安全教育、传统文化等素养类课程。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/f106-kmrcuma2827580.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/ca74-kmrcuma2827620.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/2635-kmrcuma2827615.jpg"></p><p>教师们认真备课，提前候课，安全管理教学场地和设施，课程生动活泼，教学方法多样，知识性与趣味性充分融合，深受同学们的喜爱。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/fa4d-kmrcuma2828744.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/ceef-kmrcuma2828872.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/faab-kmrcuma2828787.jpg"></p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sd/transform/162/w550h412/20210323/e3d7-kmrcuma2828823.jpg"></p><p>济南三中“品格教育”特色校本课程的开设，充分突出适应学生终身发展和社会需要的必备品格和关键能力，满足学生全面又个性的发展需要，由道德品格特色课程和成就品格学术课程构成，以“爱国、守矩、诚信、友善、包容、节制、感恩、尽责、坚韧、乐学、尚美、创新”品格培育为目标，注重品格教育的内涵提升，将课程、教学、评价、管理及师生发展融为一体，努力打造基于学生核心素养提升的课程重构与创生层次的课程变革。</p>','','2022年05月23日 12:51 新浪网');
insert into `article` values ('10','东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动开展','课程','45','0',"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ",null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/713/w428h285/20210328/2751-kmvwsvy9134947.jpg"></p><p>根据东营市教科院安排，更好的推进新课程实施，促进课堂教学改革和发展，引领东营市青年骨干教师快速成长，3月26日，东营市初中、小学校本课程青年骨干教师重点培养对象选拔活动在陈庄镇中学开展。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd2021328s/400/w720h480/20210328/899c-kmvwsvy9134951.jpg"></p><p><br></p>','','2022年05月23日 12:51 新浪网');
insert into `article_type` values ('1','100','课程','0',null,null,null,"2022-10-20 03:45:54.000 ","2022-10-20 03:45:54.000 ");
