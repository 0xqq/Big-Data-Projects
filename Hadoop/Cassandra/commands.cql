-- Author: Shaina Krumme
-- Date: 19 June 2018
-- Description: Commands to demonstrate how to use Cassandra.

-- Installing Cassandra with Homebrew: brew install cassandra
-- Launch Cassandra: cassandra -f
-- Open new Terminal tab to Run Cassandra shell: cqlsh

-- Create and start using keyspace

CREATE KEYSPACE employee_keyspace
WITH REPLICATION = {'class':'SimpleStrategy', 'replication_factor':0};
USE employee_keyspace

-- Create table
-- Create table columns: empno, ename, jobtitle, and hiredate of employee

CREATE TABLE employee_table
(empno INT, ename TEXT, jobtitle TEXT, hiredate DATE);

-- Insert values into table.

INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (1, 'Amy', 'lawyer', '1980-01-17');

INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (2, 'Brian', 'lawyer', '1990-01-17');

INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (3, 'Catherine', 'clerk', '2000-01-17');

INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (4, 'Daniel', 'clerk', '2010-01-17');

-- List the empno, ename, jobtitle, and hiredate of employee from the employee table.

SELECT empno, ename, jobtitle, hiredate from employee_table;

-- Add column to table: salary
-- Update the table and set the salary amount for each employee.

ALTER TABLE employee_table ADD salary INT;

UPDATE employee_table
SET salary = 1500
WHERE empno 1;

UPDATE employee_table
SET salary = 1500
WHERE empno = 2;

UPDATE employee_table
SET salary = 500
WHERE empno = 3;

UPDATE employee_table
SET salary = 500
WHERE empno = 4;

-- List the name and salary of the employees who are clerks.

SELECT ename, salary from employee_table
WHERE jobtitle = 'clerk';

-- List the name,job,salary of every employee joined on ‘december 17,1980’

SELECT ename, jobtitle, salary from employee_table
WHERE  hiredate = '1980-12-17';

-- List name and annual salary of all the employees.

SELECT ename, salary from employee_table

-- Add columns to table: deptname, deptno
-- Update the table and set the deptname and deptno for each employee.

ALTER TABLE employee_table ADD deptname TEXT, deptno INT;

UPDATE employee_table
SET deptname = 'law'
SET deptno = 19
WHERE jobtitle 'lawyer';

UPDATE employee_table
SET deptname = 'legalaid'
SET deptno = 20
WHERE jobtitle 'clerk';

-- List the department name & deptno for departments having deptno. >=20

SELECT dname, deptno from employee_table
WHERE  = deptno >= 20;

-- Add columns to table: manager
-- Update the table and set the manager value for each employee.

ALTER TABLE employee_table ADD manager INT;

UPDATE employee_table
SET manager = 500;
WHERE empno 1;

UPDATE employee_table
SET manager = 500;
WHERE empno = 2;

UPDATE employee_table
SET manager = 600;
WHERE empno = 3;

UPDATE employee_table
SET manager = 600;
WHERE empno = 4;

-- Display employees’ names, salary and manager values of those employees whose
-- salary is 500 from employee_table using SELECT statement.

SELECT dname, salary, manager from employee_table
WHERE salary == 500;
