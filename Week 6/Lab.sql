select concat(order_id, " ", order_qty) as TotalItems from order_details
where order_id >= 600;


select concat(order_id, " ", order_qty) as TotalItems from order_details
where order_qty > 2;

select concat(orders.order_id, " ",  order_details.item_id, " ",  items.unit_price, " ", (order_details.order_qty * items.unit_price)) as Itemtotal from orders
join order_details
on orders.order_id = order_details.order_id
join items
on order_details.item_id = items.item_id
where orders.order_id > 400 and orders.order_id < 700;

select order_details.order_id, (order_details.order_qty * items.unit_price) as total from order_details
join items
on order_details.item_id = items.item_id
where (order_details.order_qty * items.unit_price) >= 40;

select concat(customers.customer_first_name, " ", customers.customer_last_name) as Customer, customers.customer_city, order_details.order_id, (order_details.order_qty * items.unit_price) as total 
from orders
join order_details
on orders.order_id = order_details.order_id
join customers
on orders.customer_id = customers.customer_id
join items
on order_details.item_id = items.item_id
where customers.customer_state = "CA"
order by customers.customer_city;

select items.title, sum(order_details.order_qty) as Quantity, sum(items.unit_price) as TotalSales
from order_details
join items
on order_details.item_id = items.item_id
group by items.title
order by sum(items.unit_price) desc;

select concat(customers.customer_first_name, " ", customers.customer_last_name) as customer, sum(items.unit_price) as Total
from items
join order_details
on items.item_id = order_details.item_id
join orders
on order_details.order_id = orders.order_id
join customers
on customers.customer_id = orders.customer_id
group by customers.customer_first_name
having sum(items.unit_price) > 50
order by sum(items.unit_price)  asc;

select sum(order_details.order_qty), artists.artist_name
from artists
join items
on items.artist_id = artists.artist_id
join order_details
on order_details.item_id = items.item_id
where order_details.order_qty in 
(select order_details.order_qty
from order_details)
group by artists.artist_name;

select artists.artist_name, sum(order_details.order_qty * items.unit_price) as Total
from artists
join items
on items.artist_id = artists.artist_id
join order_details
on order_details.item_id = items.item_id
group by artists.artist_name
order by Total desc
;

SET SQL_SAFE_UPDATES = 0;

-- question 10
select items.title, items.unit_price, round((items.unit_price + (items.unit_price * 0.1)), 2) as Price_increase
from artists
join items
on items.artist_id = artists.artist_id
;

set SQL_SAFE_UPDATES = 1;

select concat(customers.customer_first_name, " ", customers.customer_last_name) as Customer
from customers
join orders
on orders.customer_id = customers.customer_id
where orders.shipped_date is null
;


select items.title, sum(order_details.order_qty * items.unit_price) as TotalSales
from order_details
join items
on order_details.item_id = items.item_id
join orders
on orders.order_id = order_details.order_id
join customers
on orders.customer_id = customers.customer_id
where customers.customer_state = "NY";

select items.title, artist_name
from items
join artists
on items.artist_id = artists.artist_id
join order_details
on order_details.item_id = items.item_id
join orders
on orders.order_id = order_details.order_id
where not exists
(
	select items.item_id
    from orders
    where order_details.item_id is not null
)
;

select orders.order_id, orders.order_date, orders.shipped_date, (order_details.order_qty * items.unit_price) as Total
from orders
join order_details
on orders.order_id = order_details.order_id
join items
on order_details.item_id = items.item_id
join customers 
on orders.customer_id = customers.customer_id
where customers.customer_first_name = "Samuel" and customers.customer_last_name = "Jacobsen"
;

select concat(employees.first_name, " ", employees.last_name) as Employee, sum(order_details.order_qty * items.unit_price) as Total
from employees
join orders
on orders.employee_id = employees.employee_id
join order_details
on orders.order_id = order_details.order_id
join items
on order_details.item_id = items.item_id
group by employees.employee_id;