{% macro stage_ingest(table_name) %}
select *
from {{ source('raw', table_name | upper) }}
{% endmacro %}