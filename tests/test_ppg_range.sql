select *
from {{ ref('silver_transformation') }}
where points_per_game < 0
   or points_per_game > 100

   