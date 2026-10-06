WITH account_totals AS (
    SELECT
        account_id,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY account_id
)

SELECT
    account_id,
    total_amount
FROM account_totals
WHERE total_amount > 500;


WITH active_accounts AS (
    SELECT
        account_id,
        customer_id
    FROM accounts
    WHERE status = 'Active'
),

account_totals AS (
    SELECT
        account_id,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY account_id
)

SELECT
    a.account_id,
    a.customer_id,
    t.total_amount
FROM active_accounts a
JOIN account_totals t
    ON a.account_id = t.account_id;