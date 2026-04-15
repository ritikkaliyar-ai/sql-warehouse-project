/*

Purpose: This Script will create tables and insert data for bronze layer.

Alert: This script with Fist Drop Table and then create so use it accordings. Also while bulk insert It will Truncate first then insert data.


*/



DROP TABLE IF EXISTS Bronze.customers;
CREATE TABLE Bronze.customers(
cust_id VARCHAR(80),
cust_unique_id VARCHAR(80),
cust_zip_code_prefix INT,
cust_city VARCHAR(50),
cust_state VARCHAR(50)
);


DROP TABLE IF EXISTS bronze.geo;
CREATE TABLE bronze.geo (
    geo_zip_code_prefix INT,
    geo_lat DECIMAL(10,8),
    geo_lng DECIMAL(11,8),
    geo_city TEXT,
    geo_state CHAR(2)
);

DROP TABLE IF EXISTS bronze.order_items;
CREATE TABLE bronze.order_items (
    order_id TEXT,
    order_item_id INT,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TEXT,
    price TEXT,
    freight_value TEXT
);


DROP TABLE IF EXISTS Bronze.order_payments;
CREATE TABLE Bronze.order_payments(
order_id VARCHAR(80),
payment_sequential INT,
payment_type VARCHAR(50),
payment_installments INT,
payment_value DECIMAL(10,2) 
);


DROP TABLE IF EXISTS order_reviews;
CREATE TABLE order_reviews(
review_id VARCHAR(80),
order_id VARCHAR(80),
review_score int,
review_comment_title VARCHAR(80),
review_comment_message TEXT,
review_creation_date TIMESTAMP,
review_answer_timestamp TIMESTAMP
);


DROP TABLE IF EXISTS Bronze.orders;
CREATE TABLE Bronze.orders (
    order_id VARCHAR(80),
    customer_id VARCHAR(80),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);



DROP TABLE IF EXISTS Bronze.products;
CREATE TABLE Bronze.products (
    prod_id VARCHAR(80),
    prod_category_name VARCHAR(100),
    prod_name_lenght INT,
    prod_description_lenght INT,
    prod_photos_qty INT,
    prod_weight_g INT,
    prod_length_cm INT,
    prod_height_cm INT,
    prod_width_cm INT
);



DROP TABLE IF EXISTS Bronze.sellers;
CREATE TABLE Bronze.sellers (
    seller_id VARCHAR(80),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

DROP TABLE IF EXISTS Bronze.product_name_translation;
CREATE TABLE Bronze.product_name_translation(
prod_category_name VARCHAR(80),
prod_category_name_english VARCHAR(80)
);

-- BULK INSERT

TRUNCATE TABLE bronze.customers;
COPY bronze.customers 
FROM 'E:/wheredata/olist_customers_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.geo;
COPY bronze.geo 
FROM 'E:/wheredata/olist_geolocation_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.order_items;
COPY bronze.order_items 
FROM 'E:/wheredata/olist_order_items_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.order_payments;
COPY bronze.order_payments 
FROM 'E:/wheredata/olist_order_payments_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.order_reviews;
COPY bronze.order_reviews 
FROM 'E:/wheredata/olist_order_reviews_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.orders;
COPY bronze.orders 
FROM 'E:/wheredata/olist_orders_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.products;
COPY bronze.products 
FROM 'E:/wheredata/olist_products_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.sellers;
COPY bronze.sellers 
FROM 'E:/wheredata/olist_sellers_dataset.csv' 
CSV HEADER;

TRUNCATE TABLE bronze.product_name_translation;
COPY bronze.product_name_translation 
FROM 'E:/wheredata/product_category_name_translation.csv' 
CSV HEADER;










CREATE SCHEMA Silver;
CREATE SCHEMA Gold;



