-- Resets testdata for Magento --
-- This will delete data - make sure you have backups!
-- Credits: Elias Interactive http://goo.gl/E03d5 & ChiliPepperDesign http://goo.gl/FcWGx
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
	('catalogsearch_query'),
	('catalogsearch_result'),
	('catalog_compare_item'),
	('customer_address_entity'),
	('customer_address_entity_datetime'),
	('customer_address_entity_decimal'),
	('customer_address_entity_int'),
	('customer_address_entity_text'),
	('customer_address_entity_varchar'),
	('customer_entity'),
	('customer_entity_datetime'),
	('customer_entity_decimal'),
	('customer_entity_int'),
	('customer_entity_text'),
	('customer_entity_varchar'),
	('downloadable_link_purchased'),
	('downloadable_link_purchased_item'),
	('log_customer'),
	('log_quote'),
	('log_summary'),
	('log_summary_type'),
	('log_url'),
	('log_url_info'),
	('log_visitor'),
	('log_visitor_info'),
	('log_visitor_online'),
	('newsletter_queue'),
	('newsletter_queue_link'),
	('newsletter_queue_store_link'),
	('newsletter_subscriber'),
	('rating_option'),
	('rating_option_vote'),
	('rating_option_vote_aggregated'),
	('rating_store'),
	('rating_title'),
	('report_compared_product_index'),
	('report_event'),
	('report_viewed_product_index'),
	('review'),
	('review_detail'),
	('review_entity_summary'),
	('review_store'),
	('salesrule_coupon_usage'),
	('salesrule_customer'),
	('sales_bestsellers_aggregated_daily'),
	('sales_bestsellers_aggregated_monthly'),
	('sales_bestsellers_aggregated_yearly'),
	('sales_billing_agreement'),
	('sales_billing_agreement_order'),
	('sales_flat_creditmemo'),
	('sales_flat_creditmemo_comment'),
	('sales_flat_creditmemo_grid'),
	('sales_flat_creditmemo_item'),
	('sales_flat_invoice'),
	('sales_flat_invoice_comment'),
	('sales_flat_invoice_grid'),
	('sales_flat_invoice_item'),
	('sales_flat_order'),
	('sales_flat_order_address'),
	('sales_flat_order_grid'),
	('sales_flat_order_item'),
	('sales_flat_order_payment'),
	('sales_flat_order_status_history'),
	('sales_flat_quote'),
	('sales_flat_quote_address'),
	('sales_flat_quote_address_item'),
	('sales_flat_quote_item'),
	('sales_flat_quote_item_option'),
	('sales_flat_quote_payment'),
	('sales_flat_quote_shipping_rate'),
	('sales_flat_shipment'),
	('sales_flat_shipment_comment'),
	('sales_flat_shipment_grid'),
	('sales_flat_shipment_item'),
	('sales_flat_shipment_track'),
	('sales_invoiced_aggregated'),
	('sales_invoiced_aggregated_order'),
	('sales_order_aggregated_created'),
	('sales_order_aggregated_updated'),
	('sales_order_tax'),
	('sales_order_tax_item'),
	('sales_payment_transaction'),
	('sales_recurring_profile'),
	('sales_recurring_profile_order'),
	('sales_refunded_aggregated'),
	('sales_refunded_aggregated_order'),
	('sales_shipping_aggregated'),
	('sales_shipping_aggregated_order'),
	('sendfriend_log'),
	('tag'),
	('tag_relation'),
	('tag_summary'),
	('wishlist'),
	('wishlist_item'),
	('wishlist_item_option')
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
