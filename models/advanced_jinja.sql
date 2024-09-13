{# Using loop.last #}
{% set payment_mode=dbt_utils.get_column_values(source('flake1','Payments'), 'PAYMENT_MODE') %}
select 
{% for i in payment_mode %}
sum(case when PAYMENT_MODE='{{i}}' then SALES end) as {{i}}_SALES
{% if not loop.last %},{%endif%}
{% endfor %}
from {{source('flake1','Payments')}}

{# Using loop.first #}
{% set payment_mode=dbt_utils.get_column_values(source('flake1','Payments'), 'PAYMENT_MODE') %}
select 
{% for i in payment_mode %}
{%- if not loop.first %},{%endif%}sum(case when PAYMENT_MODE='{{i}}' then SALES end) as {{i}}_SALES
{% endfor %}
from {{source('flake1','Payments')}}

{# Using lower on iterator #}
{% set payment_mode=dbt_utils.get_column_values(source('flake1','Payments'), 'PAYMENT_MODE') %}
select 
{% for i in payment_mode %}
{%- if not loop.first %},{%endif%}sum(case when PAYMENT_MODE='{{i}}' then SALES end) as {{i | lower}}_SALES
{% endfor %}
from {{source('flake1','Payments')}}

{# Using Index #}
{% set payment_mode=dbt_utils.get_column_values(source('flake1','Payments'), 'PAYMENT_MODE') %}
select 
{% for i in payment_mode %}
{%- if loop.index>1 -%},{%endif%}sum(case when PAYMENT_MODE='{{i}}' then SALES end) as {{i | lower}}_SALES
{% endfor %}
from {{source('flake1','Payments')}}

{# Using Length #}
{% set payment_mode=dbt_utils.get_column_values(source('flake1','Payments'), 'PAYMENT_MODE') %}
select 
{% for i in payment_mode %}
sum(case when PAYMENT_MODE='{{i}}' then SALES end) as {{i | lower}}_SALES{% if loop.index<loop.length %},{% endif -%}
{% endfor %}
from {{source('flake1','Payments')}}

{# Jinja over a list #}
{% set a=['a','b','c'] -%}
{% for i in a -%}
{{i}}
{% endfor -%}