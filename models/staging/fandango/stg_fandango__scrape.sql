with scrape_data as (

  select * from {{ source('fandango', 'fandango_scrape') }}
    
),

final as (

  select
      md5("FILM") as movie_id,
      "FILM" as movie_name,
      "STARS" as scrape_stars,
      "RATING" as scrape_rating,
      "VOTES" as scrape_vote_count
   
  from scrape_data

)

select * from final