-- Customer Table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
);

-- Order Table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Adding Presidents to our Customers
INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES (1, 'George','Washington','gwash@usa.gov','3200 Mt Vernon Hwy','Mt Vernon', 'VA','22121');

INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES (2, 'John','Adams','jadams@usa.gov','1200 Hancock St','Quincy', 'MA','02168');

INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES (3, 'Thomas','Jefferson','tjeff@usa.gov','931 Thomas Jefferson Pkwy','Charlottesville', 'VA','02169');

INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES (4, 'James','Madison','jmad@usa.gov','11350 Conway','Orange', 'VA','02169');

INSERT INTO customer(customer_id, first_name, last_name, email, address, city, customer_state, zipcode)
VALUES (5, 'James','Monroe','jmonroe@usa.gov','2050 James Madison Parkway','Charlottesville', 'VA','02169');

-- INSERT info INTO order_ table
INSERT INTO order_(order_id,amount, customer_id) -- didn't specify date because we defaulted to current date
VALUES (1, 234.56, 1);

INSERT INTO order_(order_id,amount, customer_id) -- didn't specify date because we defaulted to current date
VALUES (2, 78.50, 3);

INSERT INTO order_(order_id,amount, customer_id) -- didn't specify date because we defaulted to current date
VALUES (3, 124.00, 2);

INSERT INTO order_(order_id,amount, customer_id) -- didn't specify date because we defaulted to current date
VALUES (4, 65.50, 3);

INSERT INTO order_(order_id,amount, customer_id) -- didn't specify date because we defaulted to current date
VALUES (5, 55.50, NULL);

SELECT *
FROM order_;

-- Orders from subquery (built by me!!)
SELECT *
FROM order_
WHERE customer_id IN (
	SELECT customer_id
	FROM customer
	WHERE first_name LIKE 'J%'
);

-- ALL 4 Joins for SQL
-- INNER JOIN -- Same as just 'JOIN'
-- This will only show the ones with matching records for everything (so no JMad or JMon because they aren't customers w/ orders)
SELECT first_name, last_name, order_date, amount, order_.customer_id -- can pull any of the fields from either table
FROM customer -- TABLE A
INNER JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id; -- this is the place where the tables will be 'joined'

-- LEFT JOIN --
SELECT first_name, last_name, order_date, amount
FROM customer -- TABLE A
LEFT JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id; -- We get 2 TJs because he ordered twice, and JMad and JMon even though they didn't buy anything because it 
-- shows everything from the 'left' table, which is customers

-- RIGHT JOIN --
SELECT first_name, last_name, order_date, amount
FROM customer -- TABLE A
RIGHT JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id; -- We get all of our orders, including the ones that don't match, because we're showing everything from the
-- 'right' table, which is order_

-- FULL JOIN -- same as FULL OUTER JOIN
SELECT first_name, last_name, order_date, amount
FROM customer -- TABLE A
FULL OUTER JOIN order_ -- TABLE B
ON customer.customer_id = order_.customer_id; -- This returns all matching data; it will give us full data from both tables

-- FULL JOIN WHERE INFO
SELECT first_name, last_name, order_date, amount
FROM order_ -- TABLE A
FULL JOIN customer -- TABLE B
ON customer.customer_id = order_.customer_id
WHERE order_date is NULL; -- this line would return nothing on our RIGHT JOIN above, because we're not returning orders that don't exist (that's the only 
--way you can get a null date)