CREATE DATABASE saas_project;
USE saas_project;

show tables;

SELECT COUNT(*)
FROM SaaS_Product_Performance_Analytics;

SELECT COUNT(DISTINCT User_ID) AS Total_Users
FROM saas_product_performance_analytics;

SELECT SUM(Revenue) AS Total_Revenue
FROM saas_product_performance_analytics;

SELECT Subscription_Plan,
       SUM(Revenue) AS Revenue
FROM saas_product_performance_analytics
GROUP BY Subscription_Plan
ORDER BY Revenue DESC;

SELECT Status,
       COUNT(*) AS Users
FROM saas_product_performance_analytics
GROUP BY Status;

SELECT Country,
       SUM(Revenue) AS Revenue
FROM saas_product_performance_analytics
GROUP BY Country
ORDER BY Revenue DESC;

SELECT Device_Type,
       COUNT(*) AS Users
FROM saas_product_performance_analytics
GROUP BY Device_Type;

SELECT User_ID,
       Revenue,
       ROW_NUMBER() OVER(ORDER BY Revenue DESC) AS Rank_No
FROM saas_product_performance_analytics;

WITH Revenue_Data AS
(
    SELECT Subscription_Plan,
           SUM(Revenue) AS Total_Revenue
    FROM saas_product_performance_analytics
    GROUP BY Subscription_Plan
)
SELECT *
FROM Revenue_Data;

SELECT User_ID,
       Revenue,
       CASE
           WHEN Revenue > 15000 THEN 'High Value'
           WHEN Revenue > 7000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS Customer_Category
FROM saas_product_performance_analytics;

SELECT Country,
       SUM(Revenue) AS Revenue,
       RANK() OVER(ORDER BY SUM(Revenue) DESC) AS Country_Rank
FROM saas_product_performance_analytics
GROUP BY Country;




























