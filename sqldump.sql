Table: roots
Create Table: CREATE TABLE `roots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

       Table: titles
Create Table: CREATE TABLE `titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

       Table: features
Create Table: CREATE TABLE `features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_features_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

       Table: rootfeatures
Create Table: CREATE TABLE `rootfeatures` (
  `root_id` int(10) unsigned NOT NULL,
  `feature_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`root_id`,`feature_id`),
  KEY `index_rootfeatures_root` (`root_id`),
  KEY `index_rootfeatures_feature` (`feature_id`),
  CONSTRAINT `rootfeatures_feature_fk` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rootfeatures_root_fk` FOREIGN KEY (`root_id`) REFERENCES `roots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

       Table: roottitles
Create Table: CREATE TABLE `roottitles` (
  `root_id` int(10) unsigned NOT NULL,
  `title_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`root_id`,`title_id`),
  KEY `index_roottitles_root` (`root_id`),
  KEY `index_roottitles_title` (`title_id`),
  CONSTRAINT `roottitles_title_fk` FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `roottitles_root_fk` FOREIGN KEY (`root_id`) REFERENCES `roots` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

       Table: details
Create Table: CREATE TABLE `details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `feature_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_details_feature` (`feature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8
1 row in set (0.00 sec)