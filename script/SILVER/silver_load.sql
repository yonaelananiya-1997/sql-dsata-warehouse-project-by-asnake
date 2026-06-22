select * from bronze.crm_cust_info
/*
The follwoing step use to check the unique primary key and stpe to make it unique
*/
/*tep 1 select dublicate or null primary key*/
select cst_id ,
count(*)
from bronze.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null
/*step2 find the dublicate primary key info */

select * from bronze.crm_cust_info
where cst_id = 29466

/* when we read the select customer information we can undestand that 
the user infomration the best one is update recently therfore to reolve this
issue we have to oreder the rows based on create dat then select the lat one 
assign unique number each order based on the idenified order */

select *
from (
select *,
row_number() over (partition by cst_id order by cst_create_date  desc) as flag
from bronze.crm_cust_info 

) t where flag = 1 

/*question 2 remove unwanted space formt he cell 

solution using trim funcation we can remove unwated space
then after remove null remove space and make standard inser tinto silver layer*/
insert into silver.crm_cust_info (
cst_id ,
cst_key ,
cst_Firstname,
cst_Lastname,
cst_marital_status,
cst_gndr,
cst_create_date

)

select 
cst_id,
cst_key,
cst_firstname  ,
cst_lastname ,
case when upper (cst_marital_status) = 's 'then 'Single' 
     when upper (cst_marital_status) = 'M' then 'Married'
     else 'n/a'
          end cst_marital_status,

case when upper (cst_gndr) = 'F 'then 'Female' 
     when upper (cst_gndr) = 'M' then 'Male '
     else 'n/a'
     
     end cst_gndr,

cst_create_date 

from (
select *,
row_number() over (partition by cst_id order by cst_create_date  desc) as flag
from bronze.crm_cust_info 

) t where flag = 1 

select * from silver.crm_cust_info ;

/*know you can check qualtiy of the data */


if object_id ('silver.crm_cust_info','U') is not null
drop table silver.crm_cust_info
go
create table silver.crm_cust_info
(
cst_id int,
cst_key varchar(50),
cst_firstname varchar(50),
cst_lastname varchar(50),
cst_marital_status varchar(50),
cst_gndr varchar(25),
cst_create_date date,
dw_create_date datetime2 default getdate() );
