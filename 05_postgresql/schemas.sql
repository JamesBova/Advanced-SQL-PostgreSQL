CREATE SCHEMA reporting; --create schema

--create table in that schema
CREATE TABLE reporting.account_summary (
    account_id INT,
    total_amount NUMERIC(12, 2)
);

--querying that table
SELECT *
FROM reporting.account_summary;

