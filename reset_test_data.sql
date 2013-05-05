-- Reset Magento testdata --
-- Backup your database before executing these commands
-- Credits: Elias Interactive http://goo.gl/E03d5 & ChiliPepperDesign http://goo.gl/FcWGx
-- Merged and compiled by ccondrup for CCData.no

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8; -- Make sure to preserve Unicode characters outside Basic Multilingual Plane (Æ,ö, etc etc.)

-- Reset customer generated data
UPDATE `adminnotification_inbox` SET is_read=1;
TRUNCATE `catalogsearch_query`;
TRUNCATE `catalogsearch_result`;
TRUNCATE `catalog_compare_item`;
TRUNCATE `customer_address_entity`;
TRUNCATE `customer_address_entity_datetime`;
TRUNCATE `customer_address_entity_decimal`;
TRUNCATE `customer_address_entity_int`;
TRUNCATE `customer_address_entity_text`;
TRUNCATE `customer_address_entity_varchar`;
TRUNCATE `customer_entity`;
TRUNCATE `customer_entity_datetime`;
TRUNCATE `customer_entity_decimal`;
TRUNCATE `customer_entity_int`;
TRUNCATE `customer_entity_text`;
TRUNCATE `customer_entity_varchar`;
TRUNCATE `downloadable_link_purchased`;
TRUNCATE `downloadable_link_purchased_item`;
TRUNCATE `log_customer`;
TRUNCATE `log_quote`;
TRUNCATE `log_summary`;
TRUNCATE `log_summary_type`;
TRUNCATE `log_url`;
TRUNCATE `log_url_info`;
TRUNCATE `log_visitor`;
TRUNCATE `log_visitor_info`;
TRUNCATE `log_visitor_online`;
TRUNCATE `newsletter_queue`;
TRUNCATE `newsletter_queue_link`;
TRUNCATE `newsletter_queue_store_link`;
TRUNCATE `newsletter_subscriber`;
TRUNCATE `rating_option`;
TRUNCATE `rating_option_vote`;
TRUNCATE `rating_option_vote_aggregated`;
TRUNCATE `rating_store`;
TRUNCATE `rating_title`;
TRUNCATE `report_compared_product_index`;
TRUNCATE `report_event`;
TRUNCATE `report_viewed_product_index`;
TRUNCATE `review`;
TRUNCATE `review_detail`;
TRUNCATE `review_entity_summary`;
TRUNCATE `review_store`;
TRUNCATE `salesrule_coupon_usage`;
TRUNCATE `salesrule_customer`;
TRUNCATE `sales_bestsellers_aggregated_daily`;
TRUNCATE `sales_bestsellers_aggregated_monthly`;
TRUNCATE `sales_bestsellers_aggregated_yearly`;
TRUNCATE `sales_billing_agreement`;
TRUNCATE `sales_billing_agreement_order`;
TRUNCATE `sales_flat_creditmemo`;
TRUNCATE `sales_flat_creditmemo_comment`;
TRUNCATE `sales_flat_creditmemo_grid`;
TRUNCATE `sales_flat_creditmemo_item`;
TRUNCATE `sales_flat_invoice`;
TRUNCATE `sales_flat_invoice_comment`;
TRUNCATE `sales_flat_invoice_grid`;
TRUNCATE `sales_flat_invoice_item`;
TRUNCATE `sales_flat_order`;
TRUNCATE `sales_flat_order_address`;
TRUNCATE `sales_flat_order_grid`;
TRUNCATE `sales_flat_order_item`;
TRUNCATE `sales_flat_order_payment`;
TRUNCATE `sales_flat_order_status_history`;
TRUNCATE `sales_flat_quote`;
TRUNCATE `sales_flat_quote_address`;
TRUNCATE `sales_flat_quote_address_item`;
TRUNCATE `sales_flat_quote_item`;
TRUNCATE `sales_flat_quote_item_option`;
TRUNCATE `sales_flat_quote_payment`;
TRUNCATE `sales_flat_quote_shipping_rate`;
TRUNCATE `sales_flat_shipment`;
TRUNCATE `sales_flat_shipment_comment`;
TRUNCATE `sales_flat_shipment_grid`;
TRUNCATE `sales_flat_shipment_item`;
TRUNCATE `sales_flat_shipment_track`;
TRUNCATE `sales_invoiced_aggregated`;
TRUNCATE `sales_invoiced_aggregated_order`;
TRUNCATE `sales_order_aggregated_created`;
TRUNCATE `sales_order_aggregated_updated`;
TRUNCATE `sales_order_tax`;
TRUNCATE `sales_payment_transaction`;
TRUNCATE `sales_recurring_profile`;
TRUNCATE `sales_recurring_profile_order`;
TRUNCATE `sales_refunded_aggregated`;
TRUNCATE `sales_refunded_aggregated_order`;
TRUNCATE `sales_shipping_aggregated`;
TRUNCATE `sales_shipping_aggregated_order`;
TRUNCATE `sendfriend_log`;
TRUNCATE `tag`;
TRUNCATE `tag_relation`;
TRUNCATE `tag_summary`;
TRUNCATE `wishlist`;
TRUNCATE `wishlist_item`;
TRUNCATE `wishlist_item_option`;


ALTER TABLE `catalogsearch_query` AUTO_INCREMENT=1;
ALTER TABLE `catalogsearch_result` AUTO_INCREMENT=1;
ALTER TABLE `catalog_compare_item` AUTO_INCREMENT=1;
ALTER TABLE `customer_address_entity` AUTO_INCREMENT=1;
ALTER TABLE `customer_address_entity_datetime` AUTO_INCREMENT=1;
ALTER TABLE `customer_address_entity_decimal` AUTO_INCREMENT=1;
ALTER TABLE `customer_address_entity_int` AUTO_INCREMENT=1;
ALTER TABLE `customer_address_entity_text` AUTO_INCREMENT=1;
ALTER TABLE `customer_address_entity_varchar` AUTO_INCREMENT=1;
ALTER TABLE `customer_entity` AUTO_INCREMENT=1;
ALTER TABLE `customer_entity_datetime` AUTO_INCREMENT=1;
ALTER TABLE `customer_entity_decimal` AUTO_INCREMENT=1;
ALTER TABLE `customer_entity_int` AUTO_INCREMENT=1;
ALTER TABLE `customer_entity_text` AUTO_INCREMENT=1;
ALTER TABLE `customer_entity_varchar` AUTO_INCREMENT=1;
ALTER TABLE `downloadable_link_purchased` AUTO_INCREMENT=1;
ALTER TABLE `downloadable_link_purchased_item` AUTO_INCREMENT=1;
ALTER TABLE `log_customer` AUTO_INCREMENT=1;
ALTER TABLE `log_quote` AUTO_INCREMENT=1;
ALTER TABLE `log_summary` AUTO_INCREMENT=1;
ALTER TABLE `log_summary_type` AUTO_INCREMENT=1;
ALTER TABLE `log_url` AUTO_INCREMENT=1;
ALTER TABLE `log_url_info` AUTO_INCREMENT=1;
ALTER TABLE `log_visitor` AUTO_INCREMENT=1;
ALTER TABLE `log_visitor_info` AUTO_INCREMENT=1;
ALTER TABLE `log_visitor_online` AUTO_INCREMENT=1;
ALTER TABLE `newsletter_queue` AUTO_INCREMENT=1;
ALTER TABLE `newsletter_queue_link` AUTO_INCREMENT=1;
ALTER TABLE `newsletter_queue_store_link` AUTO_INCREMENT=1;
ALTER TABLE `newsletter_subscriber` AUTO_INCREMENT=1;
ALTER TABLE `rating_option` AUTO_INCREMENT=1;
ALTER TABLE `rating_option_vote` AUTO_INCREMENT=1;
ALTER TABLE `rating_option_vote_aggregated` AUTO_INCREMENT=1;
ALTER TABLE `rating_store` AUTO_INCREMENT=1;
ALTER TABLE `rating_title` AUTO_INCREMENT=1;
ALTER TABLE `report_compared_product_index` AUTO_INCREMENT=1;
ALTER TABLE `report_event` AUTO_INCREMENT=1;
ALTER TABLE `report_viewed_product_index` AUTO_INCREMENT=1;
ALTER TABLE `review` AUTO_INCREMENT=1;
ALTER TABLE `review_detail` AUTO_INCREMENT=1;
ALTER TABLE `review_entity_summary` AUTO_INCREMENT=1;
ALTER TABLE `review_store` AUTO_INCREMENT=1;
ALTER TABLE `salesrule_coupon_usage` AUTO_INCREMENT=1;
ALTER TABLE `salesrule_customer` AUTO_INCREMENT=1;
ALTER TABLE `sales_bestsellers_aggregated_daily` AUTO_INCREMENT=1;
ALTER TABLE `sales_bestsellers_aggregated_monthly` AUTO_INCREMENT=1;
ALTER TABLE `sales_bestsellers_aggregated_yearly` AUTO_INCREMENT=1;
ALTER TABLE `sales_billing_agreement` AUTO_INCREMENT=1;
ALTER TABLE `sales_billing_agreement_order` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_creditmemo` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_creditmemo_comment` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_creditmemo_grid` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_creditmemo_item` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_invoice` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_invoice_comment` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_invoice_grid` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_invoice_item` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_order` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_order_address` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_order_grid` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_order_item` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_order_payment` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_order_status_history` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_quote` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_quote_address` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_quote_address_item` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_quote_item` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_quote_item_option` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_quote_payment` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_quote_shipping_rate` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_shipment` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_shipment_comment` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_shipment_grid` AUTO_INCREMENT=1;
ALTER TABLE `sales_flat_shipment_item` AUTO_INCREMENT=1;;
ALTER TABLE `sales_flat_shipment_track` AUTO_INCREMENT=1;
ALTER TABLE `sales_invoiced_aggregated` AUTO_INCREMENT=1;
ALTER TABLE `sales_invoiced_aggregated_order` AUTO_INCREMENT=1;
ALTER TABLE `sales_order_aggregated_created` AUTO_INCREMENT=1;
ALTER TABLE `sales_order_aggregated_updated` AUTO_INCREMENT=1;
ALTER TABLE `sales_order_tax` AUTO_INCREMENT=1;
ALTER TABLE `sales_payment_transaction` AUTO_INCREMENT=1;
ALTER TABLE `sales_recurring_profile` AUTO_INCREMENT=1;
ALTER TABLE `sales_recurring_profile_order` AUTO_INCREMENT=1;
ALTER TABLE `sales_refunded_aggregated` AUTO_INCREMENT=1;
ALTER TABLE `sales_refunded_aggregated_order` AUTO_INCREMENT=1;
ALTER TABLE `sales_shipping_aggregated` AUTO_INCREMENT=1;
ALTER TABLE `sales_shipping_aggregated_order` AUTO_INCREMENT=1;
ALTER TABLE `sendfriend_log` AUTO_INCREMENT=1;
ALTER TABLE `tag` AUTO_INCREMENT=1;
ALTER TABLE `tag_relation` AUTO_INCREMENT=1;
ALTER TABLE `tag_summary` AUTO_INCREMENT=1;
ALTER TABLE `wishlist` AUTO_INCREMENT=1;
ALTER TABLE `wishlist_item` AUTO_INCREMENT=1;
ALTER TABLE `wishlist_item_option` AUTO_INCREMENT=1;

-- Reset order data
DELETE FROM `eav_entity_store`
	WHERE entity_type_id IN (
		SELECT entity_type_id
		FROM `eav_entity_type`
		WHERE entity_type_code IN (
			'order', 'invoice', 'creditmemo', 'shipment'
		)
);

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

SET FOREIGN_KEY_CHECKS = 1;