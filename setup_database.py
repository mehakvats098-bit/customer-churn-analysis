import pandas as pd
import sqlite3

# Load CSV
data = pd.read_csv("data/customers.csv")

# Create SQLite database
connection = sqlite3.connect("customers.db")

# Store CSV data as a table
data.to_sql("customers", connection, if_exists="replace", index=False)

connection.close()

print("Database created successfully!")