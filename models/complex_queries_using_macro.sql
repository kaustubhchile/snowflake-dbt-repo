select * 
from {{source("flake1","Financials")}}

-- {% set currency_list = dbt_utils.get_filtered_columns_in_relation(source("flake1", "Financials"), except=["COUNTRY", "DISCOUNT"]) %}
select 
currency_converter(COUNTRY, SALES) as 'SALES_in_Rupees',
currency_converter(COUNTRY, COST) as 'COST_in_Rupees'
from {{ source("flake1", "Financials") }}

