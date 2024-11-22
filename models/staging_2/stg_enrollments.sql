with raw as(
    select * from {{source("SF_sources","enrollments")}}
)
select * from raw