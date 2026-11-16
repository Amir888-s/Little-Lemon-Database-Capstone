import os
import mysql.connector

# Set environment variables LL_DB_USER, LL_DB_PASSWORD, LL_DB_HOST before running.
connection = mysql.connector.connect(host=os.getenv("LL_DB_HOST", "localhost"), user=os.getenv("LL_DB_USER", "root"), password=os.getenv("LL_DB_PASSWORD", ""), database="LittleLemonDB")
try:
    cursor = connection.cursor()
    cursor.callproc("GetMaxQuantity")
    for result in cursor.stored_results():
        print("Maximum order quantity:", result.fetchall())
    cursor.close()
finally:
    connection.close()
