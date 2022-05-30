 with score_comparison as (

    select * from {{ source('fandango', 'fandango_score_comparison') }}
),

final as (
    select
	
	md5(film)   as movie_key,
    film    as movie_name,
	rottentomatoes  as rottentomatoes_score,
	rottentomatoes_user,
	metacritic,
	metacritic_user,
	imdb    as imdb_score,
	fandango_stars,
	fandango_ratingvalue    as fandango_rating_value,
	rt_norm as rottentomatoes_norm,
	rt_user_norm    as rottentomatoes_user_norm,
	metacritic_norm,
	metacritic_user_nom,
	imdb_norm,
	rt_norm_round   as rottentomatoes_norm_round,
	rt_user_norm_round  as rottentomatoes_user_norm_round,
	metacritic_norm_round,
	metacritic_user_norm_round,
	imdb_norm_round,
	metacritic_user_vote_count,
	imdb_user_vote_count,
	fandango_votes,
	fandango_difference
    
    FROM score_comparison
)

select * from final
