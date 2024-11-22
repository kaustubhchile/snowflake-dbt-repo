with raw as(
    select * from {{source("SF_sources","students")}}
),
final as (
    select *,
    datediff(year,date_of_birth,enrollment_date) as AGE,-- age
    year(enrollment_date) as Enrollment_Year,-- enrollment year
    First_name||' '||last_name as Full_Name,-- full names
    datediff(days,enrollment_date,CURRENT_DATE()) as days_passed-- number of days since enrollment
    from raw
)
select * from final