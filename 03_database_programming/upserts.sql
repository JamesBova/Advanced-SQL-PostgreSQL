INSERT INTO customers (
    first_name,
    last_name,
    email
)
VALUES (
    'Alice',
    'Smith',
    'alice.smith@example.com'
)
ON CONFLICT (email)
DO UPDATE
SET
    first_name = EXCLUDED.first_name,
    last_name = EXCLUDED.last_name;