drop database if exists mysqltestDB;

create database mysqltestDB;

use mysqltestDB;

create table product(pid int,pname varchar(10),price int);

insert into product values(1,'mouse',300),(2,'pendrive',400),(3,'monitor',14000);

select * from product;