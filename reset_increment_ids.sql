-- Reset Magento increment IDs --
-- Backup your database before executing these commands
-- Credits: Elias Interactive http://goo.gl/E03d5 & ChiliPepperDesign http://goo.gl/FcWGx
-- Merged and compiled by ccondrup for CCData.no

-- Start config section. Set your options here --
-- For empty values, leave blank ('') rather than delete the variables --
SET @id_store := '3';			-- The id of the Mage store you wish to change. Run this script for each store.
SET @id_prefix := NULL;			-- Prefix for new numbers, alphanumeric is OK, NULL or numeric preferrable
SET @nr_padding := 5;			-- How many digits follow after nr_prefix? Mage default 8
SET @nr_orderid := 10101;		-- Next id for orders, shipment etc. Match padlength! Mage default 00000001 = 8 digits, means @nr_padding should be 8.
-- These preselected values will result in next order having id #310102 --
-- End config section. No need to edit below --

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8; -- Make sure to preserve Unicode characters outside Basic Multilingual Plane (Æ,ö, etc etc.)

-- Set appropriate defaults for orders, invoices, shipments, credit memos
UPDATE `eav_entity_type`
	SET `increment_pad_length` = @nr_padding
	WHERE (
		`entity_type_code` = 'order'
		OR `entity_type_code` = 'invoice'
		OR `entity_type_code` = 'shipment'
		OR `entity_type_code` = 'creditmemo'
);

UPDATE `eav_entity_store` AS ees
	INNER JOIN `eav_entity_type` AS ty
		ON ty.`entity_type_id` = ees.`entity_type_id`
	SET
		ees.`increment_last_id` = CONCAT(@id_store, @nr_orderid),
		ees.`increment_prefix` = @id_prefix
	WHERE
		ees.`store_id` = @id_store
		AND (
			ty.`entity_type_code` = 'order'
			OR ty.`entity_type_code` = 'invoice'
			OR ty.`entity_type_code` = 'shipment'
			OR ty.`entity_type_code` = 'creditmemo'
);

SET FOREIGN_KEY_CHECKS = 1;