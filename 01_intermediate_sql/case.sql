SELECT
    transaction_id,
    amount,
    CASE
        WHEN amount > 1000 THEN 'Large'
        WHEN amount > 100 THEN 'Medium'
        ELSE 'Small'
    END AS transaction_size
FROM transactions;


SELECT
    account_id,
    status,
    CASE
        WHEN status = 'Active' THEN 1
        ELSE 0
    END AS is_active
FROM accounts;


SELECT
    account_id,
    SUM(
        CASE
            WHEN amount > 0 THEN amount
            ELSE 0
        END
    ) AS total_deposits
FROM transactions
GROUP BY account_id;