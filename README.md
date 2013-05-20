magento reset scripts
==========

Installing an extension just to delete test orders before site launch seems excessive. These sql scripts will help reset testdata in Magento stores. They all delete data, so you should of course confirm backups before using any of these.

- reset_increment_ids.sql - replaces current increment ids for orders with the values you specify in the file. Runs per store, affects orders, invoices, shipments and credit memos.
- reset_test_data.sql - empties all core Magento tables known to hold regular customer data and sets increment id to 1
- reset_extensions_data.sql - empties tables holding customer data for various extensions.

Please contribute! Improved code, more extensions, tips or constructive criticism are all very welcome
