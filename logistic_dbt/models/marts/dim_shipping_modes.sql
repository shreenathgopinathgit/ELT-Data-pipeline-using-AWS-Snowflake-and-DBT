{{config(materialized='table')}}

with src_orders as (
    select * from {{ref('src_orders')}}
)

select distinct shipping_mode from src_orders where shipping_mode is not null