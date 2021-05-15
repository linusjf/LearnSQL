CREATE TABLE IF NOT EXISTS empsalary (
  depname varchar(10) NOT NULL,
  empno int NOT NULL,
  salary decimal(
    6,
    2
  ) NOT NULL,
  rank numeric(1) NOT NULL,
  createdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE empsalary CASCADE;
ALTER TABLE
  empsalary
ADD
  enroll_date DATE NOT NULL;
INSERT INTO
  empsalary (
    depname,
    empno,
    salary,
    rank,
    enroll_date
  )
VALUES
  ('develop', 8, 6000, 1, '1999-01-21'),
  ('develop', 10, 5200, 2, '2001-03-26'),
  ('develop', 11, 5200, 2, '2000-12-01'),
  ('develop', 9, 4500, 4, '2003-06-01'),
  ('develop', 7, 4200, 5, '2005-01-23'),
  ('personnel', 2, 3900, 1, '2007-12-23'),
  ('personnel', 5, 3500, 2, '2005-11-23'),
  ('sales', 1, 5000, 1, '2000-12-12'),
  ('sales', 4, 4800, 2, '2004-11-04'),
  ('sales', 3, 4800, 2, '2005-05-12');
SELECT
  depname,
  empno,
  salary,
  avg(salary) OVER (PARTITION BY depname)
FROM
  empsalary;
SELECT
  depname,
  empno,
  salary,
  rank() OVER (
    PARTITION BY depname
    ORDER BY
      salary DESC
  )
FROM
  empsalary;
SELECT
  salary,
  sum(salary) OVER ()
FROM
  empsalary;
SELECT
  salary,
  sum(salary) OVER (
    ORDER BY
      salary
  )
FROM
  empsalary;
SELECT
  depname,
  empno,
  salary,
  enroll_date
FROM
  (
    SELECT
      depname,
      empno,
      salary,
      enroll_date,
      rank() OVER (
        PARTITION BY depname
        ORDER BY
          salary DESC,
          empno
      ) AS pos
    FROM
      empsalary
  ) AS ss
WHERE
  pos < 3;
