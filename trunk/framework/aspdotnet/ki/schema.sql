-- $Id$

SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;

DROP TABLE IF EXISTS kind1_user;
CREATE TABLE kind1_user (
  id tinyint(3) unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password tinyint(1) NOT NULL default '1',
  password_reset_email_address varchar(255) NOT NULL,
  be_active tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind2_group;
CREATE TABLE kind2_group (
  id smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(63) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind2_role;
CREATE TABLE kind2_role (
  id smallint(5) unsigned NOT NULL auto_increment,
  user_id smallint(5) unsigned NOT NULL,
  group_id smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (id),
  KEY user_id (user_id),
  KEY group_id (group_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind2_user;
CREATE TABLE kind2_user (
  id smallint(5) unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password tinyint(1) NOT NULL default '1',
  password_reset_email_address varchar(255) NOT NULL,
  be_active tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS kind3_user;
CREATE TABLE kind3_user (
  id smallint(5) unsigned NOT NULL,
  encoded_password char(40) default NULL,
  be_stale_password tinyint(1) NOT NULL default '1',
  password_reset_email_address varchar(255) NOT NULL,
  be_active tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `kind1_user`
  ADD CONSTRAINT kind1_user_ibfk_1 FOREIGN KEY (id) REFERENCES parent1 (`code`);

ALTER TABLE `kind2_role`
  ADD CONSTRAINT kind2_role_ibfk_1 FOREIGN KEY (user_id) REFERENCES kind2_user (id),
  ADD CONSTRAINT kind2_role_ibfk_2 FOREIGN KEY (group_id) REFERENCES kind2_group (id);

ALTER TABLE `kind2_user`
  ADD CONSTRAINT kind2_user_ibfk_1 FOREIGN KEY (id) REFERENCES parent2 (id);

ALTER TABLE `kind3_user`
  ADD CONSTRAINT kind3_user_ibfk_1 FOREIGN KEY (id) REFERENCES parent3 (id);

SET FOREIGN_KEY_CHECKS=1;

COMMIT;