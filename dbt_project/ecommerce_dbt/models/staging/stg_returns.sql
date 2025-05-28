SELECT
  return_id,
  order_id,
  return_date,
  reason
FROM {{ source('raw', 'raw_returns') }}
