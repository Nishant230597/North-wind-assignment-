 -- 1
 select * from shippers;
 
 -- 2
 select * from categories;
 
 select category_name, description  from categories ;

-- 3 
 SELECT * FROM northwind.employees;
 
select first_name , last_name , employee_id from employees where title = 'sales representative'; 
-- 4
select first_name , last_name , employee_id from employees where title = 'sales representative' and country = 'usa' ;

-- 5
SELECT * FROM northwind.orders;
 Select employee_id, order_id , order_date  from orders  where employee_id = 5 ;
 
 -- 6
 SELECT * FROM suppliers;
 
 select supplier_id , company_name , contact_title from suppliers where contact_title != 'marketing manager' ;

-- 7
 SELECT * FROM northwind.products;
 Select product_id , Product_name  from products where product_name  like '%queso%' ; 
 
 -- 8
 select order_id , customer_id , ship_country from orders where ship_country in ( 'france' , 'belgium' ) ; 
 select order_id , customer_id , ship_country from orders where ship_country = 'france' or ship_country ='belgium' ;
 
 -- 9
 select * from orders;
 
select order_id , customer_id , order_date , shipped_date , ship_country from orders where ship_country in  ('Brazil' , 'Mexico' , 'Argentina' , 'Venezuela') ; 

-- 10
select * from employees;
select first_name , last_name , title , birth_date from employees order by birth_date desc ;

--  12 
select * from employees;
select first_name , last_name ,  concat(first_name , '  ' ,  last_name) as full_name from employees ;

 -- 13
select * from order_details ;
select order_id , product_id , unit_price  , quantity , (unit_price * quantity ) as Total from order_details
order by order_id and product_id ;

-- 14
Select * from customers;
select count(customer_id) from customers ;

-- 15
select * from orders ;
 select order_date as first_order from orders where order_id = 10248 ;

-- 16
select * from customers;
select country from customers group by country ;

-- 17
select contact_title ,  count(customer_id) as total_count from customers group by contact_title;

-- 18
select * from products ;
select product_id ,Product_name ,  suppliers.company_name from products 
join suppliers on products . supplier_id = suppliers.supplier_id ;

-- 19
select * from shippers ;
select * from orders ;

select order_id , order_date , shippers.company_name from orders join shippers on orders.ship_via = shippers.shipper_id 
 where order_id < 10300 ;
 
 -- 20
	select* from products ;
   select categories.category_name  ,  count(product_id) No_Of_product from products join categories on products . category_id = categories. category_id
 group by category_name order by count(product_id) desc ;
  
  -- 21
  select *  from customers ; 
  select country , city, count(customer_id) as Numbers_of_custommers   from customers group by country , city order by Numbers_of_custommers desc ;
 
 -- 22
 select * from products;
 select product_id , product_name , units_in_stock ,  reorder_level from products where units_in_stock < reorder_level 
 order by product_id ;
 
 -- 23
 select * from products ;
 select product_id , product_name , units_in_stock , units_on_order , reorder_level , discontinued from products
 where units_in_stock + units_on_order  <= reorder_level and discontinued = 0 ;
 
-- 24 *****
select* from customers ;
select customer_id , 
company_name , 
region from customers 
 order by case  when region is null then 1 else 0 end , region , customer_id ;


--  25  
select * from orders ; 
 select  ship_country  , avg(freight) from orders group by ship_country order by avg(freight) desc limit 3 ; 
 
-- 26 **
select  ship_country , avg(freight)  from orders where order_date >=  '1996-01-01' and order_date < '1997-01-01'	
group by ship_country order by avg(freight) desc  ;

select* from orders ;



-- 28 **
select max(order_date) from orders ;
select ship_country , avg(freight) from orders group by order_id order by >= '1997-05-06' and ;

-- We're doing inventory, and need to show information like the below, for all orders. Sort by OrderID and Product ID.


-- 29 
select * from orders;
select * from employees ;
select *  from products ;
select employees.employee_id ,employees.last_name , orders.order_id , products.product_name , order_details.quantity 
from employees join orders on employees.employee_id = orders.employee_id
 join order_details on  orders.order_id = order_details.order_id 
 join products on order_details.product_id  =  products.product_id
 
 order by orders.order_id and products.product_id ;

-- 30
select* from customers ;
select * from orders ;

select 
     customers.customer_id as customers_name, 
     orders.customer_id as order_detail 
     from customers 
       left join orders on  orders.customer_id = customers.customer_id 
   where orders.customer_id is null ;

-- 31
select * from customers ;
select * from orders ;
 select 
   customers.customer_id , orders.customer_id
 from customers left join orders on customers.customer_id = orders.customer_id and orders.employee_id = 4 
 where orders.customer_id is null  ;
