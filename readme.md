# SQL Notes
## Table of Contents

- [Day 1](#day-1)
- [Day 5](#day-5)

This README file contains notes on SQL commands and operations.

## Day 1

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



