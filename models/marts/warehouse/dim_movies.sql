with fandango_scrape as (

    select * from {{ ref('stg_fandango__scrape') }}

),

fandango_scores as (

    select * from {{ ref('stg_fandango__score_comparison') }}

),

final as (

    select
        fandango_scrape.movie_id,
        fandango_scrape.movie_name,
        fandango_scrape.scrape_stars,
        fandango_scrape.scrape_rating,
        fandango_scores.movie_year,
        fandango_scores.rotten_tomatoes_score,
        fandango_scores.rotten_tomatoes_user,
        fandango_scores.metacritic_score,
        fandango_scores.metacritic_user,
        fandango_scores.imdb_score,
        fandango_scores.fandango_stars,
        fandango_scores.fandango_rating_value,
        fandango_scores.rotten_tomatoes_norm,
        fandango_scores.rotten_tomatoes_user_norm,
        fandango_scores.metacritic_norm,
        fandango_scores.metacritic_user_nom,
        fandango_scores.imdb_norm,
        fandango_scores.rotten_tomatoes_norm_round,
        fandango_scores.metacritic_norm_round,
        fandango_scores.metacritic_user_norm_round,
        fandango_scores.imdb_norm_round

    from fandango_scrape

    left join fandango_scores
        on fandango_scrape.movie_id = fandango_scores.movie_id

)

select * from final