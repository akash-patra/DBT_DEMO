{% macro function1(x)%}

CASE 
    WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE
    THEN 'PAST'
    ELSE 'FUTURE'
END
{% endmacro %}


{% macro get_season(y)%}
CASE
    WHEN MONTH(TO_TIMESTAMP({{(y)}})) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{(y)}})) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{(y)}})) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN'
END
{% endmacro %}

{% macro day_type(x) %}
CASE
    WHEN DAYNAME(TO_TIMESTAMP({{(x)}})) in ('Sat','Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END
{% endmacro %}