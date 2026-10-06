SELECT
    account_id,
    transaction_id,
    amount,
    RANK() OVER (
        PARTITION BY account_id
        ORDER BY amount DESC
    ) AS amount_rank
FROM transactions;