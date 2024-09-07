{{ config(materialized="ephemeral") }}
select *
from {{ source("flake2", "ACCIDENT") }}
where "JUNCTION_DETAIL" = 'Crossroads'
