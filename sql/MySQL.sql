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
1. Atomicity: Ensures that a transaction is all-or-nothing.
2. Consistency: Ensures that a transaction brings the database from one valid state to another.
3. Isolation: Ensures that the operations of one transaction are independent of other concurrent transactions.
4. Durability: Ensures that once a transaction is committed, the changes made are permanent.
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

-- Select all transactions to verify changes
SELECT * FROM transactions;

-- Insert a new transaction with null status
INSERT INTO transactions (id, value, status)
