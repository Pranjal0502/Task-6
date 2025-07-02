select category_name
from categories
where category_id IN (
select category_id
from products
where price > 500);

select total_amount
from orders
where order_id IN (
select order_id
from payments
where payment_method = "Credit Card");

select * 
from orders o
where EXISTS (
    select 1
    from payments p 
    where p.order_id = o.order_id AND p.status = 'Success'
);

select name, address
from customers c
where EXISTS (
    select 1
    from orders o
    join payments p ON o.order_id = p.order_id
    where o.user_id = c.customer_id AND p.payment_method = 'UPI'
);




