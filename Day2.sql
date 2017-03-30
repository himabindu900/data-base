create table sample.dbo.test (id int, ename varchar(10))
ALTER TABLE sample.dbo.test ADD egender varchar
ALTER TABLE sample.dbo.test drop column id
ALTER TABLE sample.dbo.test ALTER column  ename int
use sample
sp_RENAME 'test.employeename' , 'empname', 'column';
 --stored procedure

create table sample.dbo.dept(deptno int , dname  varchar(14), loc    varchar(13),
  constraint pk_dept primary key (deptno));
 
create table sample.dbo.EMPLOYEE (
  empno    int,
  ename    varchar(10),
  job      varchar(9),
  mgr      int,
  hiredate date,
  sal      int,
  comm     int,
  deptno   int,
  constraint pk_empno primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');

INSERT INTO sample.dbo.EMPLOYEE VALUES (7369, 'SMITH',  'CLERK',     7902, '12/17/80',800, NULL, 20);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7499, 'ALLEN',  'SALESMAN',  7698, '5/20/81',1600,  300, 30);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7521, 'WARD',   'SALESMAN',  7698, '5/22/81', 1250,  500, 30);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7566, 'JONES',  'MANAGER',   7839, '4/2/81',  2975, NULL, 20);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7654, 'MARTIN', 'SALESMAN',  7698, '9/28/81', 1250, 1400, 30);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7698, 'BLAKE',  'MANAGER',   7839, '5/1/81',  2850, NULL, 30);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7782, 'CLARK',  'MANAGER',   7839, '6/9/81',  2450, NULL, 10);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7788, 'SCOTT',  'ANALYST',   7566, '12/9/82', 3000, NULL, 20);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7839, 'KING',   'PRESIDENT', NULL, '11/17/81', 5000, NULL, 10);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7844, 'TURNER', 'SALESMAN',  7698, '9/8/1981',  1500,    0, 30);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7876, 'ADAMS',  'CLERK',     7788, '1/12/83', 1100, NULL, 20);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7900, 'JAMES',  'CLERK',     7698, '12/3/81',   950, NULL, 30);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7902, 'FORD',   'ANALYST',   7566, '12/3/81',  3000, NULL, 20);
INSERT INTO sample.dbo.EMPLOYEE VALUES (7934, 'MILLER', 'CLERK',     7782, '1/23/82', 1300, NULL, 10);

select * from dept;
select * from EMPLOYEE;
--http://www.sqlservercurry.com/2016/06/t-sql-date-format-with-convert.html
select ename, hiredate as [Default Date Format],convert(varchar, hiredate, 101) as [American],
convert(varchar, hiredate, 103) as [British] from sample.dbo.EMPLOYEE;

select COUNT(1) as 'total records' from sample.dbo.EMPLOYEE;

/* SELECT - extracts data from a database
UPDATE - updates data in a database
DELETE - deletes data from a database
INSERT INTO - inserts new data into a database
CREATE DATABASE - creates a new database
ALTER DATABASE - modifies a database
CREATE TABLE - creates a new table
ALTER TABLE - modifies a table
DROP TABLE - deletes a table
CREATE INDEX - creates an index (search key)
DROP INDEX - deletes an index */

select distinct(job) from sample.dbo.EMPLOYEE;
SELECT * FROM sample.dbo.EMPLOYEE WHERE job = 'CLERK';

/* The following operators can be used in the WHERE clause:

Operator	Description
=			Equal
<>			Not equal. Note: In some versions of SQL this operator may be written as !=
>			Greater than
<			Less than
>=			Greater than or equal
<=			Less than or equal
BETWEEN		Between an inclusive range
LIKE		Search for a pattern
IN			To specify multiple possible values for a column 
*/

SELECT * FROM sample.dbo.EMPLOYEE;
SELECT * FROM sample.dbo.EMPLOYEE WHERE job = 'CLERK' AND sal > 1000;
SELECT * FROM sample.dbo.EMPLOYEE WHERE job = 'CLERK' OR sal > 1000;
SELECT * FROM sample.dbo.EMPLOYEE WHERE  job = 'SALESMAN' AND (deptno = 20 OR deptno = 30);

SELECT * FROM sample.dbo.EMPLOYEE ORDER BY JOB;
SELECT * FROM sample.dbo.EMPLOYEE ORDER BY job DESC;
SELECT * FROM sample.dbo.EMPLOYEE ORDER BY job DESC, sal ASC;

-- The DELETE command is used to remove rows from a table.A WHERE clause can be used to only remove some rows. If no WHERE condition is specified,
-- all rows will be removed. After performing a DELETE operation you need to COMMIT or ROLLBACK the transaction to make the change permanent or to undo it. 
SELECT COUNT(*) FROM sample.dbo.EMPLOYEE WHERE job = 'CLERK';
DELETE FROM sample.dbo.EMPLOYEE WHERE job = 'CLERK';
--commit;
--rollback;

--TRUNCATE removes all rows from a table. The operation cannot be rolled back and no triggers will be fired.
-- As such, TRUCATE is faster and doesn't use as much undo space as a DELETE.
TRUNCATE TABLE sample.dbo.EMPLOYEE;

--The DROP command removes a table from the database. All the tables' rows, indexes and privileges will also be removed.
 --No DML triggers will be fired. The operation cannot be rolled back.
DROP TABLE sample.dbo.EMPLOYEE;

SELECT TOP 7 * FROM sample.dbo.EMPLOYEE;
SELECT * FROM sample.dbo.EMPLOYEE WHERE deptno IN (10,20);
-- deptno = 10 OR   deptno = 20
SELECT * FROM sample.dbo.EMPLOYEE WHERE sal BETWEEN 1000 AND 2000;
SELECT * FROM sample.dbo.EMPLOYEE WHERE sal NOT BETWEEN 1000 AND 2000;

select * into sample.dbo.EMPLOYEE1 from sample.dbo.EMPLOYEE

SELECT * FROM sample.dbo.EMPLOYEE
UNION
SELECT * FROM sample.dbo.EMPLOYEE1;

SELECT * FROM sample.dbo.EMPLOYEE
UNION ALL
SELECT * FROM sample.dbo.EMPLOYEE1;

--> SQL Aggregate Functions
/*
AVG() - Returns the average value
COUNT() - Returns the number of rows
FIRST() - Returns the first value
LAST() - Returns the last value
MAX() - Returns the largest value
MIN() - Returns the smallest value
SUM() - Returns the sum
*/

--> SQL Scalar functions
/*
UCASE() - Converts a field to upper case
LCASE() - Converts a field to lower case
MID() - Extract characters from a text field
LEN() - Returns the length of a text field
ROUND() - Rounds a numeric field to the number of decimals specified
NOW() - Returns the current system date and time
FORMAT() - Formats how a field is to be displayed
*/
--floor & ceil
SELECT * FROM SAMPLE.dbo.EMPLOYEE1 WHERE DEPTNO = 10
SELECT COUNT(*) FROM SAMPLE.dbo.EMPLOYEE1
SELECT DEPTNO,JOB,COUNT(*) AS 'CNT' FROM SAMPLE.dbo.EMPLOYEE1 GROUP BY DEPTNO, JOB ORDER BY DEPTNO desc;
SELECT MAX(SAL) FROM SAMPLE.dbo.EMPLOYEE1
SELECT MIN(SAL) FROM SAMPLE.dbo.EMPLOYEE1
SELECT AVG(SAL) FROM SAMPLE.dbo.EMPLOYEE1

--SELF JOIN
SELECT E1.* FROM EMPLOYEE1 E1 JOIN ( SELECT MIN(SAL) AS 'M' FROM EMPLOYEE1 ) E2 ON (E1.SAL = E2.M) ;
SELECT JOB, SUM(SAL) FROM EMPLOYEE1 WHERE DEPTNO = 10 GROUP BY JOB HAVING SUM(SAL) > 3000

--SQL CONSTRAINTS

/*NOT NULL - Indicates that a column cannot store NULL value
UNIQUE - Ensures that each row for a column must have a unique value
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Ensures that a column (or combination of two or more columns) 
				have a unique identity which helps to find a particular record in a table more easily and quickly
FOREIGN KEY - Ensure the referential integrity of the data in one table to match values in another table
CHECK - Ensures that the value in a column meets a specific condition
DEFAULT - Specifies a default value for a column */

--> Not Null
CREATE TABLE PersonsNotNull
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

--> Unique
CREATE TABLE PersonsUnique
(
P_Id int ,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

ALTER TABLE PersonsUnique ADD UNIQUE (P_Id)
ALTER TABLE PersonsUnique DROP CONSTRAINT UQ__PersonsU__A3420A560AD2A005

--> Primary Key
CREATE TABLE PersonsPrimary
(
P_Id int ,
LastName varchar(255) ,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT pk_PersonID PRIMARY KEY (P_Id)
)

ALTER TABLE PersonsPrimary DROP CONSTRAINT pk_PersonID
ALTER TABLE PersonsPrimary ADD CONSTRAINT pk_PersonID PRIMARY KEY (P_Id)

--> Check Key
CREATE TABLE PersonsCheck
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT chk_Person CHECK (P_Id>0)
)

ALTER TABLE PersonsCheck DROP CONSTRAINT chk_Person
ALTER TABLE PersonsCheck ADD CONSTRAINT chk_Person CHECK (P_Id>18)

--> Default Key
CREATE TABLE PersonsDefault
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

ALTER TABLE PersonsDefault ADD  CONSTRAINT dk_person  DEFAULT 'hyderabad' for City
ALTER TABLE PersonsDefault DROP CONSTRAINT dk_person

-- Next Session
/*
Inner Join
Outer Join
	left
	right
	full
Cross (special)




views
triggers
stored procedures
indexes
cursors
transactions */
--> Index

CREATE INDEX emp_ind ON sample.dbo.EMPLOYEE (empno)
DROP INDEX emp_ind ON sample.dbo.EMPLOYEE

create view [top] as
SELECT TOP 5 * FROM sample.dbo.EMPLOYEE;
DROP VIEW [top]

--> Date Function
/*
GETDATE()	Returns the current date and time
DATEPART()	Returns a single part of a date/time
DATEADD()	Adds or subtracts a specified time interval from a date
DATEDIFF()	Returns the time between two dates
CONVERT()	Displays date/time data in different formats

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: a unique number
*/

