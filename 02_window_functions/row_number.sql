SELECT
    account_id,
    transaction_id,
    transaction_date,
    amount,
    ROW_NUMBER() OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS row_num
FROM transactions;