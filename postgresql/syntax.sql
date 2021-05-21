SELECT
  3 operator(pg_catalog.+) 4;
SELECT
  3 operator(pg_catalog.-) 4;
SELECT
  3 operator(pg_catalog.*) 4;
SELECT
  3 operator(pg_catalog./) 4;
SELECT
  3 operator(pg_catalog.%) 4;
SELECT
  3 operator(pg_catalog.^) 4;
SELECT
  ARRAY [1,
       2,
       3 + 4];
SELECT
  ARRAY [1,
       2,
       22.7] :: integer [];
SELECT
  ARRAY [ARRAY[1,
       2],
  ARRAY [3,
       4]];
  SELECT ARRAY[[1,2],
  [3,4]];
  CREATE TABLE IF NOT EXISTS arr(f1 int[],
  f2 int []
);
TRUNCATE TABLE arr;
INSERT INTO
  arr
VALUES
  (
    ARRAY [[1,2],
    [3,4]], ARRAY[[5,6],
    [7,8]]);
  SELECT ARRAY[f1,
       f2,
       '{{9,10},{11,12}}'::int[]]

  FROM arr;
  SELECT ARRAY[] :: integer [];
    SELECT
      array (
        SELECT
          oid
        FROM
          pg_proc
        WHERE
          proname LIKE 'bytea%'
      );
    SELECT
      array (
        SELECT
          ARRAY [i,
               i * 2]
        FROM
          generate_series(1, 5) AS a(i)
      );
    SELECT
      row(1, 2.5, 'this is a test');
    SELECT
      row(arr.*, 42)
    FROM
      arr;
    SELECT
      row(arr.f1, arr.f2, 42)
    FROM
      arr;