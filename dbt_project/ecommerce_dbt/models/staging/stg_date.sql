SELECT
  date_key AS date_id,
  date,
  year,
  month,
  day,
  day_name
FROM {{ source('raw', 'raw_date') }}

