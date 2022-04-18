
    
    

select
    id as unique_field,
    count(*) as n_records

from sdc_user.giovanimiguel.customers
where id is not null
group by id
having count(*) > 1


