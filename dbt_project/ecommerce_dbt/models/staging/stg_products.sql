SELECT
    product_id,
    name,
    price,
    category
FROM {{ source('raw', 'raw_products') }}
