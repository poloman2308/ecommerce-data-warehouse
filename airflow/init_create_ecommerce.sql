-- Create ecommerce database (if not already in Docker init)
CREATE DATABASE ecommerce;

-- Connect to ecommerce DB
\connect ecommerce;

-- Create raw tables
CREATE TABLE public.raw_products (
    product_id INT,
    name TEXT,
    price NUMERIC,
    category TEXT
);

CREATE TABLE public.raw_customers (
    customer_id INT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    created_at TIMESTAMP
);

CREATE TABLE public.raw_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    status TEXT
);

CREATE TABLE public.raw_returns (
    return_id INT,
    order_id INT,
    return_date DATE,
    reason TEXT
);

CREATE TABLE public.raw_date (
    date_key INT,
    date DATE,
    year INT,
    month INT,
    day INT,
    day_name TEXT
);

-- Optionally insert dummy rows so dbt doesn't crash on empty inputs
INSERT INTO public.raw_products VALUES (1, 'Widget', 19.99, 'Gadgets');
