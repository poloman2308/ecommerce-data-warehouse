SELECT
    o.order_id,
    o.customer_id,
    o.product_id,
    o.order_date,
    p.price,
    p.category
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_products') }} p ON o.product_id = p.product_id
