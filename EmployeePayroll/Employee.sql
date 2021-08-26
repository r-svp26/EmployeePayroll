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




