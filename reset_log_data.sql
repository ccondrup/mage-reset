-- Truncate logs for Magento --
-- This will delete data - make sure you have backups!
-- reset_log_data.sql will empty Magento logs for visitors, urls etc.
-- These tables usually grow quite large over time and some merchants are not interested in the data.
-- Merged and compiled by ccondrup for CCData.no

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8; -- Make sure to preserve Unicode characters outside Basic Multilingual Plane (Æ,ö, etc etc.)

-- Mark those pesky notifications as read
UPDATE `adminnotification_inbox` SET is_read=1;

-- Reset report data
DELETE FROM `report_event`
WHERE event_type_id IN (
	SELECT event_type_id
	FROM `report_event_types`
	WHERE event_name IN (
		'catalog_product_view', 'sendfriend_product', 'catalog_product_compare_add_product',
		'checkout_cart_add_product', 'wishlist_add_product', 'wishlist_share'
	)
);

-- Create a tmp table to hold the names of tables we want to service
DROP TEMPORARY TABLE IF EXISTS `tmp_trunctables`;
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_trunctables` (
  `tname` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- List of tables to both truncate and set incrementid=1
INSERT INTO `tmp_trunctables` VALUES
	('log_url'),
	('log_url_info'),
	('log_visitor'),
	('log_visitor_info'),
	('log_visitor_online'),
	('report_compared_product_index'),
	('report_viewed_product_index')
;

-- This is the sproc which runs through the tmp table and truncates
DELIMITER ||
DROP PROCEDURE IF EXISTS `ccdata_empty_testdata`||

CREATE PROCEDURE ccdata_empty_testdata ()
MODIFIES SQL DATA
BEGIN
	DECLARE t1 VARCHAR(100);
	DECLARE done INT;
	DECLARE cur_1 CURSOR FOR SELECT tname FROM `tmp_trunctables` WHERE 1;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	OPEN cur_1;
	REPEAT
		FETCH cur_1 INTO t1;

		SET @sql1 = CONCAT('TRUNCATE ', t1, ';');
		PREPARE s1 from @sql1;
		EXECUTE s1;

		SET @sql2 = CONCAT('ALTER TABLE ', t1, ' AUTO_INCREMENT=1;');
		PREPARE s2 from @sql2;
		EXECUTE s2;

		UNTIL done = 1
	END REPEAT;
	CLOSE cur_1;
END;||

CALL ccdata_empty_testdata()||
DROP PROCEDURE IF EXISTS `ccdata_empty_testdata`||
DELIMITER ;||

SET FOREIGN_KEY_CHECKS = 1;
