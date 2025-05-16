#!/bin/bash

# Set database connection parameters
DB_NAME="commerce"
DB_USER="postgres"
DB_PASSWORD="apple"

# Function to truncate and load CSV file
load_csv() {
    local csv_file=$1
    local table_name=$2
    
    echo "Truncating and loading $csv_file into $table_name..."
    PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME <<EOF
    TRUNCATE TABLE $table_name CASCADE;
    \copy $table_name FROM 'data/raw/$csv_file' WITH (FORMAT csv, HEADER true, NULL '\\N');
EOF
}

# Disable foreign key checks temporarily
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_items DROP CONSTRAINT order_items_product_id_fkey;"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_items DROP CONSTRAINT order_items_order_id_fkey;"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_payments DROP CONSTRAINT order_payments_order_id_fkey;"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_reviews DROP CONSTRAINT order_reviews_order_id_fkey;"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE orders DROP CONSTRAINT orders_customer_id_fkey;"

# Load data with truncation
load_csv "olist_customers_dataset.csv" "customers"
load_csv "olist_geolocation_dataset.csv" "geolocation"
load_csv "olist_sellers_dataset.csv" "sellers"
load_csv "olist_products_dataset.csv" "products"
load_csv "product_category_name_translation.csv" "product_category_translation"
load_csv "olist_orders_dataset.csv" "orders"
load_csv "olist_order_items_dataset.csv" "order_items"
load_csv "olist_order_payments_dataset.csv" "order_payments"
load_csv "olist_order_reviews_dataset.csv" "order_reviews"

# Re-enable foreign key constraints
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_items ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(product_id);"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_items ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(order_id);"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_payments ADD CONSTRAINT order_payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(order_id);"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE order_reviews ADD CONSTRAINT order_reviews_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(order_id);"
PGPASSWORD=$DB_PASSWORD psql -h localhost -U $DB_USER -d $DB_NAME -c "ALTER TABLE orders ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(customer_id);"

echo "Data loading completed!"