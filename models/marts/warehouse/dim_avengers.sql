with avengers_history as (

    select * from {{ ref('stg_avengers__avengers_history') }}

),

final as (

    select
        avenger_id,
        avenger_name,
        marvel_wikia_url,
        is_current,
        probationary_intro,
        full_reserve_intro,
        year_joined,
        years_since_joining,
        death_1,
        return_1,
        death_2,
        return_2,
        death_3,
        return_3,
        death_4,
        return_4,
        death_5,
        return_5,
        notes

    from avengers_history

)

select * from final