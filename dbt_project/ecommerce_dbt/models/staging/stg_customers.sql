SELECT
    customer_id,
    LOWER(first_name) AS first_name,
    LOWER(last_name) AS last_name,
    email,
    created_at
FROM {{ source('raw', 'raw_customers') }}