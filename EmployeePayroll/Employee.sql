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
