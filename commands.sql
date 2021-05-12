/*
DDL commands to set up tables in
the database. Using the database test
installed with MySQL.
*/
USE test;
DROP TABLE IF EXISTS staff_data;
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
  emp_id INTEGER (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  current_version integer(10) NOT NULL,
  is_deleted tinyint(1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  last_updated TIMESTAMP NOT NULL,
  updated_by VARCHAR (20) NOT NULL
);
CREATE TABLE staff_data (
  record_id integer(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  emp_id INTEGER (10) NOT NULL,
  VERSION integer(10) NOT NULL,
  first_name VARCHAR (20) NOT NULL,
  last_name VARCHAR (20) NOT NULL,
  middle_name VARCHAR (20) DEFAULT '',
  birth_date DATE NOT NULL,
  salary DECIMAL (
    20,
    4
  ) NOT NULL,
  address VARCHAR (50) NOT NULL,
  is_deleted TINYINT (1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  FOREIGN KEY (emp_id) REFERENCES staff(emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (
    emp_id,
    VERSION
  )
);
DROP TABLE IF EXISTS cohort_data;
DROP TABLE IF EXISTS cohort;
CREATE TABLE cohort (
  student_id integer(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  current_version integer(10) NOT NULL,
  is_deleted tinyint(1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  last_updated TIMESTAMP NOT NULL,
  updated_by VARCHAR (20) NOT NULL
);
CREATE TABLE cohort_data (
  record_id integer(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  student_id INTEGER (10) NOT NULL,
  VERSION integer(10) NOT NULL,
  first_name VARCHAR (20) NOT NULL,
  last_name VARCHAR (20) NOT NULL,
  middle_name VARCHAR (20) DEFAULT '',
  birth_date DATE,
  city_id int(11) NOT NULL,
  is_deleted TINYINT (1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  FOREIGN KEY (city_id) REFERENCES us_cities(city_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (student_id) REFERENCES cohort(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (
    student_id,
    VERSION
  )
);
DROP TABLE IF EXISTS courses_data;
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
  course_id CHAR (6) NOT NULL PRIMARY KEY,
  current_version integer(10) NOT NULL,
  is_deleted tinyint(1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  last_updated TIMESTAMP NOT NULL,
  updated_by VARCHAR (20) NOT NULL
);
CREATE TABLE courses_data (
  record_id integer(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  course_id CHAR (6) NOT NULL,
  department_id CHAR (6) NOT NULL,
  VERSION integer(10) NOT NULL,
  title VARCHAR (20) NOT NULL,
  description VARCHAR (30) DEFAULT '',
  is_deleted TINYINT (1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (
    course_id,
    VERSION
  )
);
DROP TABLE IF EXISTS worker_data;
DROP TABLE IF EXISTS worker;
CREATE TABLE worker (
  worker_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  current_version integer(10) NOT NULL,
  is_deleted tinyint(1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  last_updated TIMESTAMP NOT NULL,
  updated_by VARCHAR (20) NOT NULL
);
CREATE TABLE worker_data (
  record_id integer(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  worker_id int(11) NOT NULL,
  VERSION integer(10) NOT NULL,
  first_name VARCHAR (20) NOT NULL,
  last_name VARCHAR (20) NOT NULL,
  middle_name VARCHAR (20) DEFAULT '',
  birth_date DATE NOT NULL,
  is_deleted TINYINT (1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  FOREIGN KEY (worker_id) REFERENCES worker(worker_id) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (
    worker_id,
    VERSION
  )
);
DROP TABLE IF EXISTS faculty_data;
DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty (
  instructor_id integer (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  current_version integer(10) NOT NULL,
  is_deleted tinyint(1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  last_updated TIMESTAMP NOT NULL,
  updated_by VARCHAR (20) NOT NULL
);
CREATE TABLE faculty_data (
  record_id integer(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  instructor_id integer (10) NOT NULL,
  department_id CHAR (6) NOT NULL,
  VERSION integer(10) NOT NULL,
  first_name VARCHAR (20) NOT NULL,
  last_name VARCHAR (20) NOT NULL,
  middle_name VARCHAR (20) NOT NULL DEFAULT '',
  POSITION VARCHAR (25),
  address VARCHAR (50),
  is_deleted TINYINT (1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP NOT NULL,
  created_by VARCHAR (20) NOT NULL,
  FOREIGN KEY (instructor_id) REFERENCES faculty(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (
    instructor_id,
    VERSION
  )
);