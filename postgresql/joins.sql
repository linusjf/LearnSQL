CREATE TABLE IF NOT EXISTS customers (
  customerid serial PRIMARY KEY,
  customername varchar(100) NOT NULL,
  contactname varchar(100) NOT NULL,
  address varchar(100) NOT NULL,
  city varchar(30) NOT NULL,
  postalcode char(10) NOT NULL,
  country varchar(50) NOT NULL,
  createdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE customers RESTART IDENTITY CASCADE;
CREATE TABLE IF NOT EXISTS orders (
  orderid BIGSERIAL PRIMARY KEY,
  customerid integer NOT NULL,
  employeeid integer NOT NULL,
  orderdate date NOT NULL,
  shipperid integer NOT NULL,
  createdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE orders RESTART IDENTITY CASCADE;
CREATE TABLE IF NOT EXISTS suppliers (
  supplierid serial PRIMARY KEY,
  suppliername varchar(100) NOT NULL,
  contactname varchar(100) NOT NULL,
  address varchar(100) NOT NULL,
  city varchar(30) NOT NULL,
  postalcode char(10) NOT NULL,
  country varchar(50) NOT NULL,
  createdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE suppliers RESTART IDENTITY CASCADE;
CREATE TABLE IF NOT EXISTS shippers (
  shipperid serial PRIMARY KEY,
  shippername varchar(100) NOT NULL,
  phone char(15) NOT NULL,
  createdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE shippers RESTART IDENTITY CASCADE;
CREATE TABLE IF NOT EXISTS employees (
  employeeid serial PRIMARY KEY,
  lastname varchar(40) NOT NULL,
  firstname varchar(40) NOT NULL,
  birthdate date NOT NULL,
  photo BYTEA,
  createdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE employees RESTART IDENTITY CASCADE;
INSERT INTO
  customers (
    customername,
    contactname,
    address,
    city,
    postalcode,
    country
  )
VALUES
  (
    'Alfreds Futterkiste',
    'Maria Anders',
    'Obere Str. 57',
    'Berlin',
    '12209',
    'Germany'
  ),
  (
    'Ana Trujillo Emparedados y helados',
    'Ana Trujillo',
    'Avda. de la Constitución 2222',
    'México D.F.',
    '05021',
    'Mexico'
  ),
  (
    'Antonio Moreno Taquería',
    'Antonio Moreno',
    'Mataderos 2312',
    'México D.F.',
    '05023',
    'Mexico'
  );
INSERT INTO
  orders (
    customerid,
    employeeid,
    orderdate,
    shipperid
  )
VALUES
  (2, 7, '1996-09-08', 3),
  (37, 3, '1996-09-09', 1),
  (77, 8, '1996-09-10', 2);
INSERT INTO
  suppliers (
    suppliername,
    contactname,
    address,
    city,
    postalcode,
    country
  )
VALUES
  (
    'Exotic Liquid',
    'Charlotte Cooper',
    '49, Gilbert Street',
    'London',
    'EC1 4SD',
    'UK'
  ),
  (
    'New Orleans Cajun Delight',
    'Shelley Burke',
    'P.O. Box 78934',
    'New Orleans',
    '70117',
    'USA'
  ),
  (
    'Grandma Kelly''s Homestead',
    'Regina Murphy',
    '707 Oxford Road',
    'Ann Arbor',
    '05023',
    'USA'
  );
INSERT INTO
  shippers (shippername, phone)
VALUES
  ('Speedy Express', '(503) 555-9831'),
  ('United Package', '(503) 555-3199'),
  ('Federal Shipping', '(503) 555-9931');
INSERT INTO
  employees (lastname, firstname, birthdate)
VALUES('Davolio', 'Nancy', '1968-08-12'),
  ('Fuller', 'Andrew', '1952-02-19'),
  ('Leverling', 'Janet', '1963-08-30');
SELECT
  *
FROM
  customers;
SELECT
  *
FROM
  orders;
SELECT
  customers.customername,
  orders.orderid
FROM
  customers FULL
  OUTER JOIN orders ON customers.customerid = orders.customerid
ORDER BY
  customers.customername;
SELECT
  a.customername AS customername1,
  b.customername AS customername2,
  a.city
FROM
  customers a,
  customers b
WHERE
  a.customerid <> b.customerid
  AND a.city = b.city
ORDER BY
  a.city;
SELECT
  city
FROM
  customers
UNION
SELECT
  city
FROM
  suppliers
ORDER BY
  city;
SELECT
  city
FROM
  customers
UNION ALL
SELECT
  city
FROM
  suppliers
ORDER BY
  city;
SELECT
  city,
  country
FROM
  customers
WHERE
  country = 'Germany'
UNION
SELECT
  city,
  country
FROM
  suppliers
WHERE
  country = 'Germany'
ORDER BY
  city;
SELECT
  city,
  country
FROM
  customers
WHERE
  country = 'Germany'
UNION ALL
SELECT
  city,
  country
FROM
  suppliers
WHERE
  country = 'Germany'
ORDER BY
  city;
SELECT
  'Customer' AS TYPE,
  contactname,
  city,
  country
FROM
  customers
UNION
SELECT
  'Supplier',
  contactname,
  city,
  country
FROM
  suppliers;
SELECT
  orders.orderid,
  customers.customername,
  orders.orderdate
FROM
  orders
  INNER JOIN customers ON orders.customerid = customers.customerid;
SELECT
  orders.orderid,
  customers.customername,
  shippers.shippername
FROM
  (
    (
      orders
      INNER JOIN customers ON orders.customerid = customers.customerid
    )
    INNER JOIN shippers ON orders.shipperid = shippers.shipperid
  );
SELECT
  customers.customername,
  orders.orderid
FROM
  customers
  LEFT JOIN orders ON customers.customerid = orders.customerid
ORDER BY
  customers.customername;
SELECT
  orders.orderid,
  employees.lastname,
  employees.firstname
FROM
  orders
  RIGHT JOIN employees ON orders.employeeid = employees.employeeid
ORDER BY
  orders.orderid;