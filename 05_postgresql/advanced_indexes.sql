/*
B-tree
→ normal equality/range/sort lookups

Expression index
→ index a calculated expression

Partial index
→ index only certain rows

GIN
→ useful for JSONB, arrays, full-text-style searches
*/

--B-tree
CREATE INDEX if not exists idx_transactions_account_id
ON transactions(account_id);

--expression index:
CREATE INDEX if not exists idx_customers_lower_email
ON customers(LOWER(email));

--partial index:
CREATE INDEX if not exists idx_active_accounts
ON accounts(customer_id)
WHERE status = 'Active';

--for indexing jsonb
CREATE INDEX if not exists idx_api_events_payload
ON api_events_jsonb
USING GIN (payload);