{% macro currency_converter(currency_column, value_column) %}
    case
        when {{ currency_column }} = 'Rupees' then {{ value_column }}
        when {{ currency_column }} = 'Yen' then {{ value_column }} * 0.59
        when {{ currency_column }} = 'Dollars' then {{ value_column }} * 84
        when {{ currency_column }} = 'Pound' then {{ value_column }} * 110
        else {{ value_column }}
    end
{% endmacro %}