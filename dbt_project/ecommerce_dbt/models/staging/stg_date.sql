SELECT
  date_key,
  date,
  year,
  month,
  day,
  day_name
FROM {{ source('raw', 'raw_date') }}

