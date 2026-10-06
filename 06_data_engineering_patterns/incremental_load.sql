INSERT INTO target_transactions (
    transaction_id,
    account_id,
    transaction_date,
    amount
)
SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount
FROM source_transactions
WHERE transaction_date > (
    SELECT COALESCE(MAX(transaction_date), '1900-01-01')
    FROM target_transactions
);