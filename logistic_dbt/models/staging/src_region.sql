{{config(materialized='view')}}

with src_orders as (
    select * from {{ref('src_orders')}}
)

select
ORDER_REGION,
ORDER_CITY,
ORDER_STATE,
ORDER_COUNTRY,
ORDER_ZIPCODE,
latitude,
longitude
from src_orders