-- 1
lock table customers write;

set foreign_key_checks = 0;

alter table customers 
modify customer_id integer auto_increment;

alter table customers modify customer_first_name varchar(20) null,
modify customer_last_name varchar(20) null,
modify customer_address varchar (50) null,
modify customer_city varchar(20) null,
modify customer_state char(2) null,
modify customer_zip char(5) null,
modify customer_phone char(10) null
;


insert into  customers (customer_first_name, customer_last_name)
values ("Nathan", "Rivera"),
		("thom", "something");
        
select * from customers;

set foreign_key_checks = 0;

unlock tables;
-- 2
unlock tables;

SET SQL_SAFE_UPDATES = 0;

drop view if exists CA_CUSTOMERS;

create view CA_CUSTOMERS as
select * from customers
where customer_state = "CA";

update CA_CUSTOMERS
set customer_last_name = 'Lacie'
where customer_last_name = 'Lacy';

select * from CA_CUSTOMERS;

-- 3
unlock tables;

drop view if exists SHIPPING_TIME;

create view SHIPPING_TIME as
select customers.customer_first_name, customers.customer_last_name, orders.order_date, orders.shipped_date, datediff(orders.shipped_date, orders.order_date) as days_to_fulfill
from customers
join orders
on orders.customer_id = customers.customer_id;

select * from SHIPPING_TIME
order by days_to_fulfill desc;

select * from shipping_time
where days_to_fulfill < 10;

select * from shipping_time
where days_to_fulfill > 30;

-- 4
drop view if exists salesdata;

create view SalesData as
select orders.order_id, items.item_id, (order_details.order_qty * items.unit_price) as ItemTotal, items.title, artists.artist_id
from orders
join order_details
on orders.order_id = order_details.order_id
join items
on order_details.item_id = items.item_id
join artists
on items.artist_id = artists.artist_id
order by artists.artist_id
;

select artist_id, sum(ItemTotal) as TotalSales
from SalesData;
