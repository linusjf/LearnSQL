CREATE
OR REPLACE FUNCTION customers_from_city(text) RETURNS SETOF customers AS $ $
SELECT
  *
FROM
  customers
WHERE
  city = $ 1 $ $ LANGUAGE SQL;
SELECT
  customername
FROM
  customers_from_city('Berlin');
SELECT
  customername
FROM
  customers_from_city('México D.F.');
SELECT
  sqrt(2);
SELECT
  count(*) AS unfiltered,
  count(*) filter (
    WHERE
      i < 5
  ) AS filtered
FROM
  generate_series(1, 10) AS s(i);