{% macro handling_type__congestion_surcharge(congestion_surcharge) %}
    coalesce(congestion_surcharge, 0)
{% endmacro %}
