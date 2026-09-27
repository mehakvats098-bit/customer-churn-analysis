import sqlite3

connection = sqlite3.connect("customers.db")

query = """

CREATE TABLE customer_services (
    Customer_ID TEXT,
    Service TEXT,
    Support_Plan TEXT
);

"""

connection.execute(query)

connection.close()

print("Customer services table created!")