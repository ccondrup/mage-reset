-- Reset data for misc. Magento extensions
-- This will delete data - make sure you have backups!
-- Created by ccondrup for CCData.no

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8; -- Make sure to preserve Unicode characters outside Basic Multilingual Plane (Æ,ö, etc etc.)

-- Create a tmp table to hold the names of tables we want to service
DROP TEMPORARY TABLE IF EXISTS `tmp_trunctables`;
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_trunctables` (
  `tname` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- DIBS.eu Payment Gateway
INSERT INTO `tmp_trunctables` VALUES ('dibs_orderdata'), ('dibs_order_status');

-- MagePlace.com Social Login
INSERT INTO `tmp_trunctables` VALUES ('googleconnect_synch'), ('twitterconnect_synch');

-- MageMonkey
INSERT INTO `tmp_trunctables` VALUES ('magemonkey_ecommerce360');

-- TemplatesMaster.com Helpmate
INSERT INTO `tmp_trunctables` VALUES ('tm_helpmate_theard'), ('tm_helpmate_ticket');

-- Go ahead, add lines for more extensions and submit as pull request!
-- INSERT INTO `tmp_trunctables` VALUES ('');

-- Test nonexistant table:
-- INSERT INTO `tmp_trunctables` VALUES ('mytestfoobar');


-- This is the sproc which runs through the tmp table and truncates
DELIMITER ||
DROP PROCEDURE IF EXISTS `ccdata_empty_testdata`||

CREATE PROCEDURE ccdata_empty_testdata ()
MODIFIES SQL DATA
BEGIN
	DECLARE dbname,t1 VARCHAR(100);
	DECLARE tcount,done INT;
	DECLARE cur_1 CURSOR FOR SELECT tname FROM `tmp_trunctables` WHERE 1;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	OPEN cur_1;
	REPEAT
		FETCH cur_1 INTO t1;

		-- Check whether given db table exists
		SELECT database() INTO dbname;
		SELECT COUNT(*) INTO tcount FROM information_schema.TABLES
			WHERE TABLE_NAME=t1 and TABLE_SCHEMA=dbname;

		IF (tcount > 0) THEN
			SET @sql1 = CONCAT('TRUNCATE ', t1, ';');
			PREPARE s1 from @sql1;
			EXECUTE s1;

			SET @sql2 = CONCAT('ALTER TABLE ', t1, ' AUTO_INCREMENT=1;');
			PREPARE s2 from @sql2;
			EXECUTE s2;
		END IF;

		UNTIL done = 1
	END REPEAT;
	CLOSE cur_1;
END;||

CALL ccdata_empty_testdata()||
DROP PROCEDURE IF EXISTS `ccdata_empty_testdata`||
DELIMITER ;||

SET FOREIGN_KEY_CHECKS = 1;
