select * from business

---------------------------------------------------------------------------------------------------------------------------------------Retrieve the top 5 cities by total revenue generated, not by number of orders.

--Q1 Retrieve the top 5 cities with the highest number of customer ratings.

select distinct city, count(rating) as highest_number  from business
where rating is not null
group by city
order by highest_number  desc
limit 5

select * from business

--Q2 Find the total number of orders placed on the platform.


select  count(order_id) as total_order from business

--Q3 List all distinct product categories available in the dataset

select distinct product from business

select * from business

--Q4 Retrieve all orders where the order value is greater than ₹10,000

select * from business
where quantity * price > 10000

--Q5 Find the total revenue generated from all orders.

select sum(quantity * price) as total_revenue
from business

select * from business

--Q6 Display the number of customers in each city.

select city,count(order_id) from business
where city is not null
group by city

select * from business

--Q7 Find the average product rating across the platform.

select avg(rating) as product_rating , platform
from business
group by platform

--Q8 List the top 10 most recently placed orders.

select * from business 
order by order_date desc
limit 10

---------------------------------------------------------------------------------------------------------
--Q9 Retrieve the top 5 cities by total revenue generated, not by number of orders.

select city , sum(quantity * price) as total_revenue
from business
group by city
limit 5

--Q10 Find the top 10 highest-rated products 

select product , count(rating) as Highest_rated
from business
group by product 
order by Highest_rated desc
limit 10

select * from business
 
--Q11 Calculate the average order value (AOV) for each city.

select city,avg(quantity*price) 
from business
group by city

--Q12 Retrieve the top 3 product categories contributing the highest revenue.

select category , sum(quantity * price) as highest_revenue
from business
group by category
order by highest_revenue desc
limit 3

select * from business

--Q13 Find the most popular product category in each city.

SELECT
    city,
    category,
    total_revenue
FROM (
    SELECT
        city,
        category,
        SUM(quantity * price) AS total_revenue,
        RANK() OVER (
            PARTITION BY city
            ORDER BY SUM(quantity * price) DESC
        ) AS rnk
    FROM business
    GROUP BY city, category
) ranked_data
WHERE rnk = 1;


 
