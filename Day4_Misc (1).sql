--TCL IN SQL SERVER
/*COMMIT: to save the changes.
ROLLBACK: to rollback the changes.
SAVEPOINT: creates points within groups of transactions in which to ROLLBACK
SET TRANSACTION: Places a name on a transaction. */

 CREATE TABLE SAMPLE (ID INT, NAME VARCHAR(15),AGE INT, ADDRESS VARCHAR(15),SALARY  INT)

 INSERT INTO SAMPLE VALUES ( 1,  'Ramesh'  ,   32  ,'Ahmedabad' ,  2000.00 )
 INSERT INTO SAMPLE VALUES ( 2,  'Khilan',     25,'  Delhi',       1500.00 )
 INSERT INTO SAMPLE VALUES (3 ,' kaushik',    23 ,' Kota',        2000.00 )
 INSERT INTO SAMPLE VALUES (4 ,' Chaitali',   25 ,' Mumbai',      6500.00 )
 INSERT INTO SAMPLE VALUES (5 ,' Hardik',     27, ' Bhopal ',     8500.00 )
 INSERT INTO SAMPLE VALUES (6,'  Komal',      22,'  MP ',         4500.00 )
 INSERT INTO SAMPLE VALUES (7,  'Muffy',      24,  'Indore',     10000.00)

 SELECT * FROM SAMPLE;

 BEGIN TRAN
 DELETE FROM SAMPLE  WHERE AGE = 25;
 COMMIT;

 BEGIN TRAN
 DELETE FROM SAMPLE  WHERE AGE = 25;
 SELECT * FROM SAMPLE;
 ROLLBACK;

BEGIN TRAN
SAVE TRANSACTION SP1

DELETE FROM SAMPLE WHERE ID=1;
SAVE TRANSACTION SP2

DELETE FROM SAMPLE WHERE ID=2;
SAVE TRANSACTION SP3


DELETE FROM SAMPLE WHERE ID=3;
SELECT * FROM SAMPLE;
ROLLBACK TRAN SP1;

--DATE FUNCTION IN SQL

SELECT CURRENT_TIMESTAMP;
SELECT SYSDATETIME ();
SELECT SYSDATETIMEOFFSET ( );
SELECT SYSUTCDATETIME();
SELECT GETDATE();
SELECT GETUTCDATE();

SELECT DAY(CURRENT_TIMESTAMP);
SELECT MONTH(CURRENT_TIMESTAMP);
SELECT YEAR(CURRENT_TIMESTAMP);

SELECT DATENAME( WEEKDAY , CURRENT_TIMESTAMP );
/*
year	yy, yyyy
quarter	qq, q
month	mm, m
dayofyear	dy, y
day	dd, d
week	wk, ww
weekday	dw, w
hour	hh
minute	mi, n
second	ss, s
millisecond	ms
microsecond	mcs
nanosecond	ns
TZoffset	tz
ISO_WEEK	ISOWK, ISOWW */

SELECT DATEDIFF(MONTH, '2005-12-31 23:59:59.9999999', '2007-01-01 00:00:00.0000000');

SELECT DATEADD(month, 1, '2006-08-30');
SELECT DATEADD(YEAR, 1, '2006-08-31');

SELECT EOMONTH ('2006-08-30');
SELECT switchoffset (CONVERT(datetimeoffset, GETDATE()), '+02:00');

SELECT * FROM SAMPLE WHERE ID IN (SELECT ID  FROM SAMPLE WHERE SALARY > 4500) ;

--INDEXES IN SQL
--Single column index
use dileep;
CREATE INDEX sci ON EMPLOYEE (sal);
CREATE UNIQUE INDEX sciu ON EMPLOYEE (empno);

--Composite column index
CREATE INDEX scic ON EMPLOYEE (deptno,sal);

--Implicit Indexes
	--like primary keys, which exists at the time of table creation
DROP INDEX employee.sciu;

--When you will avoid Indexes

/*
Indexes should not be used on small tables.
Tables that have frequent, large batch update or insert operations.
Indexes should not be used on columns that contain a high number of NULL values.
Columns that are frequently manipulated should not be indexed
*/

--VIEWS IN SQL SERVER
CREATE VIEW EMPLOYEE_VIEW AS SELECT ename, job FROM  EMPLOYEE;
select * from EMPLOYEE_view;
UPDATE EMPLOYEE_VIEW SET job = 'supplier' WHERE ename = 'JONES';
DROP VIEW EMPLOYEE_VIEW;



