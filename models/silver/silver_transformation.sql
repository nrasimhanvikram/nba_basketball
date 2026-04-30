{{ config(materialized='view') }}

with source_data as (

    select *
    from {{ ref('bronze_basketball') }}

),

cleaned as (
    select distinct
        cast(s.rank as integer)                    as player_rank,
        trim(s.player)                             as player_name,
        trim(s.position)                           as player_position,
        trim(s.teams)                              as team_history,
        coalesce(s.total_points,0)::integer        as total_points,
        coalesce(s.total_games,0)::integer         as total_games,
        coalesce(s.points_per_game,0)::float       as points_per_game,
        coalesce(s.field_goals,0)::integer         as field_goals,
        coalesce(s.three_points_goals,0)::integer  as three_points_goals,
        coalesce(s.free_shots,0)::integer          as free_shots,
        trim(s.born)                               as born,
        coalesce(s.active_player,0)::integer       as active_player,
        trim(s.hall_of_fame)                       as hall_of_fame,
        upper(trim(s.country))                     as country_code
    from source_data s
)
select *
from cleaned