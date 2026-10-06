CREATE INDEX idx_transactions_account_id
ON transactions(account_id);

CREATE INDEX idx_transactions_account_date
ON transactions(account_id, transaction_date);