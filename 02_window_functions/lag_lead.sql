SELECT
    account_id,
    transaction_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS previous_amount,
    LEAD(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS next_amount
FROM transactions;



SELECT
    account_id,
    transaction_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS previous_amount,
    amount - LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS amount_change
FROM transactions;