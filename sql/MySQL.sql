-- ========================
-- String Operations
-- ========================

SELECT * FROM USERS U ;
SELECT CONCAT(FIRST_NAME , ' ', LAST_NAME) AS FULLNAME FROM USERS;
SELECT UPPER(FIRST_NAME) FROM USERS ;
SELECT LOWER(FIRST_NAME) FROM USERS ;
SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM USERS;

-- ========================
-- Comparison
-- ========================
-- Order of execution will be first FROM clause, then WHERE clause and finally SELECT will be executed
-- operators : = , > , < , >= , <= , <> , != , in , between , not in

-- ========================
-- Constraints
-- ========================
-- PRIMARY KEY : Uniquely Identifies a record in a table
-- FOREIGN KEY : Primary key from another table , keyword: REFERENCES
-- UNIQUE
-- AUTO_INCREMENT

CREATE TABLE STUDENTS (
  ID INT AUTO_INCREMENT,
  NAME VARCHAR(50),
  PRIMARY KEY (ID)
);

CREATE TABLE DETAILS (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  DETAILS VARCHAR(1000),
  STUDENT_ID INT,
  FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(ID)
);

-- ========================
-- On Delete Options
-- ========================
-- ON DELETE RESTRICT: Prevents the deletion of the referenced row in the parent table if there are matching rows in the child table. The deletion is rejected.
-- ON DELETE NO ACTION: Similar to RESTRICT, but the check is deferred until the end of the transaction.
-- ON DELETE CASCADE: Deletes the matching rows in the child table when the referenced row in the parent table is deleted.
-- ON DELETE SET NULL: Sets the foreign key column in the child table to NULL when the referenced row in the parent table is deleted. This requires the foreign key column in the child table to be NULLABLE.
-- ON DELETE SET DEFAULT: Sets the foreign key column in the child table to its default value when the referenced row in the parent table is deleted. Note that MySQL does not support SET DEFAULT directly, so it's not available.

CREATE TABLE <TABLE_NAME>(
   COLUMN 1 PRIMARY KEY,
   COLUMN 2 <DATA_TYPE>,
   COLUMN 3 <DATA_TYPE> REFERENCES <FOREIGN_KEY> <ON_DELETE_OPTION>
);


-- ========================
-- Joins
-- ========================

select <COLUMN> from <MAIN_TABLE>
    join <JOIN_TABLE> on
        <JOIN_TABLE>.ID = <MAIN_TABLE>.id;


/* Join / Inner Join
Rows with reference in both tables will only be present

* Left Join
Rows with no reference to Joined table will also be selected from the Main table.

* Right Join
Rows with no reference to Main table will also be selected from the Joined table.

* Full Join
All data without any refernce to Main or Joined tables will also be selected */

-- ========================
-- Group By
-- ========================
/*
 *find the set of all unique user_id
 *takes each row and assign it to a group based on a particular column used
 *can only group the selected column
 */

-- ========================
-- Aggregate Func
-- ========================

-- can be used with columns other than grouped columns
-- count(<column_name>) null values are not counted
-- count(*) get total number of rows with null values
-- sum()
-- avg()
-- min()
-- max()

-- ========================
-- having
-- ========================
-- filters set of groups
-- can be used on grouped columns or can be used with Aggregate Func

-- =============================
-- Unions || Intersect || Except
-- =============================

-- (QUERY_1) UNION (QUERY_2) - removes duplicates
-- UNION ALL - does not remove duplicate
-- INTERSECT: find the rows in common AND removes duplicates
-- INTERSECT ALL: does not remove duplicates
-- EXCEPT: find the rows present that are present in first query but not second query,query order matters , Removes duplicates
-- EXCEPT ALL: does not remove duplicate

/*Note: Selected columns order and datatype should be same!!*/

SELECT COLUMN_1, COLUMN_2
FROM TABLE_NAME_1
UNION
SELECT COLUMN_1, COLUMN_2
FROM TABLE_NAME_2;

-- ========================
-- Query Analysis
-- ========================
-- analyze query
EXECUTE <QUERY>;
-- analyze and run the query
EXPLAIN ANALYZE <QUERY>;


-- ========================
-- Subqueries
-- ========================

-- Subquery in the SELECT clause
SELECT FIRST_NAME AS ID1,
       (SELECT FIRST_NAME FROM USERS WHERE ID = 2) AS ID2
FROM USERS
WHERE ID = 1;

-- Subquery in the FROM clause
SELECT * FROM
    (SELECT * FROM USERS WHERE ID = 1) AS TEMPORARY;

-- Subquery in the WHERE clause using ALL keyword
-- The ALL operator compares a value against all values returned by a subquery.
SELECT * FROM PRODUCTS P
WHERE PRICE > ALL (
    SELECT PRICE FROM PRODUCTS P2 WHERE DEPARTMENT = 'INDUSTRIAL'
);

-- Subquery in the WHERE clause using SOME keyword
-- The SOME operator compares a value against any value returned by a subquery.
SELECT * FROM PRODUCTS P
WHERE PRICE > SOME (
    SELECT PRICE FROM PRODUCTS P2 WHERE DEPARTMENT = 'HOME'
);

-- ========================
-- Correlated vs Non-Correlated Subquery
-- ========================
/*
  * Correlated Subquery:
  * References columns from the outer query, allowing it to return different results for each row processed by the outer query.

  * Non-Correlated Subquery:
  * Independent of the outer query, returning a single result set used by the main query.
*/

-- Correlated Subquery
SELECT name, department, price
FROM products p
WHERE p.price = (
    SELECT MAX(price)
    FROM products p2
    WHERE p2.department = p.department
);

-- ========================
-- Views
-- ========================

-- Creating a view to show maximum priced products by department
CREATE OR REPLACE VIEW maxPriceView AS
SELECT name, department, price
FROM products p
WHERE p.price = (
    SELECT MAX(price)
    FROM products p2
    WHERE p2.department = p.department
);

-- Selecting from the view and ordering by price
SELECT * FROM maxPriceView ORDER BY price;

-- Dropping the view
DROP VIEW IF EXISTS maxPriceView;

-- ========================
-- Stored Procedures
-- ========================
-- A stored procedure contains a block of SQL code to retrieve/store data.

-- Procedure to get all products
DELIMITER $$
CREATE PROCEDURE getProducts()
BEGIN
    SELECT * FROM products;
END $$
DELIMITER ;

-- Calling the procedure
CALL getProducts();
DROP PROCEDURE IF EXISTS getProducts;

-- Procedure with parameters to get products by department
DELIMITER $$
CREATE PROCEDURE getProductByDepartment(DEPT VARCHAR(20))
BEGIN
    SELECT * FROM products P WHERE department = DEPT;
END $$
DELIMITER ;

-- Calling the parameterized procedure
CALL getProductByDepartment('INDUSTRIAL');
DROP PROCEDURE IF EXISTS getProductByDepartment;

-- Procedure with default values
DELIMITER $$
CREATE PROCEDURE getProductByDepartmentDefault(dept VARCHAR(20))
BEGIN
    IF dept IS NULL THEN
        SELECT * FROM products P;
    ELSE
        SELECT * FROM products P WHERE department = dept;
    END IF;
END $$
DELIMITER ;

-- Calling the procedure with a specific department
CALL getProductByDepartmentDefault('HOME');
DROP PROCEDURE IF EXISTS getProductByDepartmentDefault;

-- Another approach for procedure with default values using IFNULL
DELIMITER $$
CREATE PROCEDURE getProductByDepartmentIfNull(dept VARCHAR(20))
BEGIN
    SELECT * FROM products P
    WHERE P.department = IFNULL(dept, P.department);
END $$
DELIMITER ;

-- Calling the procedure with NULL
CALL getProductByDepartmentIfNull(NULL);
DROP PROCEDURE IF EXISTS getProductByDepartmentIfNull;

-- Parameter validation in stored procedure
DELIMITER $$
CREATE PROCEDURE getProductByDepartmentWithValidation(dept VARCHAR(20))
BEGIN
    IF dept IS NULL THEN
        SIGNAL SQLSTATE '22004'
            SET MESSAGE_TEXT = 'NULL_POINTER_EXCEPTION';
    END IF;

    SELECT * FROM products P WHERE P.department = dept;
END $$
DELIMITER ;

-- Calling the validated procedure with NULL
CALL getProductByDepartmentWithValidation(NULL);
DROP PROCEDURE IF EXISTS getProductByDepartmentWithValidation;

-- Using variables in stored procedure
DELIMITER $$
CREATE PROCEDURE getMaxPriceDiffOfProducts()
BEGIN
    DECLARE maxPrice DECIMAL(9, 2);
    DECLARE minPrice DECIMAL(9, 2);
    DECLARE diff INT;

    SELECT MAX(price), MIN(price)
    INTO maxPrice, minPrice
    FROM products P;

    SET diff = maxPrice - minPrice;
    SELECT diff;
END $$
DELIMITER ;

-- Calling the procedure to get max price difference
CALL getMaxPriceDiffOfProducts();
DROP PROCEDURE IF EXISTS getMaxPriceDiffOfProducts;

-- ========================
-- Transactions & Concurrency
-- ========================
/*
A transaction is a sequence of one or more SQL operations executed as a single unit of work.
It ensures that these operations either succeed completely or fail completely, maintaining data integrity.

ACID Properties
=================
 1. Atomicity: Ensures that a transaction is all-or-nothing. Either all operations within the transaction are completed successfully, or none are applied (rolled back in case of failure).
 2. Consistency: Ensures that a transaction brings the database from one valid state to another. The data should be valid both before and after the transaction, ensuring data integrity.
 3. Isolation: Ensures that the operations of one transaction are independent of other concurrent transactions. The outcome of a transaction should not be affected by others running simultaneously.
 4. Durability: Ensures that once a transaction is committed, the changes made are permanent, even in the case of a system failure (e.g., power loss).
*/

-- Stored procedure to update a transaction
DELIMITER $$
CREATE PROCEDURE updateTrnxProc(id INT, value VARCHAR(20))
BEGIN
    START TRANSACTION;
    INSERT INTO transactions (id, value) VALUES (id, 'DummyData');

    IF VALUE IS NULL THEN
        ROLLBACK;
    ELSE
        UPDATE transactions t SET t.value = value WHERE t.id = id;
        COMMIT;
    END IF;
END $$
DELIMITER ;

-- Dropping the procedure if it exists
DROP PROCEDURE IF EXISTS updateTrnxProc;

-- Calling the procedure to update transactions
CALL updateTrnxProc(1, 'HELLO');
CALL updateTrnxProc(2, NULL);

-- Selecting all transactions to verify changes
SELECT * FROM TRANSACTIONS;

/*
Concurrency Problems:
1. Dirty Reads: A transaction reads uncommitted changes from another transaction.
2. Non-repeatable Reads: A transaction re-reads data and finds that the data has changed due to another transaction’s commit.
3. Phantom Reads: New rows are inserted by another transaction that may not be available in the current transaction.

Isolation Levels:
1. READ UNCOMMITTED: Allows transactions to see uncommitted changes made by other transactions.
2. READ COMMITTED: Transactions only see changes committed by other transactions.
3. REPEATABLE READ: Ensures that if a transaction reads data, the same data is read again even if other transactions modify it. (MySQL's default)
4. SERIALIZABLE: The strictest isolation level where transactions are executed one at a time, ensuring no overlap.
*/

-- Display the current transaction isolation level
SHOW VARIABLES LIKE 'transaction_isolation';

-- Set the transaction isolation level to SERIALIZABLE for the current transaction
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Set the transaction isolation level to SERIALIZABLE for the current session
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Set the global transaction isolation level to SERIALIZABLE for all new sessions
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- ========================
-- Triggers
-- ========================
-- A trigger is a block of code that automatically gets executed before or after an INSERT, UPDATE, or DELETE statement.

-- Show all triggers in the current database
SHOW TRIGGERS;

-- Create the audit table to log changes
CREATE TABLE audit_table (
    id INT PRIMARY KEY AUTO_INCREMENT,
    value VARCHAR(20),
    status VARCHAR(20),
    updatedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger for INSERT operations
DELIMITER $$
CREATE TRIGGER updateAuditAfterInsert
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO audit_table (value, status)
    VALUES (NEW.value, NEW.status);
END $$

DELIMITER ;

-- View the audit table after an insert
SELECT * FROM audit_table;

-- Trigger for UPDATE operations
DELIMITER $$
CREATE TRIGGER updateAuditAfterUpdate
AFTER UPDATE ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO audit_table (value, status)
    VALUES (NEW.value, NEW.status);
END $$

DELIMITER ;

-- Trigger for DELETE operations
DELIMITER $$
CREATE TRIGGER updateAuditAfterDelete
AFTER DELETE ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO audit_table (value, status)
    VALUES (OLD.value, OLD.status);
END $$

DELIMITER ;

-- ========================
-- Events
-- ========================
-- An event is a task or a block of code that gets executed according to a schedule.

-- Check the status of the event scheduler
SHOW VARIABLES LIKE 'event_scheduler';

-- Enable the event scheduler
SET GLOBAL event_scheduler = ON;

-- Show the current processes
SHOW PROCESSLIST;

-- Show all scheduled events
SHOW EVENTS;

-- Create an event to update transaction statuses every minute
DELIMITER $$
CREATE EVENT minute_update
ON SCHEDULE
    EVERY 1 MINUTE
    STARTS NOW()  -- Can also be set to a future date
DO
BEGIN
    UPDATE transactions
    SET status = 'done',
        last_modified_time = NOW()  -- Assuming this column exists
    WHERE status IS NULL
      AND created_time < DATE_SUB(NOW(), INTERVAL 1 MINUTE);
END $$

DELIMITER ;

SELECT * FROM transactions;
INSERT INTO transactions (id, value, status)
