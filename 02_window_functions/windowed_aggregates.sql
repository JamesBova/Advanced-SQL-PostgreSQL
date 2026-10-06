SELECT
    account_id,
    transaction_date,
    amount,

    COUNT(*) OVER (
        PARTITION BY account_id
    ) AS transaction_count,

    AVG(amount) OVER (
        PARTITION BY account_id
    ) AS average_amount,

    MIN(amount) OVER (
        PARTITION BY account_id
    ) AS minimum_amount,

    MAX(amount) OVER (
        PARTITION BY account_id
    ) AS maximum_amount

FROM transactions;