-- subquery

-- subQuery in select clause
SELECT FIRST_NAME AS ID1,
       (SELECT FIRST_NAME FROM USERS WHERE ID = 2) AS ID2
FROM USERS
WHERE ID = 1;

-- subQuery in from clause
SELECT * FROM
    (SELECT * FROM USERS WHERE ID = 1) AS TEMPORARY;

-- subQuery in where clause using all keyword
-- The ALL operator in SQL is used to compare a value against all values returned by a subquery.
SELECT * FROM PRODUCTS P
WHERE PRICE > ALL(
    SELECT PRICE FROM PRODUCTS P2 WHERE DEPARTMENT = 'INDUSTRIAL'
);

-- subQuery in where clause using some keyword
-- The SOME operator in SQL is used to compare a value against any value returned by a subquery.
SELECT * FROM PRODUCTS P
WHERE PRICE > SOME (
    SELECT PRICE FROM PRODUCTS P2 WHERE DEPARTMENT = 'HOME'
);

--  Correlated / Non-Correlated subquery
/*
  * Correlated Subquery
  * A subquery that references columns from the outer query, allowing it to return different results for each row processed by the outer query.
  * Non-Correlated Subquery
  * A subquery that is independent of the outer query, returning a single result set that can be used by the main query.
  */

-- Coreleated Subquery
SELECT name, department, price
FROM products p
WHERE p.price = (
    SELECT MAX(price)
    FROM products p2
    WHERE p2.department = p.department
);

-- Views

-- Creating a view
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

DROP VIEW maxPriceView;

-- Stored Procedure - Contains a block of SQL code to retrieve/store data.
DELIMITER $$

CREATE PROCEDURE getProducts()
BEGIN
    SELECT * FROM products;
END $$

DELIMITER ;

CALL getProducts();
DROP PROCEDURE IF EXISTS getProducts;


-- Procedure with parameters
DELIMITER $$

CREATE PROCEDURE getProductByDepartment(DEPT VARCHAR(20))
BEGIN
    SELECT * FROM products P WHERE department = DEPT;
END $$

DELIMITER ;

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

CALL getProductByDepartmentIfNull(NULL);
DROP PROCEDURE IF EXISTS getProductByDepartmentIfNull;


-- Parameter validation
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

CALL getProductByDepartmentWithValidation(NULL);
DROP PROCEDURE IF EXISTS getProductByDepartmentWithValidation;


-- Using variables
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

CALL getMaxPriceDiffOfProducts();
DROP PROCEDURE IF EXISTS getMaxPriceDiffOfProducts;
