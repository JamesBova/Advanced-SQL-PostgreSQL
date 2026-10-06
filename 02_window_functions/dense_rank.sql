--like rank but doesn't leave a gap if there are ties like rank would
--Rank: 1 2 2 4
--dense rank: 1 2 2 3

SELECT
    account_id,
    transaction_id,
    amount,
    DENSE_RANK() OVER (
        PARTITION BY account_id
        ORDER BY amount DESC
    ) AS amount_rank
FROM transactions;