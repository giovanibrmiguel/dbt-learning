with customers as (
    select
        id as customer_id,
        first_name,
        last_name
    from
        sdc_user.giovanimiguel.customers
)

select * from customers