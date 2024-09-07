select * from {{ref("accident")}}
where Day_of_Week in {{'Thursday','Friday'}}