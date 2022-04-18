
  create or replace  view SDC_USER.GIOVANIMIGUEL.my_second_dbt_model 
  
   as (
    -- Use the `ref` function to select from other models

select *
from SDC_USER.GIOVANIMIGUEL.my_first_dbt_model
where id = 1
  );
