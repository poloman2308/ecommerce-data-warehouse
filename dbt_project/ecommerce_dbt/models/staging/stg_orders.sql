SELECT
    order_id,
    customer_id,
    order_date,
    status
FROM {{ source('raw', 'raw_orders') }}