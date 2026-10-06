drop table if exists active_accounts;

CREATE TEMP TABLE active_accounts AS
SELECT
    account_id,
    customer_id,
    account_type
FROM accounts
WHERE status = 'Active';

SELECT *
FROM active_accounts;



drop table if exists recent_transactions;

CREATE TEMP TABLE recent_transactions (
    transaction_id INT,
    account_id INT,
    amount NUMERIC(12, 2)
);

INSERT INTO recent_transactions
SELECT
    transaction_id,
    account_id,
    amount
FROM transactions
WHERE transaction_date >= CURRENT_DATE - INTERVAL '30 days';

select * from recent_transactions;