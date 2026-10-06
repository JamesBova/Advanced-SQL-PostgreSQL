SELECT
    CURRENT_DATE,
    CURRENT_TIMESTAMP;

    SELECT
    CURRENT_DATE + INTERVAL '7 days',
    CURRENT_DATE - INTERVAL '30 days';

    SELECT
    transaction_date,
    EXTRACT(YEAR FROM transaction_date) AS year,
    EXTRACT(MONTH FROM transaction_date) AS month,
    EXTRACT(DAY FROM transaction_date) AS day
FROM transactions;

SELECT
    DATE_TRUNC('month', transaction_date) AS transaction_month,
    SUM(amount)
FROM transactions
GROUP BY DATE_TRUNC('month', transaction_date);


SELECT
    transaction_date,
    CURRENT_TIMESTAMP - transaction_date AS age
FROM transactions;

SELECT *
FROM transactions
WHERE transaction_date >= CURRENT_DATE - INTERVAL '30 days';