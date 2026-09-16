-- BEFORE RUNNING: replace <PROJECT_PATH> below with the absolute path to this
-- project on YOUR machine (e.g. C:/Projects/olist-analytics or /home/you/olist-analytics).
-- Note: Postgres COPY runs server-side, so the path must be reachable by the
-- Postgres server process itself, not just your client/psql session.

--copy com
COPY olist_customers_dataset FROM '<PROJECT_PATH>/Source/archive/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_geolocation_dataset FROM '<PROJECT_PATH>/Source/archive/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_products_dataset FROM '<PROJECT_PATH>/Source/archive/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_sellers_dataset FROM '<PROJECT_PATH>/Source/archive/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_orders_dataset FROM '<PROJECT_PATH>/Source/archive/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_items_dataset FROM '<PROJECT_PATH>/Source/archive/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_payments_dataset FROM '<PROJECT_PATH>/Source/archive/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_reviews_dataset FROM '<PROJECT_PATH>/Source/archive/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

COPY product_category_name_translation FROM '<PROJECT_PATH>/Source/archive/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;



-- NOTE: The full geolocation CSV is already loaded by the COPY statement above.
-- The olist_geolocation_dataset_sql/ folder (11 INSERT scripts) is a legacy/alternate
-- load method for the same data and is NOT run here to avoid duplicate rows
-- (the table has no primary key/unique constraint to block duplicates).

\d olist_orders_dataset