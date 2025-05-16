# Database Schema Documentation

## Tables

### customers
- `customer_id` (VARCHAR(50)) - Primary key
- `customer_unique_id` (VARCHAR(50)) - Unique identifier
- `customer_zip_code_prefix` (VARCHAR(10)) - ZIP code prefix
- `customer_city` (VARCHAR(50)) - City name
- `customer_state` (CHAR(2)) - State code

### geolocation
- `geolocation_zip_code_prefix` (VARCHAR(10)) - ZIP code prefix
- `geolocation_lat` (DECIMAL(18,15)) - Latitude
- `geolocation_lng` (DECIMAL(18,15)) - Longitude
- `geolocation_city` (VARCHAR(50)) - City name
- `geolocation_state` (CHAR(2)) - State code

### sellers
- `seller_id` (VARCHAR(50)) - Primary key
- `seller_zip_code_prefix` (VARCHAR(10)) - ZIP code prefix
- `seller_city` (VARCHAR(50)) - City name
- `seller_state` (CHAR(2)) - State code

### products
- `product_id` (VARCHAR(50)) - Primary key
- `product_category_name` (VARCHAR(50)) - Category name in Portuguese
- `product_name_length` (INTEGER) - Length of product name
- `product_description_length` (INTEGER) - Length of product description
- `product_photos_qty` (INTEGER) - Number of product photos
- `product_weight_g` (INTEGER) - Weight in grams
- `product_length_cm` (INTEGER) - Length in centimeters
- `product_height_cm` (INTEGER) - Height in centimeters
- `product_width_cm` (INTEGER) - Width in centimeters

### product_category_translation
- `product_category_name` (VARCHAR(50)) - Primary key, Portuguese category name
- `product_category_name_english` (VARCHAR(50)) - English category name

### orders
- `order_id` (VARCHAR(50)) - Primary key
- `customer_id` (VARCHAR(50)) - Foreign key to customers table
- `order_status` (VARCHAR(20)) - Current order status
- `order_purchase_timestamp` (TIMESTAMP) - Purchase timestamp
- `order_approved_at` (TIMESTAMP) - Payment approval timestamp
- `order_delivered_carrier_date` (TIMESTAMP) - Carrier delivery date
- `order_delivered_customer_date` (TIMESTAMP) - Customer delivery date
- `order_estimated_delivery_date` (TIMESTAMP) - Estimated delivery date

### order_items
- `order_id` (VARCHAR(50)) - Part of composite primary key, foreign key to orders
- `order_item_id` (INTEGER) - Part of composite primary key
- `product_id` (VARCHAR(50)) - Foreign key to products table
- `seller_id` (VARCHAR(50)) - Foreign key to sellers table
- `shipping_limit_date` (TIMESTAMP) - Shipping limit date
- `price` (DECIMAL(10,2)) - Item price
- `freight_value` (DECIMAL(10,2)) - Freight value

### order_payments
- `order_id` (VARCHAR(50)) - Part of composite primary key, foreign key to orders
- `payment_sequential` (INTEGER) - Part of composite primary key
- `payment_type` (VARCHAR(20)) - Payment method
- `payment_installments` (INTEGER) - Number of installments
- `payment_value` (DECIMAL(10,2)) - Payment amount

### order_reviews
- `review_id` (VARCHAR(50)) - Part of composite primary key
- `order_id` (VARCHAR(50)) - Part of composite primary key, foreign key to orders
- `review_score` (INTEGER) - Review score (1-5)
- `review_comment_title` (TEXT) - Review title
- `review_comment_message` (TEXT) - Review message
- `review_creation_date` (TIMESTAMP) - Review creation date
- `review_answer_timestamp` (TIMESTAMP) - Review answer date

## Indexes
- `idx_customers_unique_id` - Index on customers(customer_unique_id)
- `idx_geolocation_zip_code` - Index on geolocation(geolocation_zip_code_prefix)
- `idx_orders_customer_id` - Index on orders(customer_id)
- `idx_order_items_product_id` - Index on order_items(product_id)
- `idx_order_items_seller_id` - Index on order_items(seller_id)

## Relationships
1. orders -> customers (customer_id)
2. order_items -> orders (order_id)
3. order_items -> products (product_id)
4. order_items -> sellers (seller_id)
5. order_payments -> orders (order_id)
6. order_reviews -> orders (order_id)
