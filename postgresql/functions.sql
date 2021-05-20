CREATE OR REPLACE FUNCTION customers_from_city(text) 
returns setof customers 
AS $$ SELECT * FROM customers WHERE city = $1 $$
LANGUAGE SQL;
