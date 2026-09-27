import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Connect to database
connection = sqlite3.connect("customers.db")

# SQL query
query = """
SELECT
    Churn,
    ROUND(AVG(Tenure_Months), 2) AS average_tenure
FROM customers
GROUP BY Churn;
"""

# Run SQL query
result = pd.read_sql_query(query, connection)

# Display result
print(result)

# Save result
result.to_csv("average_tenure_by_churn.csv", index=False)

# Create bar chart
result.plot(
    x="Churn",
    y="average_tenure",
    kind="bar",
    legend=False
)

plt.title("Average Tenure by Churn Status")
plt.xlabel("Churn Status")
plt.ylabel("Average Tenure (Months)")

plt.tight_layout()

# Save chart
plt.savefig("charts/average_tenure_by_churn.png")

# Display chart
plt.show()

# Close connection
connection.close()