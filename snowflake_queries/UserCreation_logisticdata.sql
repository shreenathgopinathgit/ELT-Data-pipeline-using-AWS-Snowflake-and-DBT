use role accountadmin;

create schema logisticdata.raw;

create role if not exists logisticrole;
grant role logisticrole to role accountadmin;

create warehouse if not exists logistic_wh;
grant operate on warehouse logistic_wh to role logisticrole;


create database if not exists logisticdata;
grant all on database logisticdata to role logisticrole;

create or replace user logistic
    default_namespace = logisticdata.raw
    password = "shree0333"
    default_warehouse = logistic_wh
    default_role = logisticrole
    comment = "logistic user for transformation"
    must_change_password = False;
alter user set type = legacy_service;
grant role logisticrole to user logistic;

grant all on all schemas in database logisticdata to role logisticrole;
grant all on future schemas in database logisticdata to role logisticrole;
grant all on warehouse logistic_wh to role logisticrole;
grant all on all tables in schema logisticdata.raw to role logisticrole;
grant all on future tables in schema logisticdata.raw to role logisticrole;
    