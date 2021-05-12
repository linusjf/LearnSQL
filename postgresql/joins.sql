create table if not exists CUSTOMERS (
  CUSTOMERID serial primary key,
  CUSTOMERNAME VARCHAR(100) not null,
  CONTACTNAME VARCHAR(100) not null,
  ADDRESS VARCHAR(100) not null,
  CITY VARCHAR(30) not null,
  POSTALCODE CHAR(10) not null,
  COUNTRY VARCHAR(50) not null,
  CREATEDT timestamp not null default current_timestamp,
  UPDATEDT timestamp not null default current_timestamp
);
truncate table CUSTOMERS restart identity cascade;
create table if not exists ORDERS (
  ORDERID bigserial primary key,
  CUSTOMERID integer not null,
  EMPLOYEEID integer not null,
  ORDERDATE date not null,
  SHIPPERID integer not null,
  CREATEDT timestamp not null default current_timestamp,
  UPDATEDT timestamp not null default current_timestamp
);
truncate table ORDERS restart identity cascade;
create table if not exists SUPPLIERS (
  SUPPLIERID serial primary key,
  SUPPLIERNAME VARCHAR(100) not null,
  CONTACTNAME VARCHAR(100) not null,
  ADDRESS VARCHAR(100) not null,
  CITY VARCHAR(30) not null,
  POSTALCODE CHAR(10) not null,
  COUNTRY VARCHAR(50) not null,
  CREATEDT timestamp not null default current_timestamp,
  UPDATEDT timestamp not null default current_timestamp
);
truncate table SUPPLIERS restart identity cascade;
insert into
  CUSTOMERS (
    CUSTOMERNAME,
    CONTACTNAME,
    ADDRESS,
    CITY,
    POSTALCODE,
    COUNTRY
  )
values
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
insert into
  ORDERS (
    CUSTOMERID,
    EMPLOYEEID,
    ORDERDATE,
    SHIPPERID
  )
values
  (2, 7, '1996-09-08', 3),
  (37, 3, '1996-09-09', 1),
  (77, 8, '1996-09-10', 2);
insert into
  SUPPLIERS (
    SUPPLIERNAME,
    CONTACTNAME,
    ADDRESS,
    CITY,
    POSTALCODE,
    COUNTRY
  )
values
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
select
  *
from
  CUSTOMERS;
select
  *
from
  ORDERS;
select
  CUSTOMERS.CUSTOMERNAME,
  ORDERS.ORDERID
from
  CUSTOMERS full
  outer join ORDERS on CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID
order by
  CUSTOMERS.CUSTOMERNAME;
select
  A.CUSTOMERNAME as CUSTOMERNAME1,
  B.CUSTOMERNAME as CUSTOMERNAME2,
  A.CITY
from
  CUSTOMERS A,
  CUSTOMERS B
where
  A.CUSTOMERID <> B.CUSTOMERID
  and A.CITY = B.CITY
order by
  A.CITY;
select
  CITY
from
  CUSTOMERS
union
select
  CITY
from
  SUPPLIERS
order by
  CITY;
select
  CITY
from
  CUSTOMERS
union all
select
  CITY
from
  SUPPLIERS
order by
  CITY;
select
  CITY,
  COUNTRY
from
  CUSTOMERS
where
  COUNTRY = 'Germany'
union
select
  CITY,
  COUNTRY
from
  SUPPLIERS
where
  COUNTRY = 'Germany'
order by
  CITY;
select
  CITY,
  COUNTRY
from
  CUSTOMERS
where
  COUNTRY = 'Germany'
union all
select
  CITY,
  COUNTRY
from
  SUPPLIERS
where
  COUNTRY = 'Germany'
order by
  CITY;
select
  'Customer' as type,
  CONTACTNAME,
  CITY,
  COUNTRY
from
  CUSTOMERS
union
select
  'Supplier',
  CONTACTNAME,
  CITY,
  COUNTRY
from
  SUPPLIERS;
select
  ORDERS.ORDERID,
  CUSTOMERS.CUSTOMERNAME,
  ORDERS.ORDERDATE
from
  ORDERS
  inner join CUSTOMERS on ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID;