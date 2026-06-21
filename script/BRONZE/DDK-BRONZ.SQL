/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

if object_id ('cbedatawarehouse' , 'u' ) is not null
drop database cbedatawarehouse ;
go 

create database cbedatawarehouse ;

go
use cbedatawarehouse ;
go

create schema bronze ;
go
create schema silver
go 
create schema gold
go 



if object_id ('bronze.crm_cust_info','U') is not null
drop table bronze.crm_cust_info
go
create table bronze.crm_cust_info
(
cst_id int,
cst_key varchar(50),
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_marital_status varchar(50),
cst_create_date date,
);
go

if object_id ('bronze.crm_prd_info','u') is not null
drop table bronze.crm_prd_info ;
go
create table bronze.crm_prd_info
(
prd_id int,
prd_key varchar(50),
prd_nm varchar(50),
prd_cost int,
prd_line varchar(50),
prd_start_dt datetime ,
prd_end_dt datetime,
);
go 
if object_id ('bronze.crm_sale_details' , 'u') is not null
drop table bronze.crm_sales_details;
go 
create table bronze.crm_sales_details
(
 sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int ,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int ,
sls_sales int,
sls_quantity int,
sls_price int
);
if object_id ('bronze.erp_loc_a101','U') is not null
drop table bronze.erp_loc_a101 ;
go 
create table bronze.ep_loc_a101 (
cid nvarchar(50),
cntry nvarchar (50)
);
 go
 if object_id ('bronze.erp_cust_az12', 'u') is not null
 drop table bronze.erp_cust_az12;
 go
 create table bronze.erp_cust_az12
 (
 cid nvarchar (50),
 bdate date,
 gen nvarchar (50)

 );
 go

 if object_id ('bronze.erp_px_cat_g1v2','u') is not null
 drop table bronze.erp_px_cat_g1v2;
 go
 create table bronze.erp_px_cat_g1v2 (
 id nvarchar (50),
 cat nvarchar (50),
 subcat nvarchar (50),
 maintenance nvarchar (50)
 );
 select db_name () as currentdatabase;
