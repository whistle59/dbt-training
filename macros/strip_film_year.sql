
{% macro strip_film_year(column_name) -%}

    substr(right({{column_name}}, 6), 2, 4)

{%- endmacro %}