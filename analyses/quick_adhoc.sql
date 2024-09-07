select * from {{source("flake2","ACCIDENT")}}
where "DAY_OF_WEEK"='Friday'