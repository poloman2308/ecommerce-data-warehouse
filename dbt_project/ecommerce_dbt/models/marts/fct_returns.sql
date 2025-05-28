SELECT
  return_id,
  order_id,
  return_date,
  reason
FROM {{ ref('stg_returns') }}
