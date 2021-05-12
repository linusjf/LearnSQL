USE test;
--
-- Table structure for table `us_states`
--
SET
  foreign_key_checks = 0;
DROP TABLE IF EXISTS us_states;
CREATE TABLE us_states (
    state_code char(2) NOT NULL,
    state_name varchar(50) NOT NULL,
    PRIMARY KEY (state_code)
  );
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('AL', 'Alabama');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('AK', 'Alaska');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('AZ', 'Arizona');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('AR', 'Arkansas');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('CA', 'California');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('CO', 'Colorado');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('CT', 'Connecticut');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('DE', 'Delaware');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('DC', 'District of Columbia');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('FL', 'Florida');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('GA', 'Georgia');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('HI', 'Hawaii');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('ID', 'Idaho');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('IL', 'Illinois');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('IN', 'Indiana');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('IA', 'Iowa');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('KS', 'Kansas');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('KY', 'Kentucky');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('LA', 'Louisiana');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('ME', 'Maine');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('MD', 'Maryland');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('MA', 'Massachusetts');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('MI', 'Michigan');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('MN', 'Minnesota');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('MS', 'Mississippi');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('MO', 'Missouri');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('MT', 'Montana');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('NE', 'Nebraska');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('NV', 'Nevada');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('NH', 'New Hampshire');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('NJ', 'New Jersey');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('NM', 'New Mexico');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('NY', 'New York');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('NC', 'North Carolina');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('ND', 'North Dakota');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('OH', 'Ohio');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('OK', 'Oklahoma');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('OR', 'Oregon');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('PA', 'Pennsylvania');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('PR', 'Puerto Rico');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('RI', 'Rhode Island');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('SC', 'South Carolina');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('SD', 'South Dakota');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('TN', 'Tennessee');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('TX', 'Texas');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('UT', 'Utah');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('VT', 'Vermont');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('VA', 'Virginia');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('WA', 'Washington');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('WV', 'West Virginia');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('WI', 'Wisconsin');
INSERT INTO
  us_states (state_code, state_name)
VALUES
  ('WY', 'Wyoming');
--
  -- Table structure for table `us_cities`
  --
  DROP TABLE IF EXISTS us_cities;
CREATE TABLE us_cities (
    city_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_code char(2) NOT NULL,
    city varchar(50) NOT NULL,
    county varchar(50) NOT NULL,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    FOREIGN KEY (state_code) REFERENCES us_states(state_code) ON DELETE RESTRICT ON UPDATE CASCADE
  );
SET
  foreign_key_checks = 1;
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  (
    'NY',
    'New York',
    'New York',
    40.74838,
    -73.996705
  );
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  (
    'CA',
    'Los Angeles',
    'Los Angeles',
    33.973093,
    -118.247896
  );
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  ('IL', 'Chicago', 'Cook', 41.885847, -87.618123);
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  ('TX', 'Houston', 'Harris', 29.7652, -95.3657);
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  ('AZ', 'Phoenix', 'Maricopa', 33.451, -112.0685);
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  (
    'PA',
    'Philadelphia',
    'Philadelphia',
    40.1162,
    -75.0141
  );
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  (
    'TX',
    'San Antonio',
    'Bexar',
    29.468525,
    -98.526352
  );
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  (
    'CA',
    'San Diego',
    'San Diego',
    32.71852,
    -117.159316
  );
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  ('TX', 'Dallas', 'Dallas', 32.790439, -96.80439);
INSERT INTO
  us_cities (
    state_code,
    city,
    county,
    latitude,
    longitude
  )
VALUES
  (
    'CA',
    'San Jose',
    'Santa Clara',
    37.3894,
    -121.8868
  );