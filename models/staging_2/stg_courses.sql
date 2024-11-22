with raw as(
    select * from {{source("SF_sources","courses")}}
),
final as (

    select *,
        case 
            when credits=4 then 'Advanced'
            when credits=3 then 'Intermediate'
        else 'Beginners'
    end as level_of_course,
    case when CURRENT_DATE() between start_date and end_date then 'Active' else 'Inactive' end as Active_Flag,
    datediff(days,start_date,CURRENT_DATE()) as days_passed
    from raw
-- level of course
-- is the course still running
-- how many days have passed since the course started
)
select * from final