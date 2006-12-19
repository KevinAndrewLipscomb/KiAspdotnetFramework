-- $Id$
--
-- phpMyAdmin SQL Dump
-- version 2.6.4-pl4
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jun 11, 2006 at 06:56 PM
-- Server version: 5.0.20
-- PHP Version: 4.4.2

SET FOREIGN_KEY_CHECKS=0;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- 
-- Database: `kiaspdotnetframeworkdb`
-- 

-- 
-- Dumping data for table `kind3_user`
-- 

INSERT INTO `kind3_user` (`id`, `encoded_password`, `be_stale_password`, `password_reset_email_address`, `be_active`) VALUES 
(1, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(2, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(3, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(4, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(5, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(6, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(7, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(8, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(9, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1),
(10, sha('kind3pass'), 0, 'kevin.lipscomb@kvrs.org', 1);

--
-- Dumping data for table `kind2_role`
--

INSERT INTO `kind2_role` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 5),
(4, 3, 4),
(5, 4, 3),
(6, 1, 6),
(7, 2, 6);

--
-- Dumping data for table `kind2_user`
--

INSERT INTO `kind2_user` (`id`, `encoded_password`, `be_stale_password`, `password_reset_email_address`, `be_active`) VALUES
(1, sha('regionpass'), 0, 'finances@kvrs.org', 1),
(2, sha('regionpass'), 0, 'finances@kvrs.org', 1),
(3, sha('regionpass'), 0, 'finances@kvrs.org', 1),
(4, sha('regionpass'), 0, 'finances@kvrs.org', 1);


-- 
-- Dumping data for table `kind1_user`
-- 

INSERT INTO `kind1_user` (`id`, `encoded_password`, `be_stale_password`, `password_reset_email_address`, `be_active`) VALUES 
(1, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(2, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(3, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(4, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(5, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(6, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(7, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(8, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(9, sha('kind1pass'), 0, 'infotech@kvrs.org', 1),
(10, sha('kind1pass'), 0, 'infotech@kvrs.org', 1);


SET FOREIGN_KEY_CHECKS=1;

COMMIT;