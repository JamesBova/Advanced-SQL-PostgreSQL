SELECT
    first_name,
    last_name,
    first_name || ' ' || last_name AS full_name
FROM customers;

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;

SELECT
    UPPER(first_name),
    LOWER(last_name),
    LENGTH(email),
    TRIM(email)
FROM customers;

SELECT
    email,
    SUBSTRING(email FROM 1 FOR 5)
FROM customers;

SELECT
    email,
    REPLACE(email, '@example.com', '@test.com')
FROM customers;

SELECT *
FROM customers
WHERE email LIKE '%@example.com';

--case insensitive
SELECT *
FROM customers
WHERE email ILIKE '%@example.com';