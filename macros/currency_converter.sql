{% macro currency_converter(currency_column, value_column) %}
    {% if currency_column == 'Rupees' %}
        {{ value_column }}
    {% elif currency_column == 'Yen' %}
        {{ value_column }} * 0.59
    {% elif currency_column == 'Dollars' %}
        {{ value_column }} * 84
    {% elif currency_column == 'Pound' %}
        {{ value_column }} * 110
    {% endif %}
{% endmacro %}

