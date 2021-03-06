Terminal Commands
-

Install Cassandra (Mac):

```ruby
brew install cassandra
```

Launch Cassandra:

```ruby
cassandra -f
```

Run Cassandra shell in new Terminal tab:

```ruby
cqlsh
```
![run-cassandra](pics/1-run.png)

Create and start using keyspace:

```ruby
CREATE KEYSPACE employee_keyspace
WITH REPLICATION = {'class':'SimpleStrategy', 'replication_factor':0};
USE employee_keyspace;
```

Create table:

```ruby
CREATE TABLE employee_table (empno INT PRIMARY KEY, ename TEXT, jobtitle TEXT, hiredate DATE);
```
![create-table](pics/2-create-table.png)

Insert values into table:

```ruby
INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (1, 'Amy', 'lawyer', '1980-01-17');

INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (2, 'Brian', 'lawyer', '1990-01-17');

INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (3, 'Catherine', 'clerk', '2000-01-17');

INSERT INTO employee_table (empno, ename, jobtitle, hiredate)
VALUES (4, 'Daniel', 'clerk', '2010-01-17');
```

List the empno, ename, jobtitle, and hiredate of employee from the employee table.

```ruby
SELECT empno, ename, jobtitle, hiredate from employee_table;
```

Add a "salary" column to the table, update the table, and set the salary amount for each employee.

```ruby
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
```

List the name and salary of the employees who are clerks.

```ruby
SELECT ename, salary from employee_table
WHERE jobtitle = 'clerk';
```

List the name, job, and salary of every employee who was hired on December 17, 1980.

```ruby
SELECT ename, jobtitle, salary from employee_table
WHERE  hiredate = '1980-12-17';
```
List name and annual salary of all the employees.

```ruby
SELECT ename, salary from employee_table
```

Add "deptname" and "deptno" columns to the table. Update the table and set the deptname and deptno for each employee.

```ruby
ALTER TABLE employee_table ADD deptname TEXT, deptno INT;

UPDATE employee_table
SET deptname = 'law'
SET deptno = 19
WHERE jobtitle 'lawyer';

UPDATE employee_table
SET deptname = 'legalaid'
SET deptno = 20
WHERE jobtitle 'clerk';
```

List the department name & deptno for departments having a deptno. >=20

```ruby
SELECT dname, deptno from employee_table
WHERE deptno >= 20;
```

Add "manager" column to the table. Update the table and set the manager value for each employee.

```ruby
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
```

Display employees’ names, salary, and manager values of those employees whose salary is 500 from employee_table using SELECT statement.

```ruby
SELECT dname, salary, manager from employee_table
WHERE salary == 500;
```