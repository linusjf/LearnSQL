/* 
DDL commands to set up tables in
the database. Using the database test 
installed with MySQL.
*/
use test;
Drop Table IF EXISTS Employee;
Create Table Employee (
  EmpId Integer (10) NOT NULL auto_increment primary key,
  FirstName Varchar (20) NOT NULL,
  LastName Varchar (20) NOT NULL,
  MiddleName Varchar (20) default '',
  BirthDate Date NOT NULL,
  Salary Decimal (20, 4) NOT NULL,
  Address Varchar (50) NOT NULL
);
Drop Table IF EXISTS Student;
Create Table Student (
  StudentId Integer (10) NOT NULL auto_increment primary key,
  FirstName Varchar (20) NOT NULL,
  LastName Varchar (20) NOT NULL,
  MiddleName Varchar (20) default '',
  BirthDate Date,
  State char (2) Not NULL,
  City Varchar (20)
);
Drop Table IF EXISTS Course;
Create Table Course (
  CourseId Char (6) NOT NULL PRIMARY KEY,
  DepartmentId char (6) NOT NULL,
  Title Varchar (20) Not NUll,
  Description Varchar (30) default ''
);