CREATE OR REPLACE PROCEDURE close_account(
    p_account_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    current_status VARCHAR(20);
BEGIN

    SELECT status
    INTO current_status
    FROM accounts
    WHERE account_id = p_account_id;

    IF current_status = 'Active' THEN

        UPDATE accounts
        SET status = 'Closed'
        WHERE account_id = p_account_id;

        INSERT INTO transactions (
            account_id,
            transaction_date,
            amount,
            transaction_type,
            description
        )
        VALUES (
            p_account_id,
            CURRENT_TIMESTAMP,
            -25.00,
            'Fee',
            'Account closure fee'
        );

    END IF;

END;
$$;

CALL close_account(3);




CREATE OR REPLACE PROCEDURE activate_account(
    p_account_id INT
)
LANGUAGE SQL
AS $$
    UPDATE accounts
    SET status = 'Active'
    WHERE account_id = p_account_id;
$$;

CALL activate_account(3);