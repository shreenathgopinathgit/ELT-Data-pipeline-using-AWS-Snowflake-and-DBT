use database logisticdata;
use warehouse logistic_wh;
use schema logisticdata.raw;

create or replace stage logisticdata_stage
    url = 's3://logisticdatacodataset'
    credentials = (aws_key_id = '<used_my_key_id>', aws_secret_key = '<used_my_secret_key>')

create or replace table DescriptionDataCoSupplyChain(
    fields string,
    description string
)

CREATE OR REPLACE FILE FORMAT my_csv_format
  TYPE = 'CSV'
  skip_header= 0
  field_optionally_enclosed_by = '"'
  encoding = 'UTF8';
  

copy into DescriptionDataCoSupplyChain
from '@logisticdata_stage/DescriptionDataCoSupplyChain.csv'
file_format = (type = 'csv' field_optionally_enclosed_by = '"' skip_header = 1 );


CREATE OR REPLACE TABLE DataCoSupplyChainDataset_utf8 (
  Type TEXT,
  Days_for_shipping_real NUMBER,
  Days_for_shipment_scheduled NUMBER,
  Benefit_per_order FLOAT,
  Sales_per_customer FLOAT,
  Delivery_Status TEXT,
  Late_delivery_risk BOOLEAN,
  Category_Id NUMBER,
  Category_Name TEXT,
  Customer_City TEXT,
  Customer_Country TEXT,
  Customer_Email TEXT,
  Customer_Fname TEXT,
  Customer_Id NUMBER,
  Customer_Lname TEXT,
  Customer_Password TEXT,
  Customer_Segment TEXT,
  Customer_State TEXT,
  Customer_Street TEXT,
  Customer_Zipcode TEXT,
  Department_Id NUMBER,
  Department_Name TEXT,
  Latitude FLOAT,
  Longitude FLOAT,
  Market TEXT,
  Order_City TEXT,
  Order_Country TEXT,
  Order_Customer_Id NUMBER,
  Order_Date TIMESTAMP,
  Order_Id NUMBER,
  Order_Item_Cardprod_Id NUMBER,
  Order_Item_Discount FLOAT,
  Order_Item_Discount_Rate FLOAT,
  Order_Item_Id NUMBER,
  Order_Item_Product_Price FLOAT,
  Order_Item_Profit_Ratio FLOAT,
  Order_Item_Quantity NUMBER,
  Sales FLOAT,
  Order_Item_Total FLOAT,
  Order_Profit_Per_Order FLOAT,
  Order_Region TEXT,
  Order_State TEXT,
  Order_Status TEXT,
  Order_Zipcode TEXT,
  Product_Card_Id NUMBER,
  Product_Category_Id NUMBER,
  Product_Description TEXT,
  Product_Image TEXT,
  Product_Name TEXT,
  Product_Price FLOAT,
  Product_Status TEXT,
  Shipping_Date TIMESTAMP,
  Shipping_Mode TEXT
);

copy into DataCoSupplyChainDataset_utf8
from '@logisticdata_stage/DataCoSupplyChainDataset_utf8.csv'
file_format = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  ENCODING = 'UTF8'
  TIMESTAMP_FORMAT = 'MM/DD/YYYY HH24:MI'
);



CREATE OR REPLACE TABLE tokenized_access_logs (
  Product TEXT,
  Category TEXT,
  Event_Date TIMESTAMP,
  Month TEXT,
  Hour NUMBER,
  Department TEXT,
  IP TEXT,
  URL TEXT
);


copy into tokenized_access_logs
from '@logisticdata_stage/tokenized_access_logs.csv'
file_format = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  ENCODING = 'UTF8'
  TIMESTAMP_FORMAT = 'MM/DD/YYYY HH24:MI'
);
