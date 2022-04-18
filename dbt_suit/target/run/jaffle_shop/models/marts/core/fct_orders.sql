

      create or replace transient table SDC_USER.GIOVANIMIGUEL.fct_orders  as
      (with orders as (
    select *
    from
        SDC_USER.GIOVANIMIGUEL.stg_orders
),
payments as (
    select *
    from
        SDC_USER.GIOVANIMIGUEL.stg_payments
),
order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount
    from
        payments
    group by 1
)
select
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    coalesce(order_payments.amount, 0) as amount
from
    orders
left join
    order_payments
        using (order_id)
      );
    