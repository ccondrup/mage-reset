-- Reset data for misc. Mage addons
-- Backup your database before executing these commands
-- Merged and compiled by ccondrup for CCData.no

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8; -- Make sure to preserve Unicode characters outside Basic Multilingual Plane (Æ,ö, etc etc.)


-- DIBS.eu Payment Gateway
TRUNCATE `dibs_orderdata`;
TRUNCATE `dibs_order_status`;
ALTER TABLE `dibs_orderdata` AUTO_INCREMENT=1;
ALTER TABLE `dibs_order_status` AUTO_INCREMENT=1;


-- MagePlace.com Social Login
TRUNCATE TABLE `googleconnect_synch`;
TRUNCATE TABLE `twitterconnect_synch`;
ALTER TABLE `googleconnect_synch` AUTO_INCREMENT=1;
ALTER TABLE `twitterconnect_synch` AUTO_INCREMENT=1;


-- MageMonkey
TRUNCATE TABLE `magemonkey_ecommerce360`;
ALTER TABLE `magemonkey_ecommerce360` AUTO_INCREMENT=1;


-- TemplatesMaster.com Helpmate
TRUNCATE TABLE `tm_helpmate_theard`;
TRUNCATE TABLE `tm_helpmate_ticket`;
ALTER TABLE `tm_helpmate_theard` AUTO_INCREMENT=1;
ALTER TABLE `tm_helpmate_ticket` AUTO_INCREMENT=1;


SET FOREIGN_KEY_CHECKS = 1;