CREATE OR REPLACE FUNCTION get_account_total(p_account_id INT)
RETURNS NUMERIC
LANGUAGE SQL
AS $$
    SELECT COALESCE(SUM(amount), 0)
    FROM transactions
    WHERE account_id = p_account_id;
$$;

SELECT get_account_total(1);