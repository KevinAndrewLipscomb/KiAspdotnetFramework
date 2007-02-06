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

--
-- kind1
--
drop table if exists kind1;
create table kind1
  (
  id int unsigned NOT NULL,
  name varchar(63) NOT NULL,
  be_valid_profile boolean NOT NULL default 0,
  PRIMARY KEY  (id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- kind2
--
drop table if exists kind2;
create table kind2
  (
  id int unsigned NOT NULL,
  name varchar(63) NOT NULL,
  be_valid_profile boolean NOT NULL default 0,
  PRIMARY KEY  (id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- kind3
--
drop table if exists kind3;
create table kind3
  (
  id int unsigned NOT NULL,
  name varchar(63) NOT NULL,
  be_valid_profile boolean NOT NULL default 0,
  PRIMARY KEY  (id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind1_user;
CREATE TABLE kind1_user (
  id int unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password boolean NOT NULL default 1,
  password_reset_email_address varchar(255) NOT NULL,
  be_active boolean NOT NULL default 1,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind2_group;
CREATE TABLE kind2_group (
  id int unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind2_role;
CREATE TABLE kind2_role (
  id int unsigned NOT NULL auto_increment,
  user_id int unsigned NOT NULL,
  group_id int unsigned NOT NULL,
  PRIMARY KEY  (id),
  KEY user_id (user_id),
  KEY group_id (group_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind2_user;
CREATE TABLE kind2_user (
  id int unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password boolean NOT NULL default 1,
  password_reset_email_address varchar(255) NOT NULL,
  be_active boolean NOT NULL default 1,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind3_user;
CREATE TABLE kind3_user (
  id int unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password boolean NOT NULL default 1,
  password_reset_email_address varchar(255) NOT NULL,
  be_active boolean NOT NULL default 1,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `kind1_user`
  ADD CONSTRAINT kind1_user_ibfk_1 FOREIGN KEY (id) REFERENCES kind1 (id);

ALTER TABLE `kind2_role`
  ADD CONSTRAINT kind2_role_ibfk_1 FOREIGN KEY (user_id) REFERENCES kind2_user (id),
  ADD CONSTRAINT kind2_role_ibfk_2 FOREIGN KEY (group_id) REFERENCES kind2_group (id);

ALTER TABLE `kind2_user`
  ADD CONSTRAINT kind2_user_ibfk_1 FOREIGN KEY (id) REFERENCES kind2 (id);

ALTER TABLE `kind3_user`
  ADD CONSTRAINT kind3_user_ibfk_1 FOREIGN KEY (id) REFERENCES kind3 (id);

SET FOREIGN_KEY_CHECKS=1;

COMMIT;