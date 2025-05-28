

-- 1. Write a query to find Total Revenue:
SELECT round(SUM(Amount_spent)) AS Total_Revenue FROM online_store;

-- 2.Average Spend by Gender.
SELECT Gender, floor(AVG(Amount_spent)) AS Avg_Spend FROM online_store GROUP BY Gender;

-- 3.Top 5 States by Total Revenue.
SELECT State_names, SUM(Amount_spent) AS Revenue FROM online_store
GROUP BY State_names ORDER BY Revenue DESC LIMIT 5;

-- 4.Find the transaction(s) with the maximum amount spent.
SELECT * 
FROM online_store 
WHERE Amount_spent = (
  SELECT MAX(Amount_spent) FROM online_store
);

-- 5.Monthly Sales Trend:
SELECT MONTH(STR_TO_DATE(Transaction_date, '%m/%d/%Y')) AS Month, SUM(Amount_spent) AS Monthly_Sales
FROM online_store
GROUP BY Month
ORDER BY Month;

-- 6.Most Popular Payment Method:
SELECT Payment_method, COUNT(*) AS Count FROM online_store GROUP BY Payment_method ORDER BY Count DESC LIMIT 1;

-- 7.Show spending level: 'High' if > 2000, 'Medium' if between 1000–2000, 'Low' if < 1000.
SELECT *,
  CASE
    WHEN Amount_spent > 2000 THEN 'High'
    WHEN Amount_spent BETWEEN 1000 AND 2000 THEN 'Medium'
    ELSE 'Low'
  END AS Spending_Level
FROM online_store;

--  8.Spending by Age Group (e.g., under 30, 30–50, over 50):
SELECT
  CASE
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30-50'
    ELSE 'Over 50'
  END AS Age_Group,
  AVG(Amount_spent) AS Avg_Spending
FROM online_store
GROUP BY Age_Group;

-- 9.Find customers who spent more than the average amount spent across all transactions.
SELECT * 
FROM online_store 
WHERE Amount_spent > (
  SELECT AVG(Amount_spent) FROM online_store
);

-- 10.Create a column to label customers as 'Young', 'Adult', or 'Senior' based on age.
SELECT *,
  CASE
    WHEN Age < 30 THEN 'Young'
    WHEN Age BETWEEN 30 AND 60 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Category
FROM online_store;





