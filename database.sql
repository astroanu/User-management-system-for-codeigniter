-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 19, 2012 at 05:32 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `ci_user_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loggedin_users`
--

CREATE TABLE IF NOT EXISTS `tbl_loggedin_users` (
  `tbl_loggedin_users_id` int(11) NOT NULL AUTO_INCREMENT,
  `loggedusername` varchar(45) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `useragent` text NOT NULL,
  `lastactivity` int(20) DEFAULT NULL,
  `online` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tbl_loggedin_users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE IF NOT EXISTS `tbl_messages` (
  `tbl_messages_id` int(11) NOT NULL AUTO_INCREMENT,
  `senderid` int(11) NOT NULL,
  `receiverid` int(11) NOT NULL,
  `message` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `read` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tbl_messages_id`),
  KEY `senderid` (`senderid`),
  KEY `receiverid` (`receiverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pictures`
--

CREATE TABLE IF NOT EXISTS `tbl_pictures` (
  `tbl_pictures_id` int(11) NOT NULL AUTO_INCREMENT,
  `picid` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` text,
  `ownerid` int(11) NOT NULL,
  `privacy` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbl_pictures_id`),
  KEY `fk_tbl_pictures_tbl_picture_comments` (`picid`),
  KEY `ownerid` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_picture_comments`
--

CREATE TABLE IF NOT EXISTS `tbl_picture_comments` (
  `tbl_picture_comments_id` int(11) NOT NULL AUTO_INCREMENT,
  `pictureid` int(11) NOT NULL,
  `commentbody` varchar(45) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `ownerid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `web` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `dislike` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbl_picture_comments_id`),
  KEY `pictureid` (`pictureid`),
  KEY `ownerid` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `tbl_users_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activationkey` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `secondname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `dateofbirth` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interests` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profileprivacy` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accountactive` int(11) DEFAULT NULL,
  `accountblocked` int(11) DEFAULT NULL,
  `registereddate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastloggenindate` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appearonline` int(11) DEFAULT NULL,
  `userlvl` int(1) NOT NULL,
  PRIMARY KEY (`tbl_users_id`),
  KEY `fk_tbl_users_tbl_pictures1` (`tbl_users_id`),
  KEY `fk_tbl_users_tbl_loggedin_users1` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD CONSTRAINT `tbl_messages_ibfk_1` FOREIGN KEY (`senderid`) REFERENCES `tbl_users` (`tbl_users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_messages_ibfk_2` FOREIGN KEY (`receiverid`) REFERENCES `tbl_users` (`tbl_users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pictures`
--
ALTER TABLE `tbl_pictures`
  ADD CONSTRAINT `tbl_pictures_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `tbl_users` (`tbl_users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_picture_comments`
--
ALTER TABLE `tbl_picture_comments`
  ADD CONSTRAINT `tbl_picture_comments_ibfk_1` FOREIGN KEY (`pictureid`) REFERENCES `tbl_pictures` (`tbl_pictures_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_picture_comments_ibfk_2` FOREIGN KEY (`ownerid`) REFERENCES `tbl_users` (`tbl_users_id`) ON DELETE CASCADE ON UPDATE CASCADE;
