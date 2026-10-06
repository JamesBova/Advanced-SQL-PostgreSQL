-- NOT NULL
ALTER TABLE accounts
ALTER COLUMN status SET NOT NULL;


-- UNIQUE
ALTER TABLE customers
ADD CONSTRAINT uq_customers_email
UNIQUE (email);


-- CHECK
ALTER TABLE accounts
ADD CONSTRAINT chk_account_status
CHECK (status IN ('Active', 'Closed', 'Suspended'));


-- FOREIGN KEY
ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_account
FOREIGN KEY (account_id)
REFERENCES accounts(account_id);