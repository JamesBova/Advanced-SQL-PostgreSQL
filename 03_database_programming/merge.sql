drop table if exists incoming_customers;

CREATE TEMP TABLE incoming_customers (
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO incoming_customers (
    email,
    first_name,
    last_name
)
VALUES
    ('alice.smith@example.com', 'Alice', 'Smith'),
    ('new.customer@example.com', 'New', 'Customer');

MERGE INTO customers AS target
USING incoming_customers AS source
ON target.email = source.email

WHEN MATCHED THEN
    UPDATE SET
        first_name = source.first_name,
        last_name = source.last_name

WHEN NOT MATCHED THEN
    INSERT (
        first_name,
        last_name,
        email
    )
    VALUES (
        source.first_name,
        source.last_name,
        source.email
    );