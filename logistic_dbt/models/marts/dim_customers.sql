{{ config(materialized='table') }}

WITH src_customers AS (
  SELECT * FROM {{ ref('src_customers') }}
)

SELECT
  customer_id,
  customer_fname,
  customer_lname,
  round(sales_per_customer,2) as sales_per_customer,
  customer_segment,
  customer_city,
  customer_state,
  customer_country,
  customer_zipcode
FROM src_customers
WHERE row_num = 1 and customer_id is not null
