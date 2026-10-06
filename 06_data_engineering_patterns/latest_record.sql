WITH latest_transactions AS (
    SELECT
        transaction_id,
        account_id,
        transaction_date,
        amount,
        transaction_type,

        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY transaction_date DESC
        ) AS row_num

    FROM transactions
)

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    transaction_type
FROM latest_transactions
WHERE row_num = 1;