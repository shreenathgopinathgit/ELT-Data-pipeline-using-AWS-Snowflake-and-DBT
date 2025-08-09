{{ config(materialized='view') }}

WITH supplychain_dataset AS (
  SELECT * FROM {{ source('logisticdata', 'supplychain_dataset') }}
)

  SELECT
    customer_id,
    customer_fname,
    customer_lname,
    sales_per_customer,
    customer_segment,
    customer_city,
    customer_state,
    customer_country,
    customer_zipcode,
    ROW_NUMBER() OVER (
      PARTITION BY customer_id
      ORDER BY order_date DESC
    ) AS row_num
  FROM supplychain_dataset



