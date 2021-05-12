/*
DDL commands to set up tables in
the database. Using the database test
installed with MySQL.
*/
USE test;
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
  dept_id CHAR (6) NOT NULL PRIMARY KEY,
  dept_name VARCHAR (20) NOT NULL
);
DROP TABLE IF EXISTS suite;
DROP TABLE IF EXISTS complex;
CREATE TABLE complex (
  bldg_id integer(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  bldg_name VARCHAR (20) NOT NULL
);
CREATE TABLE suite (
  bldg_id integer(3) NOT NULL,
  room_id char(6) NOT NULL,
  room_name VARCHAR (20) NOT NULL,
  room_level TINYINT UNSIGNED NOT NULL,
  seating_capacity INTEGER (3) NOT NULL,
  PRIMARY KEY (
    bldg_id,
    room_id
  ),
  FOREIGN KEY (bldg_id) REFERENCES complex(bldg_id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE VIEW all_rooms AS (
  SELECT
    bldg_name,
    room_name,
    room_level,
    seating_capacity
  FROM
    complex,
    suite
  WHERE
    complex.bldg_id = suite.bldg_id
);