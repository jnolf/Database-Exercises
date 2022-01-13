CREATE TEMPORARY TABLE TEMPTABLE1( 
col1 INT UNSIGNED INT NOT NULL);

USE innis_1657;

CREATE TEMPORARY TABLE temptable2( 
col1 INT UNSIGNED NOT NULL);

SELECT DATABASE();
SHOW TABLES;
SELECT * FROM temptable2;

DESCRIBE temptable2;

INSERT INTO temptable2(col1) VALUES (1), (2), (3), (4);

SELECT * FROM temptable1;

SELECT * FROM mall_customers.cutomers LIMIT 5;

CREATE TEMPORARY TABLE fakecustomers AS (SELECT * FROM mall_customers.customers LIMIT 5
);

SELECT * FROM TEMPTABLE1;
DROP TABLE temptable1;
-- GONE!!!

SELECT * FROM fakecustomers;

ALTER TABLE fakecustomers DROP COLUMN annual_income;

ALTER TABLE fakecustomers ADD genderage VARCHAR(40); 

UPDATE fakecustomers SET genderage = concat('gdr: ', gender, ', ' ' age; ', age);

SELECT * 
FROM fakecustomers;


DELETE FROM fakecustomers WHERE customer_id %2 = 0;
SELECT * FROM fakecustomers;

UPDATE fakecustomers SET gender = CASE WHEN gender = 'Female' THEN 'girl' ELSE 'NOT girl'END;
SELECT * FROM fakecustomers;
