/*
joins are of two types
	1.inner
	2.outer
		a.left
		b.right
		c.full
cartession product

*/

use sample;
--Join
SELECT e.*, d.dname,d.loc
FROM EMPLOYEE e
INNER JOIN dept d
ON e.deptno = d.deptno;

-- left outer join
SELECT e.*, d.dname,d.loc
FROM EMPLOYEE e
LEFT JOIN dept d
ON e.deptno=d.deptno;

--right outer join
SELECT e.*, d.*
FROM EMPLOYEE e
RIGHT JOIN dept d
ON e.deptno=d.deptno;

-- full outer join
SELECT e.*, d.*
FROM EMPLOYEE e
FULL OUTER JOIN dept d
ON e.deptno=d.deptno;

--cartision product
SELECT e.*, d.dname,d.loc
FROM EMPLOYEE e
CROSS JOIN dept d;

/*
1 2 3 4 5
a b c

1a 1b 1c
2a 2b 2c

*/

 /* A stored procedure is nothing more than stored SQL code that you would like to use over and over again. 
 Before you create a stored procedure you need to know what your end result is, whether you are selecting data,
 inserting data, etc.. */

 select * from EMPLOYEE;

USE sample

-- creating a stored procedure
CREATE PROCEDURE dbo.selectingnotnull
AS
SELECT * FROM EMPLOYEE where comm is not null


--calling a sp
exec dbo.selecting
exec selecting
selecting

selectingnotnull;

-- input parameterized sp
CREATE PROCEDURE dbo.selectingJob @job nvarchar(30), @dept int
AS
-- SELECT * FROM EMPLOYEE WHERE job = 'manager' or deptno = 10 (static)
SELECT * 
FROM EMPLOYEE
WHERE job = @job or deptno = @dept

--execution
selectingJob @job = 'ANALYST', @dept = 0

-- output parameterized sp
CREATE PROCEDURE dbo.employeeCount @job nvarchar(30), @cnt int OUTPUT
AS
SELECT  @cnt = count(*)  
FROM EMPLOYEE 
WHERE job = @job -- the @job parameter value will narrow the search criteri

--execution
declare @counted int 
exec employeeCount 'manager' ,@counted output
select @counted

--Naming convencions
/*
Don't
	sp_
Does
	spInsertPerson
	uspInsertPerson
	usp_InsertPerson (best)
	InsertPerson
*/

-- Naming Stored Procedure Action
/*
Insert
Delete
Update
Select
Get
Validate
etc...
*/

-- Naming Stored Procedure objects
/*
uspInsertPerson - insert a new person record
uspGetAccountBalance - get the balance of an account
uspGetOrderHistory - return list of orders
*/

-- not using SET NOCOUNT ON 
CREATE PROCEDURE dbo.uspJobDetails @job nvarchar(15)
AS
SELECT * 
FROM EMPLOYEE
WHERE job = @job


-- using SET NOCOUNT ON s
CREATE PROCEDURE dbo.uspJobDetailson @job nvarchar(30)
AS
SET NOCOUNT ON
SELECT * 
FROM EMPLOYEE
WHERE job = @job
PRINT @@ROWCOUNT

DROP PROCEDURE dbo.uspJobDetails, dbo.employeeCount


select * from EMPLOYEE;

--switch case
SELECT [empno],[ename][job],[mgr],[hiredate],[sal],[comm],[deptno],
case [deptno]
when 10 then 'accounts'
when 20 then 'hr'
else 'unknown'
end  as [modified deptno]
  FROM [sample].[dbo].[EMPLOYEE]
  
  
-- pending
/*
modifying sp
SET NOCOUNT ON
if condition in select statement
*/