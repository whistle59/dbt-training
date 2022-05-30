with avengers_history as (
    
    select * from {{ source('avengers', 'avengers_history') }}
),

final as (
    
    select id,
        death_5,
        death_4,
        nvl(name_alias, 'N/A') as avengers_name,
        notes,
        initcap(gender) as gender,
        year::integer as year_joined,
        probationary_introl as probationary_intro,
        honorary,
        current_ = 'YES' as is_current,
        md5(url) as avengers_id,
        url as marvel_wikia_url,
        appearances as num_of_appeareances,
        return_1,
        return_3,
        return_2,
        full_reserve_avengers_intro as full_reserve_intro,
        death_1,
        return_5,
        years_since_joining as years_since_joining,
        return_4,
        death_3,
        death_2,
        uploaded_at

    from avengers_history

)
select * from final