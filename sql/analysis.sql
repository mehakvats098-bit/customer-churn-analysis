-- CUSTOMER CHURN ANALYSIS
-- SQL Query History


-- 1. Count churned customers

SELECT COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes';


-- 2. Count total customers

SELECT COUNT(*) AS total_customers
FROM customers;


-- 3. Calculate churn rate

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customers;


-- 4. Customers by contract type

SELECT
    Contract_Type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY Contract_Type;


-- 5. Churn rate by city

SELECT
    City,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY City;


-- 6. Churn rate by payment method

SELECT
    Payment_Method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Payment_Method;


-- 7. Cities ordered by churn rate

SELECT
    City,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY City
ORDER BY churn_rate DESC;


-- 8. Customer with highest monthly charge

SELECT
    Customer_ID,
    Monthly_Charges
FROM customers
ORDER BY Monthly_Charges DESC
LIMIT 1;


-- 9. Top 3 customers by monthly charge

SELECT
    Customer_ID,
    Monthly_Charges
FROM customers
ORDER BY Monthly_Charges DESC
LIMIT 3;


-- 10. Highest monthly charge among churned customers

SELECT
    Customer_ID,
    Monthly_Charges
FROM customers
WHERE Churn = 'Yes'
ORDER BY Monthly_Charges DESC
LIMIT 1;


-- 11. Average monthly charge

SELECT
    ROUND(AVG(Monthly_Charges), 2) AS average_monthly_charge
FROM customers;


-- 12. Average monthly charge among churned customers

SELECT
    ROUND(AVG(Monthly_Charges), 2) AS average_churned_charge
FROM customers
WHERE Churn = 'Yes';


-- 13. Cities with more than 2 churned customers

SELECT
    City,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY City
HAVING churned_customers > 2;


-- 14. Payment methods with more than 1 churned customer

SELECT
    Payment_Method,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY Payment_Method
HAVING churned_customers > 1
ORDER BY churned_customers DESC;


-- 15. JOIN customers with service information

SELECT
    customers.Customer_ID,
    customers.City,
    customer_services.Service,
    customer_services.Support_Plan
FROM customers
JOIN customer_services
ON customers.Customer_ID = customer_services.Customer_ID;


-- 16. Premium support customers who churned

SELECT
    customers.Customer_ID,
    customers.City,
    customer_services.Service,
    customer_services.Support_Plan,
    customers.Churn
FROM customers
JOIN customer_services
ON customers.Customer_ID = customer_services.Customer_ID
WHERE customer_services.Support_Plan = 'Premium'
AND customers.Churn = 'Yes';


-- 17. LEFT JOIN customers with service information

SELECT
    customers.Customer_ID,
    customers.City,
    customer_services.Support_Plan
FROM customers
LEFT JOIN customer_services
ON customers.Customer_ID = customer_services.Customer_ID;


-- 18. Customers with missing service records

SELECT
    customers.Customer_ID,
    customers.City,
    customer_services.Support_Plan
FROM customers
LEFT JOIN customer_services
ON customers.Customer_ID = customer_services.Customer_ID
WHERE customer_services.Customer_ID IS NULL;


-- 19. Different payment methods

SELECT DISTINCT Payment_Method
FROM customers;


-- 20. Customers from Delhi or Noida

SELECT
    Customer_ID,
    City,
    Churn
FROM customers
WHERE City IN ('Delhi', 'Noida');


-- 21. Customers NOT from Delhi or Noida

SELECT
    Customer_ID,
    City,
    Churn
FROM customers
WHERE City NOT IN ('Delhi', 'Noida');


-- 22. Customers whose payment method contains "Card"

SELECT
    Customer_ID,
    Payment_Method
FROM customers
WHERE Payment_Method LIKE '%Card%';


-- 23. Categorize customers by monthly charge

SELECT
    Customer_ID,
    Monthly_Charges,
    CASE
        WHEN Monthly_Charges >= 900 THEN 'High'
        WHEN Monthly_Charges >= 700 THEN 'Medium'
        ELSE 'Low'
    END AS Charge_Category
FROM customers;


-- 24. Number of customers in each city

SELECT
    City,
    COUNT(*) AS customer_count
FROM customers
GROUP BY City;


-- 25. Average monthly charge by city

SELECT
    City,
    ROUND(AVG(Monthly_Charges), 2) AS average_charge
FROM customers
GROUP BY City;


-- 26. Minimum and maximum monthly charges

SELECT
    MIN(Monthly_Charges) AS minimum_charge,
    MAX(Monthly_Charges) AS maximum_charge
FROM customers;

-- 27. Total monthly revenue by city

SELECT
    City,
    SUM(Monthly_Charges) AS total_monthly_revenue
FROM customers
GROUP BY City;

-- 28. Churned customers by city

SELECT
    City,
    COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY City;

-- 29. Average charge of churned customers by city

SELECT
    City,
    ROUND(AVG(Monthly_Charges), 2) AS average_churned_charge
FROM customers
WHERE Churn = 'Yes'
GROUP BY City;

-- 30. Cities ordered by customer count

SELECT
    City,
    COUNT(*) AS customer_count
FROM customers
GROUP BY City
ORDER BY customer_count DESC;

-- 31. Total monthly revenue from churned customers

SELECT
    SUM(Monthly_Charges) AS churned_monthly_revenue
FROM customers
WHERE Churn = 'Yes';

-- 32. Total monthly revenue by contract type

SELECT
    Contract_Type,
    SUM(Monthly_Charges) AS total_monthly_revenue
FROM customers
GROUP BY Contract_Type;

-- 33. Count unique cities

SELECT COUNT(DISTINCT City) AS unique_cities
FROM customers;

-- 34. Find customers with missing support plans

SELECT
    Customer_ID,
    Support_Plan
FROM customer_services
WHERE Support_Plan IS NULL;


-- 35. Rank customers by monthly charge

SELECT
    Customer_ID,
    Monthly_Charges,
    ROW_NUMBER() OVER (
        ORDER BY Monthly_Charges DESC
    ) AS charge_rank
FROM customers;

-- 36. Rank customers using RANK

SELECT
    Customer_ID,
    Monthly_Charges,
    RANK() OVER (
        ORDER BY Monthly_Charges DESC
    ) AS charge_rank
FROM customers;

-- 37. Rank customers by monthly charge within each city

SELECT
    Customer_ID,
    City,
    Monthly_Charges,
    RANK() OVER (
        PARTITION BY City
        ORDER BY Monthly_Charges DESC
    ) AS city_rank
FROM customers;

-- 38. Highest-paying customer in each city

WITH ranked_customers AS (
    SELECT
        Customer_ID,
        City,
        Monthly_Charges,
        RANK() OVER (
            PARTITION BY City
            ORDER BY Monthly_Charges DESC
        ) AS city_rank
    FROM customers
)

SELECT
    Customer_ID,
    City,
    Monthly_Charges
FROM ranked_customers
WHERE city_rank = 1;

-- 39. Churn rate by contract type

SELECT
    Contract_Type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Contract_Type
ORDER BY churn_rate DESC;


-- 40. Churn rate by payment method

SELECT
    Payment_Method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Payment_Method
ORDER BY churn_rate DESC;


-- 41. Average support calls by churn status

SELECT
    Churn,
    ROUND(AVG(Support_Calls), 2) AS average_support_calls
FROM customers
GROUP BY Churn;


-- 42. Average tenure by churn status

SELECT
    Churn,
    ROUND(AVG(Tenure_Months), 2) AS average_tenure
FROM customers
GROUP BY Churn;


-- 43. Average monthly charge by churn status

SELECT
    Churn,
    ROUND(AVG(Monthly_Charges), 2) AS average_monthly_charge
FROM customers
GROUP BY Churn;


-- 44. Customers with more than 3 support calls

SELECT
    Customer_ID,
    Support_Calls,
    Churn
FROM customers
WHERE Support_Calls > 3
ORDER BY Support_Calls DESC;


-- 45. Customers with low tenure and high support calls

SELECT
    Customer_ID,
    Tenure_Months,
    Support_Calls,
    Churn
FROM customers
WHERE Tenure_Months < 12
AND Support_Calls >= 4;


-- 46. Churned customers by city and contract type

SELECT
    City,
    Contract_Type,
    COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes'
GROUP BY City, Contract_Type
ORDER BY churned_customers DESC;


-- 47. Revenue by city and contract type

SELECT
    City,
    Contract_Type,
    SUM(Monthly_Charges) AS total_monthly_revenue
FROM customers
GROUP BY City, Contract_Type
ORDER BY total_monthly_revenue DESC;


-- 48. Customers above the average monthly charge

SELECT
    Customer_ID,
    Monthly_Charges
FROM customers
WHERE Monthly_Charges > (
    SELECT AVG(Monthly_Charges)
    FROM customers
)
ORDER BY Monthly_Charges DESC;


-- 49. Top 3 customers in each city

WITH ranked_customers AS (
    SELECT
        Customer_ID,
        City,
        Monthly_Charges,
        RANK() OVER (
            PARTITION BY City
            ORDER BY Monthly_Charges DESC
        ) AS city_rank
    FROM customers
)

SELECT
    Customer_ID,
    City,
    Monthly_Charges,
    city_rank
FROM ranked_customers
WHERE city_rank <= 3
ORDER BY City, city_rank;


-- 50. Customer risk category

SELECT
    Customer_ID,
    Support_Calls,
    Tenure_Months,
    Churn,
    CASE
        WHEN Churn = 'Yes' AND Support_Calls >= 4
            THEN 'High Risk'
        WHEN Churn = 'Yes'
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM customers;