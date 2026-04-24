select *
from {{ source('retail_raw', 'TRANSACTIONDETAILS') }}