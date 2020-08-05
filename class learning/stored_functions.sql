-- PostgreSQL Stored Function
-- Like making a function in Python that we can use for ourselves

CREATE FUNCTION add_money(cust_pay NUMERIC) RETURNS NUMERIC AS $$
BEGIN
	RETURN cust_pay + 2.00;
END;
$$ LANGUAGE plpgsql;

SELECT amount
FROM payment
WHERE customer_id = 2;

-- Using a function to add two dollars to every cust_pay
SELECT add_money(amount)
FROM payment
WHERE customer_id = 2;

DROP FUNCTION add_money;
DROP FUNCTION IF EXISTS add_money;