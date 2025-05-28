CREATE TABLE IF NOT EXISTS raw_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    status TEXT
);

CREATE TABLE IF NOT EXISTS raw_customers (
    customer_id INT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    created_at DATE
);

CREATE TABLE IF NOT EXISTS raw_products (
    product_id INT,
    name TEXT,
    category TEXT,
    price NUMERIC
);

CREATE TABLE IF NOT EXISTS raw_returns (
    return_id INT,
    order_id INT,
    return_date DATE,
    reason TEXT
);

CREATE TABLE IF NOT EXISTS raw_date (
    date_key INT,
    date DATE,
    year INT,
    month INT,
    day INT,
    day_name TEXT
);
