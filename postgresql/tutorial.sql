
CREATE TABLE IF NOT EXISTS cities (
  abbr char(10) primary key, 
  name varchar(80) NOT NULL,
  location point NOT NULL,
  create_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

TRUNCATE TABLE CITIES
RESTART IDENTITY
CASCADE;

CREATE INDEX IF NOT EXISTS CITY_INDEX
ON CITIES(NAME);

CREATE TABLE IF NOT EXISTS weather (
  id int GENERATED ALWAYS AS IDENTITY,
  city char(10) NOT NULL,
  date date NOT NULL,
  temp_lo int NOT NULL, -- low temperature
  temp_hi int NOT NULL, -- high temperature
  prcp real, -- precipitation
  create_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_dt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(ID),
  CONSTRAINT FK_CITY
  FOREIGN KEY(CITY)
  REFERENCES CITIES(ABBR)
  ON DELETE RESTRICT
);

TRUNCATE TABLE WEATHER
RESTART IDENTITY
CASCADE;

CREATE UNIQUE INDEX IF NOT EXISTS CITY_DATE 
ON WEATHER(CITY,DATE);

CREATE OR REPLACE VIEW CITY_WEATHER 
AS SELECT a.NAME as CITY, DATE, TEMP_LO, TEMP_HI, PRCP 
FROM CITIES as  a, WEATHER as b
WHERE a.ABBR = b.CITY;

INSERT INTO CITIES 
VALUES ('SFO',
  'San Francisco',
  '37.7749,122.4194');
INSERT INTO CITIES 
VALUES ('HAY',
'Hayward',
'37.6688, 122.0810');
INSERT INTO weather (city,date,
  temp_hi,
  temp_lo,
  prcp)
  VALUES ('SFO',
'2020-11-27', 
46, 
50, 
0.25);
INSERT INTO weather (date,
  city, 
  temp_hi, 
  temp_lo)
 VALUES ('1994-11-29', 
  'HAY', 
  54, 
  37);
INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
 VALUES ('SFO', 43, 57, 0.0, '1994-11-29');
SELECT * FROM weather;
SELECT * FROM city_weather
 WHERE city = 'San Francisco' AND prcp > 0.0;
SELECT city, (temp_hi+temp_lo)/2 AS temp_avg, date FROM city_weather;
SELECT * FROM weather
 ORDER BY city;
SELECT * FROM weather
 ORDER BY city, temp_lo;
SELECT DISTINCT city
 FROM weather;
SELECT DISTINCT city
 FROM weather
 ORDER BY city;
SELECT DISTINCT city
 FROM city_weather;
SELECT DISTINCT city
 FROM city_weather
 ORDER BY city;

-- JOINS --

SELECT * FROM WEATHER, CITIES 
WHERE CITY = ABBR;
SELECT city, name,temp_lo, temp_hi, prcp, date, location
 FROM weather, cities
 WHERE city = abbr;
SELECT cities.name, weather.temp_lo, weather.temp_hi,
 weather.prcp, weather.date, cities.location
 FROM weather, cities
 WHERE cities.abbr = weather.city;
SELECT *
 FROM weather INNER JOIN cities ON (weather.city = cities.abbr);
SELECT *
 FROM weather LEFT OUTER JOIN cities ON (weather.city =
 cities.abbr);
 SELECT W1.city, W1.temp_lo AS low, W1.temp_hi AS high,
 W2.city, W2.temp_lo AS low, W2.temp_hi AS high
 FROM weather W1, weather W2
 WHERE W1.temp_lo < W2.temp_lo
 AND W1.temp_hi > W2.temp_hi;
