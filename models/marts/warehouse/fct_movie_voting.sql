with fandango_scrape as (

    select * from {{ ref('stg_fandango__scrape') }}

),

fandango_scores as (

    select * from {{ ref('stg_fandango__score_comparison') }}

),

final as (

    select
        fandango_scores.movie_id,
        fandango_scrape.scrape_vote_count,
        fandango_scores.metacritic_user_vote_count,
        fandango_scores.imdb_user_vote_count,
        fandango_scores.fandango_votes,
        fandango_scores.fandango_difference

    from fandango_scores

    left join fandango_scrape
        on fandango_scores.movie_id = fandango_scrape.movie_id

)

select * from final