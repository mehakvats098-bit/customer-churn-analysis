import sqlite3

connection = sqlite3.connect("customers.db")

query = """
INSERT INTO customer_services
(Customer_ID, Service, Support_Plan)
VALUES
('C001', 'Internet', 'Premium'),
('C002', 'Internet', 'Basic'),
('C003', 'Internet', 'Premium'),
('C004', 'Internet', 'Basic'),
('C005', 'Internet', 'Basic');
"""

connection.execute(query)
connection.commit()
connection.close()

print("Service data inserted!")