select * from {{ref('marketing_stg')}} 
where Sales>1000
