WITH daily_weather as (
select 
date(time) AS daily_weather,
weather,
temp,
pressure,
humidity,
clouds
from 
{{ source('demo', 'weather') }}
--limit 20
),

daily_weather_agg as (
select 
daily_weather,
weather,
--count(weather),
ROUND(avg(temp),2) as avg_temp,
ROUND(avg(pressure),2) as avg_pressure,
ROUND(avg(humidity),2) as avg_humidity,
ROUND(avg(clouds),2) as avg_clouds
--row_number() over (PARTITION BY daily_weather order by count(weather) desc) AS row_num
from daily_weather group by daily_weather,weather
--qualify row_num =1
qualify row_number() over (PARTITION BY daily_weather order by count(weather) desc) =1
)
select * from daily_weather_agg