with orders as (
    select * from {{ ref('raw_orders') }}
),

customers as (
    select * from {{ ref('raw_customers') }}
),

products as (
    select * from {{ ref('raw_products') }}
),

items as (
    select * from {{ ref('raw_order_items') }}
)

select
    o.order_id,
    o.order_date,
    c.customer_id,
    c.first_name,
    c.last_name,
    p.name as product_name,
    p.category,
    i.quantity,
    i.unit_price,
    i.total_price
from orders o
left join customers as c on o.customer_id = c.customer_id
left join items as i on o.order_id = i.order_id
left join products as p on i.product_id = p.product_id
