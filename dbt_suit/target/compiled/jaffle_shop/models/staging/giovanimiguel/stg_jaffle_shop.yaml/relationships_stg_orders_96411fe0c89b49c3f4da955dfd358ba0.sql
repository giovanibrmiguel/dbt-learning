
    
    

with child as (
    select customer_id as from_field
    from SDC_USER.GIOVANIMIGUEL.stg_orders
    where customer_id is not null
),

parent as (
    select customer_id as to_field
    from SDC_USER.GIOVANIMIGUEL.stg_customers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


