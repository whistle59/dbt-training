with movie_details as (

    select * from {{ ref('dim_movies') }}

),

movie_voting as (

    select * from {{ ref('fct_movie_voting') }}

),

final as (

    select
        movie_details.movie_id,
        movie_details.movie_name,
        movie_details.movie_year,
        movie_details.rotten_tomatoes_score,
        movie_details.rotten_tomatoes_user,
        movie_details.metacritic_score,
        movie_details.metacritic_user,
        movie_details.imdb_score,
        movie_details.fandango_stars,
        movie_details.fandango_rating_value,
        movie_details.rotten_tomatoes_norm,
        movie_details.rotten_tomatoes_user_norm,
        movie_details.metacritic_norm,
        movie_details.metacritic_user_nom,
        movie_details.imdb_norm,
        movie_details.rotten_tomatoes_norm_round,
        movie_details.metacritic_norm_round,
        movie_details.metacritic_user_norm_round,
        movie_details.imdb_norm_round,
        movie_details.scrape_stars,
        movie_details.scrape_rating,
        movie_voting.metacritic_user_vote_count,
        movie_voting.imdb_user_vote_count,
        movie_voting.fandango_votes,
        movie_voting.fandango_difference,
        movie_voting.scrape_vote_count

    from movie_details

    left join movie_voting
        on movie_details.movie_id = movie_voting.movie_id

)

select * from final