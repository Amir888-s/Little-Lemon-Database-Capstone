# Little Lemon Database Capstone

Based on the uploaded LittleLemon_data.xlsx, Orders worksheet. 21,000 source rows; 1,000 distinct customers; 1,000 distinct order IDs; 72 distinct menu combinations.

## Included
- `sql/01_schema.sql`: normalized Customers, Orders, OrderItems, MenuItems, Bookings schema and summary view.
- `sql/02_procedures.sql`: all five required stored procedures.
- `sql/03_tests.sql`: example test calls.
- `data/`: normalized CSV exports and Tableau-ready source.
- `diagrams/ER_diagram.mmd`: Mermaid ER diagram source.
- `python/connect_mysql.py`: sample Python database connection and stored procedure invocation.
- `tableau/INSTRUCTIONS.md`: steps to build required Tableau workbook.

## Deployment
1. Run `sql/01_schema.sql` in MySQL Workbench, then `sql/02_procedures.sql`.
2. Import CSV files into their matching tables in this order: customers, menu_items, orders, order_items. Match column names and use UTF-8. For a reliable large import, use Workbench's Table Data Import Wizard or MySQL `LOAD DATA LOCAL INFILE` where enabled.
3. Run `sql/03_tests.sql`. Capture real screenshots and save an `.mwb` model using Workbench.
4. Set LL_DB_HOST, LL_DB_USER and LL_DB_PASSWORD and run `pip install -r requirements.txt` then `python python/connect_mysql.py`.
5. Follow Tableau instructions and save a packaged `.twbx` workbook.
6. Commit files to your own GitHub repository; submit its URL.

## Data caveats
- The Excel file contains historical order data, not table reservations. The Bookings table is created empty; add realistic testing records before testing booking procedures.
- Some source delivery dates precede order dates; they are preserved as provided rather than silently corrected.
- MySQL deployment, `.mwb` screenshots, Tableau `.twbx`, and GitHub upload require access to your local applications/account and are not claimed as completed.
