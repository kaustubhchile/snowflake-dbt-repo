{% macro bmi(wt,ht) %}
    {% if wt is none %}
        10
    {% else %}
        ({{wt}}/({{ht}}*{{ht}}))*10000
    {% endif %}
{% endmacro %}
