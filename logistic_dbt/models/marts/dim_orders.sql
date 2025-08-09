{{config(materialized='table')}}

with src_orders as (
    select * from {{ref('src_orders')}}
)
SELECT
ORDER_ID,
ORDER_ITEM_CARDPROD_ID,
ORDER_ITEM_ID,
product_card_id,
CUSTOMER_ID,
ORDER_DATE,
ORDER_STATUS,
LOWER(TRIM(delivery_status)) AS delivery_status,
LOWER(TRIM(late_delivery_risk)) AS late_delivery_risk,
shipping_mode,
shipping_date,
days_for_shipping_real,
days_for_shipment_scheduled,
category_name,
department_name,
ORDER_CITY,
ORDER_REGION,
ORDER_STATE,
ORDER_COUNTRY,
ORDER_ZIPCODE,
round(ORDER_ITEM_DISCOUNT,2) as ORDER_ITEM_DISCOUNT,
round(ORDER_ITEM_DISCOUNT_RATE,2) as ORDER_ITEM_DISCOUNT_RATE,
round(ORDER_ITEM_PRODUCT_PRICE,2) as ORDER_ITEM_PRODUCT_PRICE,
round(ORDER_ITEM_PROFIT_RATIO,3) as ORDER_ITEM_PROFIT_RATIO,
ORDER_ITEM_QUANTITY,
round(SALES,2) as SALES,
round(ORDER_ITEM_TOTAL,3) as ORDER_ITEM_TOTAL,
round(ORDER_PROFIT_PER_ORDER,2) as ORDER_PROFIT_PER_ORDER,
FROM src_orders
