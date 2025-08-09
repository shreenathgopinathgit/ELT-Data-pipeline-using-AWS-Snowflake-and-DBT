{{ config(materialized='view') }}

WITH src_products AS (
    SELECT * 
    FROM {{ source('logisticdata', 'supplychain_dataset') }}
)

SELECT
    product_card_id,
    product_name,
    product_price,
    category_name,
    category_id,
    department_name,
    department_id,
    product_status,
    ROW_NUMBER() OVER (PARTITION BY product_card_id ORDER BY product_card_id) AS row_num
    FROM src_products



