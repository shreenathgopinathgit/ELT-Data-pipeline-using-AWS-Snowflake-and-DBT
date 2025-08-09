{{ config(materialized='table') }}

SELECT
  CONCAT(o.order_item_id, o.product_card_id) AS fact_order_product_id,
  c.customer_id,
  o.order_id,
  o.order_item_id,
  o.order_date,
  r.order_region,
  o.delivery_status,
  p.product_card_id,
  p.product_name,
  p.product_price,
  o.order_profit_per_order,
  o.category_name,
  o.sales,
  c.sales_per_customer,
  o.order_item_discount_rate,
  o.shipping_date,
  s.shipping_mode
FROM {{ ref('dim_orders') }} o
LEFT JOIN {{ ref('dim_customers') }} c ON o.customer_id = c.customer_id
LEFT JOIN {{ ref('dim_products') }} p ON o.product_card_id = p.product_card_id
LEFT JOIN {{ref('dim_shipping_modes')}} s on o.shipping_mode = s.shipping_mode
LEFT JOIN {{ref('dim_region')}} r on o.order_region = r.order_region
