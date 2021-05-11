CREATE TABLE IF NOT EXISTS CUSTOMERS (
CustomerID serial primary key,
CustomerName varchar(100) not NULL,
ContactName varchar(100) NOT NULL,
Address varchar(100) not NULL,
City varchar(30) NOT NULL,
PostalCode char(5) NOT NULL,
Country varchar(50) NOT NULL,
createDt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
updateDt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE CUSTOMERS
RESTART IDENTITY
CASCADE;
CREATE TABLE IF NOT EXISTS ORDERS (
OrderID bigserial primary key,
CustomerID integer NOT NULL,
EmployeeID integer NOT NULL,
OrderDate date NOT NULL,
ShipperID integer NOT NULL,
createDt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
updateDt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);
TRUNCATE TABLE ORDERS
RESTART IDENTITY
CASCADE;
INSERT INTO CUSTOMERS (CustomerName,ContactName,Address, City,PostalCode,
Country)
VALUES ('Alfreds Futterkiste',
'Maria Anders',
'Obere Str. 57',
'Berlin',
'12209',
'Germany'
),('Ana Trujillo Emparedados y helados',
'Ana Trujillo',
'Avda. de la Constitución 2222',
'México D.F.',
'05021',
'Mexico'
),('Antonio Moreno Taquería',
'Antonio Moreno',
'Mataderos 2312',
'México D.F.',
'05023',
'Mexico'
);
INSERT INTO ORDERS (
  CustomerID,
  EmployeeID,
  OrderDate,
  ShipperID)
VALUES (
2,7,'1996-09-08',3
),
 (
37,3,'1996-09-09',1
),
 (
77,8,'1996-09-10',2
);
select * from customers;
select * from orders;
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;
