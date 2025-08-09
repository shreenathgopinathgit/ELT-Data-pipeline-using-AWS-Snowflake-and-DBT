{{config(materialized='table')}}

with src_orders as (
    select * from {{ref('src_orders')}}
)

select distinct order_region from src_orders where order_region is not null
