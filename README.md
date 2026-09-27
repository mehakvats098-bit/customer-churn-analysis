# Customer Churn Analysis

## Project Overview

This project analyzes customer churn using SQL, Python, Pandas, and Matplotlib.

The goal is to identify customer patterns related to churn and demonstrate a complete data analysis workflow from database creation to business insights.

> Note: The dataset used in this project is a small practice dataset created for learning purposes and does not represent real customer data.

---

## Business Questions

This analysis answers questions such as:

- What percentage of customers churned?
- Which contract type has the highest churn rate?
- How does churn vary by city?
- Is there a relationship between support calls and churn?
- How do monthly charges differ between churned and retained customers?
- How does customer tenure differ between churned and retained customers?

---

## Technologies Used

- Python
- SQLite
- SQL
- Pandas
- Matplotlib

---

## Project Structure

```text
customer-churn-analysis/
│
├── data/
│   └── customers.csv
│
├── charts/
│   ├── customers_by_city.png
│   ├── churn_rate_by_contract.png
│   ├── churn_rate_by_city.png
│   ├── support_calls_churn.png
│   ├── monthly_charges_vs_support_calls.png
│   ├── churn_distribution.png
│   ├── average_charge_by_churn.png
│   └── average_tenure_by_churn.png
│
├── sql/
│   └── analysis.sql
│
├── setup_database.py
├── run_sql.py
├── customers.db
└── README.md