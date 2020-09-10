/* 
DDL commands to set up tables in
the database. Using the database test 
installed with MySQL.
*/
USE test;
DROP TABLE IF EXISTS DEPARTMENTS;
CREATE TABLE DEPARTMENTS (
  DEPT_ID CHAR (6) NOT NULL PRIMARY KEY,
  DEPT_NAME VARCHAR (20) NOT NULL
);
