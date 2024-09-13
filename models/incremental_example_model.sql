{{config(
    materialized='incremental'
)}}

select * from {{source('flake1','sales')}} t1

{% if is_incremental() %} {# will go into the loop if the incremental data is already added into the table #}
where 
t1.date > (select max(DATE) FROM {{this}}) {# wherever date is greater than max(date) only then load the data #}
{% endif %}