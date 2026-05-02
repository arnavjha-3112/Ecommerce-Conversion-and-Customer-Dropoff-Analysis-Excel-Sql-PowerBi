-- =========================
-- KPI METRICS
-- =========================

-- Total Sessions
SELECT COUNT(*) AS total_sessions
FROM ecommerce_data;

-- Total Purchases 
SELECT ROUND(SUM(purchased),2) AS total_purchases
from ecommerce_data;

-- Total Revenue
SELECT ROUND(SUM(revenue),2) AS total_revenue
FROM ecommerce_data;

-- =========================
-- FUNNEL METRICS
-- =========================

-- Purchase Conversion rate
SELECT 
ROUND(SUM(purchased)*100.0/COUNT(*),2) AS purchase_conversion_rate
FROM ecommerce_data;

-- Cart Abandonment rate 
SELECT 
ROUND(SUM(cart_abandoned)*100.0/COUNT(*),2) AS cart_abandonment_rate
FROM ecommerce_data;

-- Funnel summary 
SELECT funnel_stage, COUNT(*) AS sessions
FROM ecommerce_data
GROUP BY funnel_stage
ORDER BY sessions DESC;

-- =========================
-- CUSTOMER INSIGHTS 
-- =========================

-- Purchases by Customer Segment
SELECT customer_segment,
SUM(purchased) AS purchases
FROM ecommerce_data
GROUP BY customer_segment;

-- Revenue by Customer Segment
SELECT customer_segment,
ROUND(SUM(revenue),2) AS revenue
FROM ecommerce_data
GROUP BY customer_segment;

-- =========================
-- PRODUCT INSIGHTS 
-- =========================

-- Revenue by Product Category
SELECT product_category,
ROUND(SUM(revenue),2) AS revenue
FROM ecommerce_data
GROUP BY product_category
ORDER BY revenue DESC;

-- Top 5 Products by Revenue 
SELECT product_id,
ROUND(SUM(revenue),2) AS revenue
FROM ecommerce_data
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 5;

-- =========================
-- TIME ANALYSIS  
-- =========================

-- Monthly Revenue Trend
SELECT visit_year_month,
ROUND(SUM(revenue),2) AS revenue
FROM ecommerce_data
GROUP BY visit_year_month
ORDER BY visit_year_month;

-- Monthly Purchases
SELECT visit_year_month,
SUM(purchased) AS purchases
FROM ecommerce_data
GROUP BY visit_year_month
ORDER BY visit_year_month;

-- =========================
-- PREMIUM INSIGHTS 
-- =========================

-- Device-wise Conversion Rate
SELECT device_type,
ROUND(SUM(purchased)*100.0/COUNT(*),2) AS conversion_rate
FROM ecommerce_data
GROUP BY device_type
ORDER BY conversion_rate DESC;

-- Marketing Channel Performance
SELECT marketing_channel,
ROUND(SUM(revenue),2) AS revenue,
SUM(purchased) AS purchases
FROM ecommerce_data
GROUP BY marketing_channel
ORDER BY revenue DESC;




