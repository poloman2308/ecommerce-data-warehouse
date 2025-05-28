CREATE SCHEMA IF NOT EXISTS analytics;

CREATE TABLE IF NOT EXISTS raw_date (
  date_id INTEGER,
  date_day DATE,
  year INTEGER,
  month INTEGER,
  day INTEGER,
  day_of_week TEXT
);

CREATE TABLE IF NOT EXISTS raw_returns (
  return_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  return_date DATE,
  reason TEXT
);

CREATE TABLE raw_customers (
  customer_id INTEGER PRIMARY KEY,
  full_name TEXT,
  email TEXT,
  created_at DATE
);

CREATE TABLE raw_orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date DATE,
  amount NUMERIC
);

CREATE TABLE raw_products (
  product_id INTEGER PRIMARY KEY,
  name TEXT,
  category TEXT,
  price NUMERIC
);
