BEGIN;

UPDATE accounts
SET status = 'Closed'
WHERE account_id = 3;

INSERT INTO transactions (
    account_id,
    transaction_date,
    amount,
    transaction_type,
    description
)
VALUES (
    3,
    CURRENT_TIMESTAMP,
    -25.00,
    'Fee',
    'Account closure fee'
);

COMMIT;



BEGIN;

UPDATE accounts
SET status = 'Closed'
WHERE account_id = 3;

ROLLBACK;