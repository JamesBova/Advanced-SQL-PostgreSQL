SELECT
    transaction_id,
    account_id,
    amount
FROM transactions
WHERE amount > (
    SELECT AVG(amount)
    FROM transactions
);

SELECT
    account_id,
    transaction_id,
    amount
FROM transactions
WHERE account_id IN (
    SELECT account_id
    FROM accounts
    WHERE status = 'Active'
);