{{ config(materialized='table') }}
select
    order_id,
    order_date,
    status,
    customer_id,
    first_name,
    last_name,
    product_name,
    category,
    quantity,
    unit_price,
    total_price
from{{ ref('int_orders_enriched') }} 