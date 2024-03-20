# SQL Notes

This README file contains notes on SQL commands and operations.

## Database Setup

1. **Current Database Selection:**
   - To see the currently selected database: `select database();`

2. **Table Creation:**
   - Example table creation: 
     ```sql
     create table emp13(
     empno int,
     ename varchar(20),
     sal decimal(10,2),
     hiredate date,
     job varchar(10));
     ```

3. **Schema/Structure Display:**
   - Example: `describe emp13;`

## Data Manipulation

1. **Insertion:**
   - Inserting data into a table:
     ```sql
     insert into emp13 values(1001,'yash',4000,'2021-03-23','hr');
     ```
   - Inserting for specific columns:
     ```sql
     insert into emp13 (empno,ename,sal) values(1001,'yash',4000);
     ```
   - Inserting multiple rows:
     ```sql
     insert into emp13 values(1005,'jeet',9000,'2001-03-23','hr'),
     (1006,'nishit',8000,'2018-03-23','operator');
     ```

2. **Alterations:**
   - Adding a column:
     ```sql
     alter table emp13 add mobileno int(10);
     ```
   - Changing column data type:
     ```sql
     alter table emp13 modify job varchar(20);
     ```

3. **Updates and Deletes:**
   - Updating data:
     ```sql
     update emp13 set mobileno=987654321 where empno=1001;
     ```
   - Deleting data:
     ```sql
     delete from emp13 where empno=1006;
     ```

## Constraints

1. **Not Null and Check Constraints:**
   - Example:
     ```sql
     create table emp14(empno int not null,
     ename varchar(10),
     sal decimal (10,2));
     ```

2. **Primary Keys, Unique, and Foreign Keys:**
   - Example:
     ```sql
     create table emp15(empno int primary key,
     ename varchar(10),
     sal decimal(10,2));
     ```

3. **Table Operations:**
   - Truncating and dropping tables:
     ```sql
     truncate table employee;
     drop table employee;
     ```

## Additional Operations

1. **Data Transfer between Tables:**
   - Example:
     ```sql
     insert into emp_select select empno,ename,sal from emp;
     ```

2. **Joins:**
   - Example:
     ```sql
     select * from users;
     delete u1 from users u1 join users u2
     where u1.id > u2.id and u1.email=u2.email;
     ```

## Readme File Credits

This README file template was created based on the SQL notes provided by the user.
