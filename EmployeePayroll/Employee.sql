/* Create Database */
CREATE DATABASE payroll_service

/* Show the Databases */
SELECT * 
FROM Sys.Databases

/* Use Database */
USE payroll_service

/* Create Table */
CREATE TABLE employee_payroll(
ID int identity (1,1) primary key,
Name varchar(255),
Salary int,
StartDate date
)

/* Insert into employee_payroll */
INSERT INTO employee_payroll(Name, Salary, StartDate ) VALUES ('Ritesh', 50000, '2010-01-01')
INSERT INTO employee_payroll(Name, Salary, StartDate ) VALUES ('Bill', 40000, '2018-01-01')
INSERT INTO employee_payroll(Name, Salary, StartDate ) VALUES ('Charlie', 30000, '2016-04-07')

/* Retrieve all the data from employee_payroll */
SELECT *
FROM employee_payroll

/* Retrieve particular data from employee_payroll */
SELECT *
FROM employee_payroll
WHERE Name='Bill' AND StartDate BETWEEN CAST('2018-01-01' AS DATE ) AND GETDATE();

/* Add Gender Column */
ALTER TABLE employee_payroll 
ADD Gender VARCHAR(2)

/* Set Gender */
UPDATE employee_payroll set Gender='M' 
WHERE Name='Bill' OR Name='Charlie'

/* Count Male & Female Employee */
SELECT SUM(Salary) AS TotalSalary, AVG(Salary) AS AverageSalary, MIN(Salary) AS MinimumSalary, 
	   MAX(Salary) AS MaximumSalary, COUNT(*) AS TotalEmployee
FROM employee_payroll
WHERE Gender='M' GROUP BY Gender 

SELECT SUM(Salary) AS TotalSalary, AVG(Salary) AS AverageSalary, MIN(Salary) AS MinimumSalary, 
	   MAX(Salary) AS MaximumSalary, COUNT(*) AS TotalEmployee
FROM employee_payroll
WHERE Gender='F' GROUP BY Gender 

/* Add Employee Infomation */
ALTER TABLE employee_payroll 
ADD phone_number VARCHAR(12), address VARCHAR(40) DEFAULT ('INDIA'), department VARCHAR (20) NOT NULL DEFAULT ('Engineering');

/* Update Employee Information */
UPDATE employee_payroll SET phone_number='9907296689'
Where Name='Ritesh'

UPDATE employee_payroll SET phone_number='7987210395'
Where Name='Charlie'

UPDATE employee_payroll SET phone_number='9907296600'
Where Name='Bill'

UPDATE employee_payroll SET department='Account'
Where Name='Charlie'

UPDATE employee_payroll SET department='Operation'
Where Name='Bill'

/* Extend employee_payroll  */
ALTER TABLE employee_payroll
DROP COLUMN Salary

ALTER TABLE employee_payroll Add BasicPay int, Deduction float, TaxablePay float, Tax float, NetPay float

/* Insert Complete Payroll Information */
INSERT INTO employee_payroll(Name, Gender, StartDate, phone_number, address, department, BasicPay, Deduction, TaxablePay, Tax, NetPay ) 
							VALUES('Terissa','F','2010-01-01','7987210210','Patna','Marketing',35000,3500.0,1250.0,250.0,30000.0)

INSERT INTO employee_payroll(Name, Gender, StartDate, phone_number, address, department, BasicPay, Deduction, TaxablePay, Tax, NetPay ) 
							VALUES('Terissa','F','2010-01-01','7987210210','Patna','Sales',35000,3500.0,1250.0,250.0,30000.0)
/* Retrieve the Terissa Information */
SELECT *
FROM employee_payroll
WHERE Name='Terissa';

/* Represents the ER Diagram */
CREATE TABLE Employee 
(
 Emp_Id INT IDENTITY(1,1) PRIMARY KEY,
 Emp_Name VARCHAR(30),
 Gender CHAR(1),
 PhoneNumber VARCHAR(12),
 Address VARCHAR(40),
 City VARCHAR(15),
 State VARCHAR(12),
 Start date
)

CREATE TABLE Company
(
  Company_Id INT IDENTITY(1,1) PRIMARY KEY,
  Company_Name VARCHAR(40),
  Emp_Id INT FOREIGN KEY REFERENCES Employee(Emp_Id)
)

CREATE TABLE Department
(
  Dept_Id INT IDENTITY(1,1) PRIMARY KEY,
  Dept_Name VARCHAR(15),
  Emp_Id INT FOREIGN KEY REFERENCES Employee(Emp_Id)
)

CREATE TABLE PayRoll
(
  BasicPay INT, 
  Deduction FLOAT, 
  TaxablePay FLOAT, 
  Tax FLOAT,
  NetPay FLOAT,
  Emp_Id INT FOREIGN KEY REFERENCES Employee(Emp_Id)
)

CREATE TABLE Employee_Department
(
  Emp_Id INT FOREIGN KEY REFERENCES Employee(Emp_Id),
  Dept_Id INT FOREIGN KEY REFERENCES Department(Dept_Id),
)

/* Insert data into Employee */
INSERT INTO Employee VALUES('Ritesh','M','9907296689','Khaspur','Patna','Bihar','2010-01-01')
INSERT INTO Employee VALUES('Abhinav','M','7987210395','BTM','Bangalore','KA','2020-02-04')
INSERT INTO Employee VALUES('Shyam','M','9988998899','Sorojni','Delhi','Delhi','2021-03-10')

/* Insert data into Company */
INSERT INTO Company Values ('TCS',1)
INSERT INTO Company Values ('TCS',3)
INSERT INTO Company Values ('IBM',2)

-- Retrieve the data from tables
SELECT *
FROM Employee
SELECT *
FROM Company

/* Ensure all the retrive queries */

-- UC4 Validation
SELECT *
FROM employee_payroll
-- UC5 Validation
SELECT *
FROM employee_payroll
WHERE Name='Bill' AND StartDate BETWEEN CAST('2018-01-01' AS DATE ) AND GETDATE();

-- UC7 Validation
SELECT SUM(NetPay) AS Salary, AVG(NetPay) AS AverageSalary, MIN(NetPay) AS MinimumSalary, 
	   MAX(NetPay) AS MaximumSalary, COUNT(*) AS TotalEmployee
FROM employee_payroll
WHERE Gender='M' GROUP BY Gender 

SELECT SUM(NetPay) AS Salary, AVG(NetPay) AS AverageSalary, MIN(NetPay) AS MinimumSalary, 
	   MAX(NetPay) AS MaximumSalary, COUNT(*) AS TotalEmployee
FROM employee_payroll
WHERE Gender='F' GROUP BY Gender 































