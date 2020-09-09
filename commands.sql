/* 
DDL commands to set up tables in
the database. Using the database test 
installed with MySQL.
*/
use test;
Drop Table IF EXISTS Staff;
Create Table Staff (
  Emp_Id Integer (10) NOT NULL auto_increment primary key,
  First_Name Varchar (20) NOT NULL,
  Last_Name Varchar (20) NOT NULL,
  Middle_Name Varchar (20) default '',
  Birth_Date Date NOT NULL,
  Salary Decimal (20, 4) NOT NULL,
  Address Varchar (50) NOT NULL
);
Drop Table IF EXISTS Cohort;
Create Table Cohort (
  Student_Id Integer (10) NOT NULL auto_increment primary key,
  First_Name Varchar (20) NOT NULL,
  Last_Name Varchar (20) NOT NULL,
  Middle_Name Varchar (20) default '',
  Birth_Date Date,
  State char (2) Not NULL,
  City Varchar (50) NOT NULL,
  County Varchar(50) NOT NULL
);
Drop Table IF EXISTS Courses;
Create Table Courses (
  Course_Id Char (6) NOT NULL PRIMARY KEY,
  Department_Id char (6) NOT NULL,
  Title Varchar (20) Not NUll,
  Description Varchar (30) default ''
);
