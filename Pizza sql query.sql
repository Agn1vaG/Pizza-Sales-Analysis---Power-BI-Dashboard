

-- Key Performance Indicator 

select* 
from pizza_sales

select round(sum(total_price) , 2) 
as Total_Revenue
from pizza_sales

select round((sum (total_price) / count(distinct order_id)),2) 
as Avg_Order_Value
from pizza_sales

select sum(quantity) 
as Total_Pizza_Sold
from pizza_sales

select count(distinct order_id) 
as Total_Orders 
from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Avg_Pizzas_per_order
from pizza_sales


-- Charts 

select * 
from pizza_sales

select datename( dw , order_date) as Order_Date,
count(distinct order_id) as Total_Orders
from pizza_sales
group by datename( dw , order_date)

select datename( month , order_date) as Order_Month,
count (distinct order_id) as Total_Orders
from pizza_sales
group by datename( month , order_date)
order by Total_Orders desc

select pizza_category, 
sum(total_price) as Total_Sales,
round( sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as PCT
from pizza_sales
group by pizza_category 

select pizza_category, 
cast(sum(total_price) as int) as Total_Sales,
cast( sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as PCT
from pizza_sales
group by pizza_category 

select pizza_size,
cast(sum(total_price) as int) as Total_Sales,
cast( sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT desc

select top 5 pizza_name, cast( sum (total_price) as decimal (10,2)) as Total_Revenue 
from pizza_sales
group by pizza_name
order by Total_Revenue desc

select top 5 pizza_name, cast( sum (total_price) as decimal (10,2)) as Total_Revenue 
from pizza_sales
group by pizza_name
order by Total_Revenue asc

select top 5 pizza_name, cast( sum (quantity) as decimal (10,2)) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc

select top 5 pizza_name, cast( sum (quantity) as decimal (10,2)) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity asc


select top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc
