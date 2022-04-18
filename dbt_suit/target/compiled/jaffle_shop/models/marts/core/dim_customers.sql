with customers as (
    select * from SDC_USER.GIOVANIMIGUEL.stg_customers
),
orders as (
    select * from SDC_USER.GIOVANIMIGUEL.fct_orders
),
customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from 
        orders
    group by 1
)
select
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
    customer_orders.lifetime_value
from 
    customers
left join 
    customer_orders 
        using (customer_id)