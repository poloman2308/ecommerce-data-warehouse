SELECT
  date_id,
  date_day,
  year,
  month,
  day,
  day_of_week
FROM {{ source('raw', 'raw_date') }}

