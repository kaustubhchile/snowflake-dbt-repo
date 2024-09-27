{{
    config(
        materialized= 'table'
    )
}}
select * from {{source("flake1","testing")}}