SELECT
    account_id,
    transaction_id,
    amount,
    RANK() OVER (
        PARTITION BY account_id
        ORDER BY amount DESC
    ) AS amount_rank
FROM transactions;


WITH ranked_transactions AS (
    SELECT
        account_id,
        transaction_id,
        amount,
        ROW_NUMBER() OVER (  --using row_number of rank because row_number will only have 1 number 1 where rank can possible have multiple 1 if an account has multiple transaction with same max amount
            PARTITION BY account_id
            ORDER BY amount DESC
        ) AS row_num

    FROM transactions
)

SELECT *
FROM ranked_transactions
WHERE row_num = 1;