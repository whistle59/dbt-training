with avenger_details as (

    select * from {{ ref('dim_avengers') }}

),

avenger_activity as (

    select * from {{ ref('fct_avenger_activity') }}

),

final as (

    select
        avenger_details.avenger_id,
        avenger_details.avenger_name,
        avenger_details.marvel_wikia_url,
        avenger_details.is_current,
        avenger_details.probationary_intro,
        avenger_details.full_reserve_intro,
        avenger_details.year_joined,
        avenger_details.years_since_joining,
        avenger_details.death_1,
        avenger_details.return_1,
        avenger_details.death_2,
        avenger_details.return_2,
        avenger_details.death_3,
        avenger_details.return_3,
        avenger_details.death_4,
        avenger_details.return_4,
        avenger_details.death_5,
        avenger_details.return_5,
        avenger_activity.num_of_appearances,
        avenger_activity.total_deaths,
        avenger_activity.total_returns,
        avenger_details.notes

    from avenger_details

    left join avenger_activity
        on avenger_details.avenger_id = avenger_activity.avenger_id

)

select * from final