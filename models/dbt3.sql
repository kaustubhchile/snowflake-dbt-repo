select * from {{source("flake1","USERS")}}
where ID<4