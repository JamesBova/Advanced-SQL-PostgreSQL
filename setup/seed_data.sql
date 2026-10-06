INSERT INTO customers (
    first_name,
    last_name,
    email
)
VALUES
    ('Alice', 'Smith', 'alice.smith@example.com'),
    ('Bob', 'Jones', 'bob.jones@example.com'),
    ('Carol', 'Miller', 'carol.miller@example.com'),
    ('David', 'Brown', 'david.brown@example.com'),
    ('Emily', 'Davis', 'emily.davis@example.com'),
    ('Frank', 'Wilson', 'frank.wilson@example.com');


INSERT INTO accounts (
    customer_id,
    account_type,
    opened_date,
    status
)
VALUES
    (1, 'Checking', '2024-01-10', 'Active'),
    (1, 'Savings',  '2024-03-15', 'Active'),
    (2, 'Checking', '2024-02-20', 'Active'),
    (3, 'Savings',  '2024-04-05', 'Closed'),
    (4, 'Checking', '2024-05-12', 'Active'),
    (5, 'Checking', '2024-06-01', 'Active'),
    (5, 'Savings',  '2024-06-15', 'Active'),
    (6, 'Checking', '2024-07-10', 'Active');


INSERT INTO transactions (
    account_id,
    transaction_date,
    amount,
    transaction_type,
    description
)
VALUES
    (1, '2026-09-01 08:30:00', 2500.00, 'Deposit',  'Payroll'),
    (1, '2026-09-02 12:15:00', -85.42,   'Purchase', 'Groceries'),
    (1, '2026-09-04 18:20:00', -42.10,   'Purchase', 'Gas'),
    (1, '2026-09-07 09:00:00', -120.00,  'Purchase', 'Utilities'),

    (2, '2026-09-01 10:00:00', 500.00,   'Deposit',  'Transfer'),
    (2, '2026-09-10 14:30:00', 250.00,   'Deposit',  'Transfer'),

    (3, '2026-09-03 08:00:00', 1800.00,  'Deposit',  'Payroll'),
    (3, '2026-09-03 16:45:00', -60.00,   'Purchase', 'Restaurant'),
    (3, '2026-09-05 11:20:00', -150.00,  'Purchase', 'Shopping'),
    (3, '2026-09-08 07:50:00', -55.75,   'Purchase', 'Gas'),

    (4, '2026-08-15 09:00:00', 1000.00,  'Deposit',  'Transfer'),
    (4, '2026-08-20 13:30:00', -200.00,  'Withdrawal', 'ATM'),

    (5, '2026-09-02 07:45:00', 3200.00,  'Deposit',  'Payroll'),
    (5, '2026-09-02 17:10:00', -95.25,   'Purchase', 'Groceries'),
    (5, '2026-09-06 19:30:00', -140.00,  'Purchase', 'Dining'),
    (5, '2026-09-09 12:00:00', -75.00,   'Purchase', 'Utilities'),

    (6, '2026-09-01 11:00:00', 700.00,   'Deposit',  'Transfer'),
    (6, '2026-09-05 15:20:00', -125.00,  'Purchase', 'Shopping'),

    (7, '2026-09-03 10:15:00', 900.00,   'Deposit',  'Transfer'),
    (7, '2026-09-08 13:40:00', 300.00,   'Deposit',  'Transfer'),

    (8, '2026-09-01 08:10:00', 2100.00,  'Deposit',  'Payroll'),
    (8, '2026-09-04 18:00:00', -70.00,   'Purchase', 'Gas'),
    (8, '2026-09-11 20:00:00', -180.00,  'Purchase', 'Dining');


INSERT INTO merchants (
    merchant_name,
    merchant_category
)
VALUES
    ('Fresh Market', 'Groceries'),
    ('QuickFuel', 'Gas'),
    ('City Electric', 'Utilities'),
    ('Downtown Grill', 'Dining'),
    ('Retail World', 'Shopping'),
    ('Main Street ATM', 'ATM');


INSERT INTO transaction_merchants (
    transaction_id,
    merchant_id
)
VALUES
    (2, 1),
    (3, 2),
    (4, 3),
    (8, 4),
    (9, 5),
    (10, 2),
    (12, 6),
    (14, 1),
    (15, 4),
    (16, 3),
    (18, 5),
    (22, 2),
    (23, 4);


SELECT * FROM customers;
SELECT * FROM accounts;
SELECT * FROM transactions;
SELECT * FROM merchants;
SELECT * FROM transaction_merchants;