-- Missing required values
SELECT *
FROM customers
WHERE first_name IS NULL
   OR last_name IS NULL
   OR email IS NULL;

   -- Invalid account statuses
SELECT *
FROM accounts
WHERE status NOT IN ('Active', 'Closed', 'Suspended');

-- Transactions pointing to missing accounts
SELECT
    t.transaction_id,
    t.account_id
FROM transactions t
LEFT JOIN accounts a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;

--checking for duplicates
SELECT
    email,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;