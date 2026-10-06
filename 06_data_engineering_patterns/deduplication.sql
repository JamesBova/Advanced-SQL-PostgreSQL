WITH ranked_customers AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        created_at,

        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY created_at DESC
        ) AS row_num

    FROM customers
)

SELECT *
FROM ranked_customers
WHERE row_num = 1;