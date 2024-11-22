with students as (
    select * from {{ref("stg_students")}}
),
enrollments as (
    select * from {{ref("stg_enrollments")}}
),
courses as (
    select * from {{ref("stg_courses")}}
),

final as(
    select s.*,c.*
    from students s 
    left join enrollments e on s.student_id=e.enrollment_id
    inner join courses c on e.course_id=c.course_id
)
select * from final