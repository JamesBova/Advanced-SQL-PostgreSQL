/*
JSON
= stores JSON text mostly as-is

-> 
→ returns JSON

->>
→ returns text

*/

CREATE TABLE if not exists api_events_json (
    event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payload JSON
);

INSERT INTO api_events_json (payload)
VALUES (
    '{
        "customer_id": 1001,
        "status": "Active",
        "amount": 125.50
    }'
);

SELECT
    event_id,
    payload
FROM api_events_json;

SELECT
    payload -> 'status' AS status_json
FROM api_events_json;

SELECT
    payload ->> 'status' AS status_text
FROM api_events_json;