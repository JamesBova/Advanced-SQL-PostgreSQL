drop view if exists active_customer_accounts;

CREATE VIEW active_customer_accounts AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_id,
    a.account_type
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.status = 'Active';

SELECT *
FROM active_customer_accounts;