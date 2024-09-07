--Data Types in Jinja
{{"Kaustubh"}}
{{222}}
{{[1,'AA','B']}}
{{{"name":'Kaustubh',"college":'VJTI'}}}
{{False}}

--Variables
-- Can replace the string mentioned here with anything: list, number, dictionary, boolean
-- All the data types that you specified above can be saved in the variable 
{%- set var1='Kaustubh' -%}
{{var1}}

-- Conditional Logics
-- IF Condition
{% if 1==1 %}
    {{" Inside the first block "}}
{% else %}
    {{" Inside the second block "}}
{% endif %}

-- IF-ELSEIF Condition
{% if 1==2 %}
    {{" Inside the first block "}}
{%  elif 2==2 %}
    {{" Inside the second block "}}
{% else %}
    {{" Inside the second block "}}
{% endif %}

-- FOR Loop
{%- for i in [1,2,3] %}
{{i}}
{%- endfor %}