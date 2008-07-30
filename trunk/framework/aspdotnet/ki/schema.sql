-- $Id$

SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS journal;
CREATE TABLE IF NOT EXISTS journal (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` TIMESTAMP NOT NULL,
  actor VARCHAR(31) NOT NULL,
  action VARCHAR(2047) NOT NULL,
  PRIMARY KEY(`id`),
  INDEX actor (actor)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--
drop table if exists member;
create table if not exists member
  (
  id int unsigned AUTO_INCREMENT,
  `last_name` VARCHAR(31) NOT NULL,
  `first_name` VARCHAR(31) NOT NULL,
  `email_address` VARCHAR(255),
  `registration_code` VARCHAR(15),
  PRIMARY KEY  (id),
  INDEX `last_name` (`last_name`),
  INDEX `first_name` (`first_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert member (last_name,first_name,email_address,registration_code) values
("Administrator","Application","kiaspdotnetframework@frompaper2web.com","1");

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--
drop table if exists notification;
create table notification
  (
  id int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (`name`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `profile`
--
drop table if exists member;
create table member
  (
  id int unsigned AUTO_INCREMENT,
  user_id int unsigned,
  be_valid boolean NOT NULL default 0,
  PRIMARY KEY (id),
  UNIQUE KEY user_id (user_id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `privilege`
--
drop table if exists privilege;
create table privilege
  (
  id int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (`name`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert privilege set name = "send-quickmessages";

--
-- Table structure for table `role`
--
DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id int unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  tier_id TINYINT UNSIGNED,
  `soft_hyphenation_text` VARCHAR(127) NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY (`name`),
  KEY tier_id (tier_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO role (id,`name`,tier_id,`soft_hyphenation_text`) VALUES
(1,'Application Administrator',1,"Ap&shy;pli&shy;ca&shy;tion Ad&shy;min&shy;is&shy;tra&shy;tor");

--
-- table structure for table `role_member_map`
--
DROP TABLE IF EXISTS role_member_map;
CREATE TABLE role_member_map (
  member_id int unsigned NOT NULL,
  role_id int unsigned NOT NULL,
  PRIMARY KEY  (member_id,role_id),
  KEY role_id (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `role_notification_map`
--
DROP TABLE IF EXISTS role_notification_map;
CREATE TABLE role_notification_map (
  role_id int unsigned NOT NULL,
  notification_id int unsigned NOT NULL,
  PRIMARY KEY  (role_id,notification_id),
  KEY privilege_id (notification_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `role_privilege_map`
--
DROP TABLE IF EXISTS role_privilege_map;
CREATE TABLE role_privilege_map (
  role_id int unsigned NOT NULL,
  privilege_id int unsigned NOT NULL,
  PRIMARY KEY  (role_id,privilege_id),
  KEY privilege_id (privilege_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tier`
--
DROP TABLE IF EXISTS tier;
CREATE TABLE tier (
  id tinyint unsigned NOT NULL,
  name varchar(31) NOT NULL,
  PRIMARY KEY id (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user`
--   Framework-required info about user
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id int unsigned NOT NULL AUTO_INCREMENT,
  username char(40) NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password boolean NOT NULL default 1,
  password_reset_email_address varchar(255) NOT NULL,
  be_active boolean NOT NULL default 1,
  num_unsuccessful_login_attempts int unsigned NOT NULL default 0,
  last_login datetime default NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (username),
  UNIQUE KEY (password_reset_email_address)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- table structure for table `user_member_map`
--
DROP TABLE IF EXISTS user_member_map;
CREATE TABLE user_member_map (
  user_id int unsigned NOT NULL,
  member_id int unsigned NOT NULL,
  PRIMARY KEY  (user_id),
  UNIQUE KEY (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE role
  ADD CONSTRAINT tier_id FOREIGN KEY tier_id (tier_id) REFERENCES tier (id);

ALTER TABLE role_member_map
  ADD CONSTRAINT FOREIGN KEY (member_id) REFERENCES member (id),
  ADD CONSTRAINT FOREIGN KEY (role_id) REFERENCES role (id);

ALTER TABLE user_member_map
  ADD CONSTRAINT FOREIGN KEY (user_id) REFERENCES user (id),
  ADD CONSTRAINT FOREIGN KEY (member_id) REFERENCES member (id);


SET FOREIGN_KEY_CHECKS=1;

COMMIT;