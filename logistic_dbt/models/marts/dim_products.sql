{{ config(materialized='table') }}

WITH src_products AS (
    SELECT * 
    FROM {{ ref('src_products') }}
)

SELECT
    product_card_id,
    product_name,
    round(product_price,2) as product_price,
    category_name,
    category_id,
    department_name,
    department_id,
    product_status
FROM src_products
WHERE row_num = 1 and product_card_id IS NOT NULL

