-- Create indexes for better performance
CREATE INDEX idx_customers_unique_id ON customers(customer_unique_id);
CREATE INDEX idx_geolocation_zip_code ON geolocation(geolocation_zip_code_prefix);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_order_items_seller_id ON order_items(seller_id);
