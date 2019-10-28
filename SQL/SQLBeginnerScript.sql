use Northwind
go

select 'Northwind Products'
select * from Products
select 'Suppliers'
select * from Suppliers

update Products set UnitPrice=31 where Productid=10  
select * from Products


use master
drop database deleteme01
go
create database deleteme01
go

use Northwind
go
select * from [Order Details]