-- Resets testdata for Magento --
-- This will delete your existing increment ids for orders, invoices, creditmemos and shipment and replace with values specified
-- Credits: Elias Interactive http://goo.gl/E03d5 & ChiliPepperDesign http://goo.gl/FcWGx
-- Merged and compiled by ccondrup for CCData.no

-- Start config section. Set your options here --
-- For empty values, leave blank ('') rather than delete the variables --
SET @id_store   := '3';      -- The id of the Mage store you wish to change. Run this script for each store.
SET @id_prefix  := NULL;     -- Prefix for new numbers, alphanumeric is OK, NULL or numeric preferrable
SET @nr_nextid  := 10101;    -- Next order id. Match padlength! Mage default 00000001 = 8 digits, means @nr_padding should be 8.
SET @nr_padding := 5;        -- How many digits did you set in nr_nextid? Mage default 8
-- The set values will result in next id = #310102 --
-- End config section. No need to edit below --

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8; -- Make sure to preserve Unicode characters outside Basic Multilingual Plane (Æ,ö, etc etc.)

-- First set pad length
UPDATE `eav_entity_type`
	SET `increment_pad_length` = @nr_padding
	WHERE (
		`entity_type_code` = 'order'
		OR `entity_type_code` = 'invoice'
		OR `entity_type_code` = 'shipment'
		OR `entity_type_code` = 'creditmemo'
);

-- Create and run the procedure to set defaults for orders, invoices, shipments, credit memos
DELIMITER ||
DROP PROCEDURE IF EXISTS `ccdata_set_defaults`||

CREATE PROCEDURE ccdata_set_defaults (IN id_store INT(5), IN id_prefix VARCHAR(15), IN nr_nextid INT(15))
MODIFIES SQL DATA
BEGIN
	DECLARE id_type,done INT;
	DECLARE cur_1 CURSOR FOR SELECT entity_type_id FROM `eav_entity_type` WHERE entity_type_code IN ('order', 'invoice', 'creditmemo', 'shipment');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	IF id_prefix = 'NULL' THEN SET id_prefix = NULL; END IF; 
	OPEN cur_1;
	REPEAT
		FETCH cur_1 INTO id_type;
		DELETE FROM `eav_entity_store` WHERE `entity_type_id` = id_type AND `store_id` = id_store;
		INSERT INTO `eav_entity_store` (`entity_type_id`, `store_id`, `increment_prefix`, `increment_last_id`)
			VALUES(id_type, id_store, id_prefix, CONCAT(id_store, nr_nextid));
		UNTIL done = 1
	END REPEAT;
	CLOSE cur_1;
END;||

CALL ccdata_set_defaults(@id_store, @id_prefix, @nr_nextid)||
DROP PROCEDURE IF EXISTS `ccdata_set_defaults`||
DELIMITER ;||


SET FOREIGN_KEY_CHECKS = 1;