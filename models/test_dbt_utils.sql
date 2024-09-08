select *
from {{ref("accident")}}

{# Using dbt_utils.get_column_values to store the column name 'Country' of the table #}
{# This piece of code below will give you the list of all values present in the 'Country' column of the table olympics #}
{%- set list_of_jxn_detail= dbt_utils.get_column_values(ref("accident"), 'Junction_Detail') -%}
{{list_of_jxn_detail}}

{% for i in list_of_jxn_detail -%}
{{i}}
{% endfor -%}

{# For getting list of columns #}
{% set list_of_columns=adapter.get_columns_in_relation(source('flake1','olympics')) %}
-- {{list_of_columns}}
{% for i in list_of_columns -%}
{{i.column}}
{% endfor -%}

