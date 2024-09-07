select *,
{{bmi('WEIGHT','HEIGHT')}} AS BMI
from {{source('flake1','olympics')}}
where medal='Gold' and YEAR>=1950 and season='Summer' and country='India'
order by year
