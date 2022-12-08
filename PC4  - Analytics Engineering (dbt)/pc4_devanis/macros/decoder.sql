{% macro decode_vendor(VendorID) %}
    CASE {{ VendorID }}
        WHEN 1 THEN 'Creative Mobile Technologies'
        WHEN 2 THEN 'VeriFone Inc'
    END
{% endmacro %}

{% macro decode_ratecode(RatecodeID) %}
    CASE {{ RatecodeID }}
        WHEN 1 THEN 'Standard Rate'
        WHEN 2 THEN 'JFK'
        WHEN 3 THEN 'Newark'
        WHEN 4 THEN 'Nassau or Westchester'
        WHEN 5 THEN 'Negotiated Fare'
        WHEN 6 THEN 'Group Ride'
    END
{% endmacro %}

{% macro decode_payment(payment_type) %}
    CASE {{ payment_type }}
        WHEN 1 THEN 'Credit Card'
        WHEN 2 THEN 'Cash'
        WHEN 3 THEN 'No Charge'
        WHEN 4 THEN 'Dispute'
        WHEN 5 THEN 'Unknown'
        WHEN 6 THEN 'Voided Trip'
    END
{% endmacro %}

