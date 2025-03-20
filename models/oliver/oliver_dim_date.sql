{{ config(
    materialized = 'table',
    schema = 'oliver_dw'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1990-01-01", "2050-12-31") }}
)

SELECT
Date_day as date_key,
Date_day,
Day_Of_Week,
month_name,
quarter_of_year,
year_number
from cte_date