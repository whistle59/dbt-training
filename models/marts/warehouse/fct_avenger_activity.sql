-- IMPORTS
with avengers_history as (

    select * from {{ ref('stg_avengers__avengers_history') }}

),

-- CUSTOM LOGIC
return_death_counts as (

    select
        avenger_id,

        iff(death_1 = 'YES', 1, 0) + 
        iff(death_2 = 'YES', 1, 0) + 
        iff(death_3 = 'YES', 1, 0) + 
        iff(death_4 = 'YES', 1, 0) + 
        iff(death_5 = 'YES', 1, 0) as total_deaths,

        iff(return_1 = 'YES', 1, 0) + 
        iff(return_2 = 'YES', 1, 0) + 
        iff(return_3 = 'YES', 1, 0) + 
        iff(return_4 = 'YES', 1, 0) + 
        iff(return_5 = 'YES', 1, 0) as total_returns

    from avengers_history

),

-- FINAL CTE
final as (

    select
        avengers_history.avenger_id,
        avengers_history.num_of_appearances,
        return_death_counts.total_deaths,
        return_death_counts.total_returns

    from avengers_history

    left join return_death_counts
        on avengers_history.avenger_id = return_death_counts.avenger_id

)
-- FINAL SELECT
select * from final