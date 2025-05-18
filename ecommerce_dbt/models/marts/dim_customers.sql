SELECT
    customer_id,
    first_name || ' ' || last_name AS full_name,
    email,
    created_at
FROM {{ ref('stg_customers') }}
