CREATE TABLE IF NOT EXISTS cities (
  abbr char(10) PRIMARY KEY,
  name varchar(80) NOT NULL,
  LOCATION POINT NOT NULL,
  create_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE cities RESTART IDENTITY CASCADE;
CREATE INDEX IF NOT EXISTS city_index ON cities(name);
CREATE TABLE IF NOT EXISTS weather (
  id int GENERATED always AS IDENTITY,
  city char(10) NOT NULL,
  date date NOT NULL,
  temp_lo int NOT NULL,
  -- low temperature
  temp_hi int NOT NULL,
  -- high temperature
  prcp real,
  -- precipitation
  create_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY key(id),
  CONSTRAINT fk_city FOREIGN key(city) REFERENCES cities(abbr) ON DELETE RESTRICT
);
TRUNCATE TABLE weather RESTART IDENTITY CASCADE;
CREATE UNIQUE INDEX IF NOT EXISTS city_date ON weather(city, DATE);
CREATE
OR REPLACE VIEW city_weather AS
SELECT
  a.name AS city,
  DATE,
  temp_lo,
  temp_hi,
  prcp
FROM
  cities AS a,
  weather AS b
WHERE
  a.abbr = b.city;
INSERT INTO
  cities
VALUES
  ('SFO', 'San Francisco', '37.7749,122.4194');
INSERT INTO
  cities
VALUES
  ('HAY', 'Hayward', '37.6688, 122.0810');
INSERT INTO
  weather (city, date, temp_hi, temp_lo, prcp)
VALUES
  ('SFO', '2020-11-27', 46, 50, 0.25);
INSERT INTO
  weather (date, city, temp_hi, temp_lo)
VALUES
  ('1994-11-29', 'HAY', 54, 37);
INSERT INTO
  weather (city, temp_lo, temp_hi, prcp, date)
VALUES
  ('SFO', 43, 57, 0.0, '1994-11-29');
SELECT
  *
FROM
  weather;
SELECT
  *
FROM
  city_weather
WHERE
  city = 'San Francisco'
  AND prcp > 0.0;
SELECT
  city,
  (temp_hi + temp_lo) / 2 AS temp_avg,
  date
FROM
  city_weather;
SELECT
  *
FROM
  weather
ORDER BY
  city;
SELECT
  *
FROM
  weather
ORDER BY
  city,
  temp_lo;
SELECT
  DISTINCT city
FROM
  weather;
SELECT
  DISTINCT city
FROM
  weather
ORDER BY
  city;
SELECT
  DISTINCT city
FROM
  city_weather;
SELECT
  DISTINCT city
FROM
  city_weather
ORDER BY
  city;
-- JOINS --
SELECT
  *
FROM
  weather,
  cities
WHERE
  city = abbr;
SELECT
  city,
  name,
  temp_lo,
  temp_hi,
  prcp,
  date,
  LOCATION
FROM
  weather,
  cities
WHERE
  city = abbr;
SELECT
  cities.name,
  weather.temp_lo,
  weather.temp_hi,
  weather.prcp,
  weather.date,
  cities.location
FROM
  weather,
  cities
WHERE
  cities.abbr = weather.city;
SELECT
  *
FROM
  weather
  INNER JOIN cities ON (weather.city = cities.abbr);
SELECT
  *
FROM
  weather
  LEFT OUTER JOIN cities ON (weather.city = cities.abbr);
SELECT
  w1.city,
  w1.temp_lo AS low,
  w1.temp_hi AS high,
  w2.city,
  w2.temp_lo AS low,
  w2.temp_hi AS high
FROM
  weather w1,
  weather w2
WHERE
  w1.temp_lo < w2.temp_lo
  AND w1.temp_hi > w2.temp_hi;
SELECT
  *
FROM
  weather w,
  cities c
WHERE
  w.city = c.abbr;
SELECT
  max(temp_lo)
FROM
  weather;
SELECT
  min(temp_hi)
FROM
  weather;
SELECT
  city
FROM
  city_weather
WHERE
  temp_lo = (
    SELECT
      max(temp_lo)
    FROM
      city_weather
  );
SELECT
  city,
  max(temp_lo)
FROM
  city_weather
GROUP BY
  city;
SELECT
  city,
  max(temp_lo)
FROM
  city_weather
GROUP BY
  city
HAVING
  max(temp_lo) < 40;
SELECT
  city,
  max(temp_lo)
FROM
  city_weather
WHERE
  city LIKE 'S%' -- 1
GROUP BY
  city
HAVING
  max(temp_lo) < 40;
SELECT
  *
FROM
  city_weather;
UPDATE
  weather
SET
  temp_hi = temp_hi - 2,
  temp_lo = temp_lo - 2
WHERE
  date > '1994-11-28';
SELECT
  *
FROM
  city_weather;
DELETE FROM
  weather
WHERE
  city = 'HAY';
SELECT
  *
FROM
  city_weather;