Sure, here is a README file based on the SQL queries and concepts you provided:

---

# SQL Queries and Concepts

## Table of Contents

1. [Creating Users and Granting Privileges](#creating-users-and-granting-privileges)
2. [Viewing and Dropping Users](#viewing-and-dropping-users)
3. [Logging in with a Specific Username](#logging-in-with-a-specific-username)
4. [Locking and Checking User Lock Status](#locking-and-checking-user-lock-status)
5. [Concurrency Handling](#concurrency-handling)
6. [Creating and Dropping Procedures](#creating-and-dropping-procedures)
7. [Working with Functions](#working-with-functions)
8. [Summing Numbers and Using Inout Parameters](#summing-numbers-and-using-inout-parameters)
9. [Declaring, Setting, and Displaying Variables](#declaring-setting-and-displaying-variables)

---

## Creating Users and Granting Privileges

To create a new user 'raj' with a password 'raj' and grant all privileges, use the following SQL commands:

```sql
CREATE USER 'raj'@'localhost' IDENTIFIED BY 'raj';

GRANT ALL PRIVILEGES ON *.* TO 'raj'@'localhost';
```

---

## Viewing and Dropping Users

To view all users in MySQL and drop a user, you can use the following SQL queries:

```sql
SELECT user, host, account_locked FROM mysql.user;

DROP USER 'raj'@'localhost';
```

---

## Logging in with a Specific Username

To log in with a particular username, follow these steps:

1. Copy the MySQL server path. Example: `C:\Program Files\MySQL\MySQL Server 8.0\bin`
2. Set the environment variable:
   - Go to environment variables settings.
   - Click on user's environment -> path.
   - Edit the path and add the MySQL server path.
3. Open CMD and enter the following command:
   ```shell
   mysql -u <username> -p
   ```

Example:
```shell
mysql -u raj -p
Enter Password: ****
```

---

## Locking and Checking User Lock Status

You can lock a user and check their lock status using these SQL commands:

```sql
ALTER USER 'raj'@'localhost' ACCOUNT LOCK;

SELECT user, host, account_locked FROM mysql.user;
```

---

## Concurrency Handling

Concurrency can be managed using locking and unlocking tables. Example:

```sql
-- Session 1
LOCK TABLES test501 WRITE;

-- Session 2
SELECT * FROM test501; -- Waits for unlock

-- Session 1
UNLOCK TABLES;

-- Session 2
SELECT * FROM test501; -- Table unlocked
```

---

## Creating and Dropping Procedures

To create and drop procedures in MySQL, use the following syntax:

```sql
CREATE PROCEDURE procedure_name(parameters)
BEGIN
    -- Procedure logic
END;

DROP PROCEDURE procedure_name;
```

---

## Working with Functions

You can create functions to return data or perform specific tasks. Example:

```sql
-- Return all data
CREATE PROCEDURE ex2()
BEGIN
    SELECT * FROM emp;
END;

CALL ex2();
```

---

## Summing Numbers and Using Inout Parameters

You can create procedures to sum numbers and use inout parameters. Example:

```sql
-- Sum two numbers
CREATE PROCEDURE ex_sum(IN a INT, IN b INT, OUT c INT)
BEGIN
    SET c = a + b;
END;

CALL ex_sum(2, 3, @s);
SELECT @s;
```

---

## Declaring, Setting, and Displaying Variables

Variables can be declared, set, and displayed within procedures. Example:

```sql
CREATE PROCEDURE ex7()
BEGIN
    DECLARE a INT;
    DECLARE b VARCHAR(10);
    DECLARE c FLOAT;

    SET a = 10;
    SET b = 'welcome';
    SET c = 200;

    SELECT a, b, c;
END;

CALL ex7();
```

---

This README file provides an overview of SQL queries, user management, concurrency handling, procedures, functions, and variable usage in MySQL.