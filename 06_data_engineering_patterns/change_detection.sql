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




WITH status_changes AS (
    SELECT
        customer_id,
        effective_date,
        status,

        LAG(status) OVER (
            PARTITION BY customer_id
            ORDER BY effective_date
        ) AS previous_status

    FROM customer_status_history
)

SELECT *
FROM status_changes
WHERE status IS DISTINCT FROM previous_status;  --null save version of !=