 with score_comparison as (

    select * from {{ source('fandango', 'fandango_score_comparison') }}
),

final as (
    select
	
	md5(film)   as movie_id,
	{{strip_film_name('film')}}	as movie_name,
	{{strip_film_year('film')}}	as movie_year,
	 film as movie_name_with_date,
	rottentomatoes  as rotten_tomatoes_score,
	rottentomatoes_user	as rotten_tomatoes_user,
	metacritic	as metacritic_score,
	metacritic_user,
	imdb    as imdb_score,
	fandango_stars,
	fandango_ratingvalue    as fandango_rating_value,
	rt_norm as rotten_tomatoes_norm,
	rt_user_norm    as rotten_tomatoes_user_norm,
	metacritic_norm,
	metacritic_user_nom,
	imdb_norm,
	rt_norm_round   as rotten_tomatoes_norm_round,
	rt_user_norm_round  as rotten_tomatoes_user_norm_round,
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
