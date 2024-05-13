create database Ecommerce;
use Ecommerce;

#Printing all the column for getting info.
select * from transactions_new;
select distinct * from prod_cat_info;
select * from customers_new;

# We are creating a new column as join id tehre will join of prod_cat_code and prod_subcat_code we are creating .
alter table prod_cat_info add column join_id varchar(25);
alter table transactions_new add column join_id varchar(25);
update prod_cat_info set join_id = concat(prod_cat_code , " " , prod_sub_cat_code);
update transactions_new set join_id = concat(prod_cat_code , " " , prod_subcat_code);

#And Now we are removing twon column from prod_cat_info
alter table prod_cat_info drop column prod_cat_code , drop column prod_sub_cat_code;

#creating a merged tables using inner join 
CREATE  TABLE merged_ecommerce AS
SELECT *
FROM customers_new
INNER JOIN transactions_new ON customers_new.customer_Id = transactions_new.cust_id
INNER JOIN prod_cat_info ON transactions_new.join_id = prod_cat_info.join_id_prod;
select * from merged_ecommerce;

# Finding the null values and romoving them 
select * from merged_ecommerce;

#descriptions 
describe merged_ecommerce;

#converting the Dob column in date 
update ecommerce.merged_ecommerce set DOB = str_to_date(DOB,"%d/%m/%Y");
update ecommerce.merged_ecommerce set tran_date = str_to_date(tran_date,"%d-%m-%Y");

#(1 which Store most frequently used for transactions?
select Store_type, count(Gender) Value_count from merged_ecommerce group by Store_type order by Value_count desc;

#(2 What is the count of Male and Female customer count in our datasets
select Gender, count(Gender) from merged_ecommerce Group by Gender;

#(3 From which city do we have the maximum number of customers and how many?
select city_code, count(city_code) as value_count from merged_ecommerce group by city_code order by value_count desc limit 1;

#(4 How many sub_catogries are there under the books catagory?
select distinct prod_subcat as Book_cat from merged_ecommerce where prod_cat = "Books" ;

#(5 what is the maximum quantity of products ever ordered?
select prod_cat, sum(Qty) as Sum_of_qty from merged_ecommerce group by prod_cat order by Sum_of_qty desc limit 1;

#(6 What is the net total revenue genrated in catagories Electronics and books?
SELECT 
    prod_cat, SUM(total_amt) AS revenue
FROM
    (SELECT 
        prod_cat, total_amt
    FROM
        merged_ecommerce
    WHERE
        prod_cat IN ('Books' , 'Electronics')) AS cat_revenue
GROUP BY prod_cat;

#(7 How many customer have >10 transaction with us, excluding returns?
select customer_Id, count(Qty) as Transactions from (select customer_Id,Qty from merged_ecommerce where Qty >0) as Accepted_order group by customer_Id Having Transactions >10 order by Transactions desc;

#(8 What is the combined revenue earned from electronics and clothing categories from Flagship sttore?
select sum(total_amt) as Combined_revenue from merged_ecommerce where prod_cat in ("Electronics","Clothing") and Store_type="Flagship store";

#(9 what is the total revenue generated from "Male" customer in  "Electronics" category? Output should be total  revenue by prod_subcat.
select prod_subcat,Gender,sum(total_amt) as Male_Revenue from merged_ecommerce group by prod_subcat,Gender having Gender = "M";

#(10 What is the percentage of total sales and total return with respect to tehir product sub category.
select prod_subcat,sum(total_sales)/62683 
*100 as total_sales_percentage ,sum(total_return)/6627 * 100 as total_return_percentage from
(select prod_subcat,
sum(case when Qty> 0 then Qty else 0 End) as Total_sales,
sum(case when Qty <0 then -Qty else 0 end) as total_return from merged_ecommerce
group by prod_subcat) as agg group by prod_subcat;

#(11 which store type sells the maximum products; by value of sales ammount and by quentity.
select Store_type,sum(total_amt) as total_sales_amt,sum(Qty) as total_quentity from merged_ecommerce
group by Store_type order by total_quentity desc limit 1;

#(13 what is the total sales and total return by product over month?

select _month,prod_cat,sum(abs(total_return)) as total_return,sum(total_sales) as total_sales from (select prod_cat, month(tran_date) as _Month,(case when Qty <0 then Qty else 0 end) as total_return,(case when Qty> 0 then Qty else 0 End) as Total_sales from merged_ecommerce) as ss group by _month,prod_cat order by _month;
