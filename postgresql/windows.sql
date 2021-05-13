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
INSERT INTO
  empsalary (depname, empno, salary, rank)
VALUES
  ('develop', 8, 6000, 1),
  ('develop', 10, 5200, 2),
  ('develop', 11, 5200, 2),
  ('develop', 9, 4500, 4),
  ('develop', 7, 4200, 5),
  ('personnel', 2, 3900, 1),
  ('personnel', 5, 3500, 2),
  ('sales', 1, 5000, 1),
  ('sales', 4, 4800, 2),
  ('sales', 3, 4800, 2);
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