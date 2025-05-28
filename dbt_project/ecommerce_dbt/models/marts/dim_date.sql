SELECT
  date_id,
  date_day,
  year,
  month,
  day,
  day_of_week
FROM {{ ref('stg_date') }}

