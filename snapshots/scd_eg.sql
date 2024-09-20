{% snapshot scd_table %} 
-- Check_Column strategy
{{
     config(
         schema='snapshots',
         strategy='check',
         unique_key='ID',
         check_cols=['FIRST_NAME', 'LAST_NAME'],
     )
}}

-- Updated_At strategy
-- {{
--         config(
--             schema='snapshots',
--             strategy='timestamp',
--             unique_key='ID',
--             updated_at='updated_at',
--         )
-- }}
select * FROM {{source("flake1","SCD")}}
{% endsnapshot %}