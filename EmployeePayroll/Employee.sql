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



















