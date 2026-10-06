/*
JSONB = stores parsed binary JSON optimized for querying/indexing

@> = contains

*/

CREATE TABLE if not exists api_events_jsonb (
    event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payload JSONB
);

INSERT INTO api_events_jsonb (payload)
VALUES (
    '{
        "customer_id": 1001,
        "status": "Active",
        "amount": 125.50,
        "tags": ["priority", "online"]
    }'
);

SELECT
    payload ->> 'status' AS status
FROM api_events_jsonb;

SELECT *
FROM api_events_jsonb
WHERE payload @> '{"status": "Active"}';

SELECT
    payload -> 'tags' AS tags
FROM api_events_jsonb;

CREATE INDEX if not exists idx_api_events_jsonb_payload
ON api_events_jsonb
USING GIN (payload);

