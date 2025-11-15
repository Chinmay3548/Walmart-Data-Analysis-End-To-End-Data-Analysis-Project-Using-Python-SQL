SELECT COUNT(*) FROM walmart_sales;
SELECT * FROM walmart_sales;

-- How many branches of walmart do we have in this dataset? --
SELECT COUNT(DISTINCT Branch) FROM 	walmart_sales;

-- Business Questions --
-- What are the different types of payment methods, how many transactions are done on these and what is the number of quantity sold
SELECT payment_method, count(*) AS transactions, sum(quantity) AS quantity
FROM walmart_sales
GROUP BY payment_method;

-- What is the highest rated category in each branch? -- 
SELECT * FROM

(
SELECT branch, category, AVG(rating), RANK() OVER (PARTITION BY branch ORDER BY AVG(rating) DESC) as rank
FROM walmart_sales
GROUP BY branch, category
)

WHERE rank = 1;

-- Identify the busiest day for each branch based on the number of transactions
SELECT * FROM
(
SELECT
  branch,
  TO_CHAR(TO_DATE(date,'DD/MM/YY'),'Day') as day,
  count(*) as no_transactions,
  RANK() OVER(PARTITION BY branch ORDER BY count(*) DESC)
FROM walmart_sales
GROUP BY 1,2
)
WHERE rank = 1;

-- Which product category brings the most sales? -- 
SELECT category, sum(quantity) as sales FROM walmart_sales
GROUP BY category
ORDER BY sales DESC
LIMIT 1;

-- What time of day and which day of week produces most sales? --
-- Peak shopping hours --
SELECT
  EXTRACT(HOUR FROM time::time) AS hour_of_day,
  SUM(total_amount) AS total_revenue,
  SUM(quantity) AS quantity,
  COUNT(*) AS transactions
FROM walmart_sales
GROUP BY 1
ORDER BY 2 DESC;

-- Peak shopping DOW -- 
SELECT
    TO_CHAR(TO_DATE(date, 'DD-MM-YY'), 'Day') AS weekday,
    EXTRACT(DOW FROM TO_DATE(date, 'DD-MM-YY')) AS weekday_num,
    SUM(total_amount) AS total_revenue,
    SUM(quantity) AS quantity,
    COUNT(*) AS transactions
FROM walmart_sales
GROUP BY 1,2
ORDER BY 3 DESC;

-- Which Branches produce more revenue than the company's average revenue accross all branches? --
WITH branch_revenue AS (
    SELECT 
        branch,
        SUM(total_amount) AS total_revenue
    FROM walmart_sales
    GROUP BY branch
)
SELECT 
    branch,
    total_revenue
FROM branch_revenue
WHERE total_revenue > (
    SELECT AVG(total_revenue) FROM branch_revenue
)
ORDER BY total_revenue DESC;

-- Second highest revenue day for each branch --
SELECT
  branch, 
  day, 
  date, 
  revenue
FROM
(
SELECT
  branch,
  TO_CHAR(TO_DATE(date,'DD/MM/YY'),'Day') as day,
  date,
  SUM(total_amount) as revenue,
  RANK() OVER(PARTITION BY branch ORDER BY SUM(total_amount) DESC) as rank
FROM walmart_sales
GROUP BY 1,2,3
)
WHERE rank = 2;      

-- Determine the most common payment method for each branch --
SELECT
  branch,
  payment_method,
  transactions
FROM
(
SELECT
  branch,
  payment_method,
  COUNT(*) as transactions,
  RANK() OVER(PARTITION BY branch ORDER BY count(*) DESC) as rankings
FROM walmart_sales
GROUP BY 1,2
ORDER BY 1
)
WHERE rankings = 1;

