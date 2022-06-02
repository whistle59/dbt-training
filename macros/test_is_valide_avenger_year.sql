{% test is_valid_avenger_year(model, column_name) %}

with validation as (
    select
        {{ column_name }}  as year_field

    from {{ model }}
),

validation_errors as (
    select
        year_field

    from validation

    -- All years should be later than 1900
    where year_field < 1900

)

Select * from validation_errors

{% endtest %}