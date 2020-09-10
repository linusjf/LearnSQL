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
DROP TABLE IF EXISTS SUITE;
DROP TABLE IF EXISTS COMPLEX;
CREATE TABLE COMPLEX (
  BLDG_ID INTEGER(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  BLDG_NAME VARCHAR (20) NOT NULL
);
CREATE TABLE SUITE (
  BLDG_ID INTEGER(3) NOT NULL,
  ROOM_ID CHAR(6) NOT NULL,
  ROOM_NAME VARCHAR (20) NOT NULL,
  ROOM_LEVEL TINYINT UNSIGNED NOT NULL,
  SEATING_CAPACITY INTEGER (3) NOT NULL,
  PRIMARY KEY (BLDG_ID, ROOM_ID),
  FOREIGN KEY (BLDG_ID) REFERENCES COMPLEX(BLDG_ID)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);
CREATE VIEW ALL_ROOMS AS
(SELECT BLDG_NAME, ROOM_NAME, 
ROOM_LEVEL, SEATING_CAPACITY FROM COMPLEX, SUITE
WHERE COMPLEX.BLDG_ID = SUITE.BLDG_ID);
