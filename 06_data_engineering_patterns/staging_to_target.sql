CREATE TEMP TABLE staging_customers (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    status VARCHAR(20)
);

WITH cleaned AS (
    SELECT
        TRIM(first_name) AS first_name,
        TRIM(last_name) AS last_name,
        LOWER(TRIM(email)) AS email,
        ROW_NUMBER() OVER (
            PARTITION BY LOWER(TRIM(email))
            ORDER BY first_name
        ) AS row_num
    FROM staging_customers
    WHERE email IS NOT NULL
)

INSERT INTO customers (
    first_name,
    last_name,
    email
)
SELECT
    first_name,
    last_name,
    email
FROM cleaned
WHERE row_num = 1
ON CONFLICT (email)
DO UPDATE
SET
    first_name = EXCLUDED.first_name,
    last_name = EXCLUDED.last_name;