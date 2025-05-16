# Data Dictionary

## Customers Dataset
- **customer_id**: Unique identifier for each customer
- **customer_unique_id**: Customer's unique identifier across the platform
- **customer_zip_code_prefix**: First 5 digits of customer's zip code
- **customer_city**: Customer's city name
- **customer_state**: Customer's state abbreviation in Brazil (e.g., SP, RJ)

## Geolocation Dataset
- **geolocation_zip_code_prefix**: First 5 digits of zip code
- **geolocation_lat**: Latitude coordinate
- **geolocation_lng**: Longitude coordinate
- **geolocation_city**: City name
- **geolocation_state**: State abbreviation in Brazil

## Sellers Dataset
- **seller_id**: Unique identifier for each seller
- **seller_zip_code_prefix**: First 5 digits of seller's zip code
- **seller_city**: Seller's city name
- **seller_state**: Seller's state abbreviation in Brazil

## Products Dataset
- **product_id**: Unique product identifier
- **product_category_name**: Category name in Portuguese
- **product_name_length**: Number of characters in product name
- **product_description_length**: Number of characters in product description
- **product_photos_qty**: Number of product photos
- **product_weight_g**: Product weight in grams
- **product_length_cm**: Product length in centimeters
- **product_height_cm**: Product height in centimeters
- **product_width_cm**: Product width in centimeters

## Product Category Translation Dataset
- **product_category_name**: Category name in Portuguese (original)
- **product_category_name_english**: Category name translated to English

## Orders Dataset
- **order_id**: Unique identifier of the order
- **customer_id**: Foreign key to customers dataset
- **order_status**: Order status (delivered, shipped, canceled, unavailable, processing)
- **order_purchase_timestamp**: Timestamp of purchase transaction
- **order_approved_at**: Timestamp of payment approval
- **order_delivered_carrier_date**: Timestamp when order was handed to logistics partner
- **order_delivered_customer_date**: Timestamp of actual delivery to customer
- **order_estimated_delivery_date**: Estimated delivery date provided to customer

## Order Items Dataset
- **order_id**: Foreign key to orders dataset
- **order_item_id**: Sequential number identifying number of items within an order
- **product_id**: Foreign key to products dataset
- **seller_id**: Foreign key to sellers dataset
- **shipping_limit_date**: Latest date/time seller can ship to meet delivery estimate
- **price**: Item price
- **freight_value**: Item freight value (if handling/shipping costs vary by item)

## Order Payments Dataset
- **order_id**: Foreign key to orders dataset
- **payment_sequential**: Sequential payment number (1 means first payment, 2 means second, etc.)
- **payment_type**: Payment method (credit_card, boleto, voucher, debit_card)
- **payment_installments**: Number of installments chosen by customer
- **payment_value**: Transaction amount

## Order Reviews Dataset
- **review_id**: Unique review identifier
- **order_id**: Foreign key to orders dataset
- **review_score**: Rating given by customer (1 to 5)
- **review_comment_title**: Title of review comment
- **review_comment_message**: Review message left by customer
- **review_creation_date**: Date when review was created
- **review_answer_timestamp**: Date when seller responded to review

## Data Quality Notes
- All monetary values are in Brazilian Reals (BRL)
- Timestamps are in UTC
- Geographic coordinates use WGS84 standard
- Text fields may contain Portuguese language content
- Some fields may contain NULL values where data is not available
