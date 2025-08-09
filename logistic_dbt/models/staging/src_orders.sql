{{config(materialized='view')}}

with src_orders as (
    select * from {{source('logisticdata','supplychain_dataset')}}
)

{{ config(materialized='view') }}

SELECT
ORDER_ID,
ORDER_ITEM_CARDPROD_ID,
ORDER_ITEM_ID,
product_card_id,
CUSTOMER_ID,
ORDER_DATE,
ORDER_STATUS,
delivery_status,
late_delivery_risk,
shipping_mode,
shipping_date,
days_for_shipping_real,
days_for_shipment_scheduled,
category_name,
department_name,
ORDER_CITY,
ORDER_REGION,
ORDER_STATE,
latitude,
longitude,
ORDER_COUNTRY,
ORDER_ZIPCODE,
ORDER_ITEM_DISCOUNT,
ORDER_ITEM_DISCOUNT_RATE,
ORDER_ITEM_PRODUCT_PRICE,
ORDER_ITEM_PROFIT_RATIO,
ORDER_ITEM_QUANTITY,
SALES,
ORDER_ITEM_TOTAL,
ORDER_PROFIT_PER_ORDER,
FROM src_orders
