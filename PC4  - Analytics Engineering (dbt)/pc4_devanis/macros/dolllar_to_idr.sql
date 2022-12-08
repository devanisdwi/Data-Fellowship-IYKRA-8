{% macro dollar_to_idr(total_amount) %}
    {{ total_amount }} * 15000
{% endmacro %}
