SELECT 
    *
FROM
    worker.ecommerce_data;
    
#A#Sales Performance Analysis:

#1#Total revenue:

SELECT 
    SUM(Price * Quantity) AS Total_revenue
FROM
    worker.ecommerce_data
ORDER BY Total_revenue DESC;



#2#sales By Product Category
SELECT 
    Category, SUM(quantity) AS Total_sold
FROM
    worker.ecommerce_data
GROUP BY Category
ORDER BY Total_sold DESC;


#3#Top sealling of Product:

SELECT 
    Product_id, SUM(Quantity) AS Total_sold
FROM
    worker.ecommerce_data
GROUP BY Product_id
ORDER BY Total_sold DESC
LIMIT 10;

##Ship Wise saling
SELECT 
    SUM(Price * Quantity) AS Total
FROM
    worker.ecommerce_data;
    
SELECT 
    Ship_Mode, SUM(Price * Quantity) AS Ship_wise_sales, ( SUM(Price * Quantity)/(137204.9121)) *100 AS _wise
FROM
    worker.ecommerce_data
GROUP BY Ship_Mode order by Ship_wise_sales desc;

## Category wise selling
SELECT 
    Category, SUM(Price * Quantity) AS Category_sales
FROM
    worker.ecommerce_data
GROUP BY Category;

#B#Customer Analysis
SELECT 
    *
FROM
    worker.ecommerce_data;
#1#no. of customer
select count(Customer_id) from worker.ecommerce_data;
#Distinct CUstomer
select count(distinct Customer_id) from worker.ecommerce_data;
#Repeate Customer
SELECT 
    COUNT(Customer_id) AS total_customer,
    COUNT(DISTINCT Customer_id) AS uniq,
    (COUNT(Customer_id) - COUNT(DISTINCT Customer_id)) AS Reapete_Customer
FROM
    worker.ecommerce_data;

#Repeated ID Wise
SELECT 
    Customer_id, COUNT(Customer_id) AS Total_customer
FROM
    worker.ecommerce_data
GROUP BY Customer_id
ORDER BY Total_customer DESC;

#State Wise sealing
SELECT 
    State,
    SUM(Quantity) AS Total_quantity,
    SUM(Price) AS Total_price,
    SUM(Price * Quantity) AS Quantity_wise
FROM
    worker.ecommerce_data
GROUP BY State
ORDER BY Quantity_wise DESC;
  
#3# INVENTORY MANAGEMENT:

#1# Stock level by product
SELECT 
    *
FROM
    worker.ecommerce_data;

SELECT 
    product_id, SUM(Quantity) AS Total_Stock
FROM
    worker.ecommerce_data
GROUP BY Product_id
ORDER BY Total_Stock DESC;

#2# low stock product:

SELECT 
    product_id, SUM(Quantity) AS Total_Stock
FROM
    worker.ecommerce_data
GROUP BY Product_id #order by Total_stock desc
HAVING Total_Stock < 10
order by Total_stock desc ;


##3## MARKET ANALYSIS:

#1# CONVERSION SET
SELECT 
    *
FROM
    worker.ecommerce_data;
SELECT 
    COUNT(*) AS Total_order,
    COUNT(DISTINCT Customer_id) AS Total_customer,
    COUNT(*) / COUNT(DISTINCT Customer_id) AS Conversion_rate
FROM
    worker.ecommerce_data;
    
   #-2-#  revenue by marketing channel--#
   
SELECT 
    Product_id, SUM(Quantity) AS Total_stock
FROM
    worker.ecommerce_data
GROUP BY Product_id
HAVING Total_stock < 10;
   
##5## TIME BASE ANALYSIS##

#1#Sales by month#

    SELECT 
    #DATE_FORMAT(order_time) AS month,
    Order_Date as month,sum(Price) as Total_price,sum(Quantity) as Total_quantity,
    SUM(Price * Quantity) AS Total_sales
FROM
    worker.ecommerce_data
GROUP BY Order_Date
order by Total_sales desc;







