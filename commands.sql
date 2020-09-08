
use test;

Drop Table IF EXISTS Employee;
Create Table Employee
(EmpId Integer (10) NOT NULL auto_increment primary key, 
  FirstName Varchar (20) NOT NULL,
  LastName Varchar (20) NOT NULL,
  MiddleName Varchar (20),
BirthDate Date NOT NULL,
Salary Decimal (20, 4) NOT NULL,
Address Varchar (50) NOT NULL);

Drop Table IF EXISTS Student;
Create Table Student
(StudentId Integer (10) NOT NULL auto_increment primary key, 
FirstName Varchar (20) NOT NULL,
  LastName Varchar (20) NOT NULL,
  MiddleName Varchar (20),
BirthDate Date,
State Varchar (20),
City Varchar (20));

Drop Table IF EXISTS Course;
Create Table Course
(CourseId Varchar (5),
DepartmentId Varchar (20),
Title Varchar (20),
Description Varchar (20));
