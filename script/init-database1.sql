use master

if exists (select 1 from sys.databases where name='cbedatawarehouse')
begin 
alter database cbedatawarehouse set single_user with rollback immediate ; 

 drop database cbedatawarehouse
end;

create database cbedatawarehosue;
go 
create schema bronze;
go 
create schema silver ;
go 
create schema gold ;

