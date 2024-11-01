select * 
from {{source("flake1","Financials")}}

{% set currency_list = dbt_utils.get_filtered_columns_in_relation(source("flake1", "Financials"), except=["CURRENCY", "DISCOUNT"]) %}
select *,
{% for i in currency_list %}
    {{currency_converter('Currency', i)}} as {{i}}_in_Rupees,
{% endfor %}
from {{ source('flake1', 'Financials') }}

