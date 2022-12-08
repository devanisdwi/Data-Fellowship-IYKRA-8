{% macro create_extra_type(extra) %}
    CASE {{ extra }}
        WHEN 0 THEN 'No Extra'
        WHEN 0.50 THEN 'Rush Hour'
        WHEN 1 THEN 'Overnight'
    END
{% endmacro %}
