SELECT
    order_id,
    customer_id,
    order_date,
    amount
FROM {{ ref('stg_orders') }}
