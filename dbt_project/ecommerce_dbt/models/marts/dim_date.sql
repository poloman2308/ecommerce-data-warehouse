SELECT
  date_key,
  date,
  year,
  month,
  day,
  day_name
FROM {{ ref('stg_date') }}

