SELECT
    t.transaction_id,
    t.account_id,
    t.amount
FROM transactions t
WHERE t.amount > (
    SELECT AVG(t2.amount)
    FROM transactions t2
    WHERE t2.account_id = t.account_id
);


SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM accounts a
    WHERE a.customer_id = c.customer_id
      AND a.status = 'Active'
);