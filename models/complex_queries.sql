select *
from {{source('flake1','Payments')}}

select 
sum(case when PAYMENT_MODE='UPI' then SALES end) as UPI_SALES
,sum(case when PAYMENT_MODE='DC' then SALES end) as DC_SALES
,sum(case when PAYMENT_MODE='CC' then SALES end) as CC_SALES
,sum(case when PAYMENT_MODE='CASH' then SALES end) as CASH_SALES
,sum(case when PAYMENT_MODE='VOUCHER' then SALES end) as VOUCHER_SALES
FROM {{source('flake1','Payments')}}

-- Jinja + SQL code
-- {% set payment_mode=['UPI','DC','CC','CASH','VOUCHER']%}
{% set payment_mode=dbt_utils.get_column_values(source('flake1','Payments'), 'PAYMENT_MODE') %}
select 
{% for i in payment_mode %}
sum(case when PAYMENT_MODE='{{i}}' then SALES end) as {{i}}_SALES,
{% endfor %}
from {{source('flake1','Payments')}}

