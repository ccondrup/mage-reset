## Magento reset scripts

**Why?** Installing an extension just to delete test orders before site launch seems excessive. Simply import these sql scripts to reset testdata in Magento stores.

**How?**
Download & make changes as you like. Use with your favourite mysql admin tool. Beware, these all delete data, so you should of course confirm backups before using any of these.

**What?**
- **reset_increment_ids** - replaces current increment ids for orders with the values you specify in the file. Runs per store, affects orders, invoices, shipments and credit memos.

- **reset_test_data** - empties all core Magento tables known to hold regular customer data and sets increment id to 1

- **reset_extensions_data** - empties tables holding customer data for various extensions.


Please contribute! Improved code, more extensions, tips or constructive criticism are all very welcome
