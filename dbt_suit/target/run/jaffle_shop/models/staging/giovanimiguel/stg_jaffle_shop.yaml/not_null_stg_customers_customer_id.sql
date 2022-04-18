select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from SDC_USER.GIOVANIMIGUEL.stg_customers
where customer_id is null



      
    ) dbt_internal_test