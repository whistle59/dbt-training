{% macro strip_film_name(column_name) -%}

    substr({{column_name}}, 0, len({{column_name}})- 6)

{%- endmacro %}