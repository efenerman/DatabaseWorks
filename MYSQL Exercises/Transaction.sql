-- ---------TRANSACTIONS--------------
--
DROP TABLE T1;
CREATE TABLE T1 (ID INT);
INSERT INTO T1 VALUES(1);
-- EXAMPLE 1
SELECT * FROM T1; 
START TRANSACTION;  
UPDATE T1 SET ID=2;
SELECT * FROM T1; 
ROLLBACK;
SELECT * FROM T1;

-- EXAMPLE 2
SELECT * FROM T1; 
START TRANSACTION;  
UPDATE T1 SET ID=2;
SELECT * FROM T1; 
COMMIT;
SELECT * FROM T1; 	    
ROLLBACK;
SELECT * FROM T1;    

-- EXAMPLE 3
SELECT * FROM T1; 
START TRANSACTION;
UPDATE T1 SET ID=3;
SELECT * FROM T1; 
SAVEPOINT TRAN1;
UPDATE T1 SET ID=4;
SELECT * FROM T1;
ROLLBACK TO TRAN1;
SELECT * FROM T1;
ROLLBACK;
SELECT * FROM T1;
-- REMEMBER
-- ALL SAVEPOINTS OF THE CURRENT TRANSACTION ARE DELETED 
-- IF YOU EXECUTE A COMMIT, 
-- OR A ROLLBACK THAT DOES NOT NAME A SAVEPOINT. 
-- EXAMPLE 4 
SELECT * FROM T1; 
START TRANSACTION;
UPDATE T1 SET ID=3;
SELECT * FROM T1; 
SAVEPOINT TRAN1;
UPDATE T1 SET ID=4;
SELECT * FROM T1;
ROLLBACK;
SELECT * FROM T1;
ROLLBACK TO TRAN1;
SELECT * FROM T1;
	
-- EXAMPLE 5
SELECT * FROM T1; 
START TRANSACTION;
UPDATE T1 SET ID=3;
SELECT * FROM T1; 
SAVEPOINT TRAN1;
UPDATE T1 SET ID=4;
SELECT * FROM T1;
COMMIT;
SELECT * FROM T1;
ROLLBACK TO TRAN1;
SELECT * FROM T1;

-- EXAMPLE 6
SET AUTOCOMMIT=0;
UPDATE T1 SET ID=5;
SELECT * FROM T1;
ROLLBACK;
SELECT * FROM T1;

-- EXAMPLE 7
SET AUTOCOMMIT=1;
UPDATE T1 SET ID=5;
SELECT * FROM T1;
ROLLBACK;
SELECT * FROM T1;

-- EXAMPLE 8
-- START TRANSACTION; DISABLES AUTOCOMMIT MODE
SET AUTOCOMMIT=1;
START TRANSACTION;
UPDATE T1 SET ID=6;
SELECT * FROM T1;
ROLLBACK;
SELECT * FROM T1;