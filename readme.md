# SQL Notes
## Table of Contents

- [Day 1](#day-1)
- [Day 5](#day-5)

## Day 1

### What is Database
A Data Base is an Organized Collection of Data which can be easily
accessed, managed and updated.
In today’s World, Data plays a vital role in every business. In our day to day life, we see or
interact with many applications and Software’s, every application that we see or work with will
have two parts:

1. GUI (Graphical User Interface / Front end)
2. Database

To keep it simple GUI is the part where user interacts with (like Facebook applications – look
and feel) and the Data that we see in the application (like Facebook profile, messages, images
and videos) are pulled from Database.


End User who interacts with the application may not know how the data is being fetched and
where so much of information is stored. Internally all the dynamic content that we see in the
application is fetched from Database.

Database and all its components should be designed and configured at the time of application
development. Once the application is developed we will not be able to make changes to the
database structure as every change will hugely affect the business application GUI code.
It is very important to make sure that data is securely maintained and accurately stored. 

So to maintain security and accuracy in database a set of rules / software system is defined and that
we call it as DBMS (Data Base Management System – which performs all the operations on the
database)

### What is DBMS?

```sql
DBMS (Database Management System) is a software tool that is used to store and manage data
in the Database
```

A database management system contains a set of programs that control the creation,
maintenance, and use of a database. Like:

Adding new data to the table.
Modifying existing data.
Deleting unwanted data.

DBMS allows different user application programs to concurrently access the same database.
Before Database and DBMS were introduced, traditional approach was to store data in flat files
(physical files in system) but there were some disadvantages with it.


### What is RDBMS?
A relational database management system (RDBMS) is a Database Management System
(DBMS) that is based on the relational model 

introduced by E. F. Codd and most popular 
databases currently in use are based on the relational database model. 

To put in different words RDBMS is built on top of in which data is stored in tables and the relationships among 
the data are maintained. 

The data stored in a table is organized into rows and columns. Each row in a table represents an individual record and each column represents a field. 

A record is an individual entry in the database.


### SQL
SQL stands for Structured Query Language. 

It is used for storing and managing data in relational database management system (RDMS).

It is a standard language for Relational Database System. It enables a user to create, 
read, update and delete relational databases and tables.

All the RDBMS like MySQL, Informix, Oracle, MS Access and SQL Server use SQL as their
standard database language.
SQL allows users to query the database in a number of ways, using English-like statements.

### Rulse:

SQL follows the following rules:

Structure query language is not case sensitive. 

Generally, keywords of SQL are written in uppercase.
Statements of SQL are dependent on text lines. 

We can use a single SQL statement on one or multiple text line.

Using the SQL statements, you can perform most of the actions in a database.

sql stands for structure query language designed for
accessing and managing the data in the RDBMS

Sql act as interface between user and database.


### Why Sql ?

Sql can retrieve records from the database.

sql can insert record into the database

sql can update record in to a database

sql can provides privileges to pprocedures,functions,
views, sequences----database objects



### SQL is divided into five categories

**DDl --DATA  DEFINITION LANGUAGE**

```sql
CMDS:CREATE,ALTER,TRUNCATE,DROP,RENAME
```

which deals with database schemas and descriptions, of how the data should reside in the database.

**DML -- DATA MANIPULATION LANGUAGE**

```sql
CMDS:INSERT,UPDATE,DELETE
```

which deals with data manipulation and includes most common SQL statements such 
INSERT, UPDATE, DELETE, etc., and it is used to store, modify, retrieve, delete and update data in a database.



**DCL -- DATA CONTROL LANGUAGE**

```sql
GRANT,REVOKE
```


**TCL -- TRANSACTION CONTROL LANGUAGE**

```sql
COMMIT,ROLLBACK,SAVEPOINT
```


**DRL -- DATA RETRIVEAL LANGUAGE**

```sql
SELECT
```


### Datatypes

***Number[(p,s)]**:-  this data is used to store numeric data
                   maxisize we can store up to 38 digits
                
                 p--precision
                 s--scale

```sql
  empno number
 
  empno number(5)

  sal  number(10,3); -- 10 is precision and 3 is scale.
```

  **Example**:
   The precision is the number of digits in a number. It ranges from 1 to 38.
   The scale is the number of digits to the right of the decimal point in a number. 
    It ranges from -84 to 127.
   
   For example, the number 1234.56 has a precision of 6 and a scale of 2.
   So to store this number, you need NUMBER(6,2).











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



# Day 5

## Table of Contents

- [Create User](#create-user)
- [See All Users](#see-all-users)
- [Drop User](#drop-user)
- [Login with a Specific User](#login-with-a-specific-user)
- [Lock User](#lock-user)
- [Check User Lock Status](#check-user-lock-status)
- [Concurrency](#concurrency)
  - [Avoid This](#avoid-this)
- [Procedure](#procedure)
  - [Return All data](#return-all-data)
  - [Get Argument](#get-argument)
  - [Return Max Salary in Variable](#return-max-salary-in-variable)
  - [In and Out (Arg, Return)](#in-and-out-arg-return)



## Create User

To create a new user in MySQL, use the following commands:

```sql
CREATE USER 'raj'@'localhost' IDENTIFIED BY 'raj';
GRANT ALL PRIVILEGES ON * . * TO 'raj'@'localhost';
```

This creates a user named 'raj' with full privileges.

## See All Users

You can view all users and their account status using the following query:

```sql
SELECT user, host, account_locked FROM mysql.user;
```

This query displays the usernames, hosts, and whether the accounts are locked or not.

## Drop User

To remove a user, use the `DROP USER` command:

```sql
DROP USER 'raj@localhost';
DROP USER 'rah@localhost';
```

These commands drop the users 'raj' and 'rah' from the MySQL server.

## Login with a Specific User

To log in with a particular username, follow these steps:

1. Copy the MySQL server path: `C:\Program Files\MySQL\MySQL Server 8.0\bin`
2. Set the environment variable:
   - Go to environment variables settings.
   - Click on user's environment -> path.
   - Edit the path and paste the MySQL server path.
3. Open CMD and run the following command:
   ```bash
   mysql -u <username> -p
   ```
   For example, to log in as user 'raj', use:
   ```bash
   mysql -u raj -p
   ```
   Enter the password when prompted.

## Lock User

To lock a user's account, use the following command:

```sql
ALTER USER 'raj'@'localhost' ACCOUNT LOCK;
```

This command locks the account of user 'raj' on the localhost.

## Check User Lock Status

You can check if a user's account is locked or not using the query:

```sql
SELECT user, host, account_locked FROM mysql.user;
```

This query shows the lock status of users in the MySQL server.

## Concurrency

Handling concurrency involves managing multiple sessions and ensuring data integrity. Consider using table locking and unlocking strategies to avoid conflicts.

```sql
Two Session create for 1 user.

Session 1
table is lock

Session 2
table is waiting for unlock the session 1.

Session 1
table is unlock

Session 2
table is getted which query is perform.

When one work is process that time other work in waiting when 1 work complete then next work start.
```

### Avoid This

Lock and Unlock table
```sql
S1:
---
lock tables test501 write;

S2:
--- 
select * from test501;
-- wait for unlock

S1:
---
 unlock tables;

S2:
---
select * from test501;
-- unlocked table
+------+------+
| id   | name |
+------+------+
|    1 | yash |
+------+------+
```


## Procedure

### Return All data:

```sql
mysql> delimiter //
mysql> create procedure ex2()
    -> begin
    -> select * from emp;
    -> end //
Query OK, 0 rows affected (0.01 sec)

mysql> delimiter ;
mysql> call ex2();
```

This procedure selects all columns from the emp table.

After defining the procedure, you switched back the delimiter to the default `;` and then called the `ex2` procedure using `call ex2();`


### Get Argument

```sql
mysql> create procedure ex3(in dno decimal)
    -> begin
    -> select * from emp where deptno = dno;
    -> end //
Query OK, 0 rows affected (0.01 sec)

mysql> delimiter ;
mysql> call ex3(10);
```

creates a stored procedure named ex3 in MySQL with an input parameter dno of type decimal. 

The procedure selects all columns from the emp table where the deptno column matches the input parameter dno.

### return max salary in variable

```sql
mysql> create procedure ex4(out ms decimal)
    -> begin
    -> select max(sal) into ms from emp;
    -> end //

delimiter ;

select @s;
```

creates a stored procedure named `ex4` in MySQL with an output parameter `ms` of type `decimal`. The procedure selects the maximum value from the `sal` column in the `emp` table and stores it into the output parameter `ms`.

After defining the procedure, changed the delimiter to `;` and then attempted to select the value of the output parameter `@s`. However, the output parameter `ms` is local to the stored procedure and cannot be directly accessed outside of it using `@s`.

To use the output parameter `ms` from the stored procedure `ex4`, you would typically call the procedure and pass an OUT variable to receive the result. For example:

```sql
CALL ex4(@result);
SELECT @result;
```

This would call the `ex4` procedure and store the result in the variable `@result`, which you can then select to see the value.


### in and out (arg,return)

```sql
mysql> delimiter //
mysql> create procedure ex5(in eno decimal,out name varchar(20))
    -> begin
    -> select ename from emp where empno=eno;
    -> end //
Query OK, 0 rows affected (0.01 sec)

mysql> delimiter ;
mysql> call ex5(7566,@s);
```


creates a stored procedure named `ex5` in MySQL with an input parameter `eno` of type `decimal` and an output parameter `name` of type `varchar(20)`. The procedure selects the employee name (`ename`) from the `emp` table where the `empno` column matches the input parameter `eno`, and stores the result into the output parameter `name`.


After defining the procedure, switched back the delimiter to the default `;` and then called the `ex5` procedure with the argument `7566` for the input parameter `eno` and an OUT variable `@s` to receive the result for the output parameter `name`.


want to see the value of the output parameter `name` stored in `@s`, you can execute the following query after calling the procedure:

```sql
SELECT @s;
```

This will display the employee name corresponding to the input `empno` `7566`.



