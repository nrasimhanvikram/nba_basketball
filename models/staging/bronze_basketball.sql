select *
from {{ source('raw', 'RAW_BASKETBALL') }}