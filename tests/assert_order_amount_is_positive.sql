-- Ce test échoue si une commande a un montant total <= 0
select
    order_id,
    total_price
from {{ ref('fct_orders') }}
where total_price <= 0