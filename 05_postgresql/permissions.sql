--create role:
CREATE ROLE reporting_role;

--grant persmission to that role:
GRANT USAGE
ON SCHEMA reporting
TO reporting_role;

--only current tables...not future
GRANT SELECT
ON ALL TABLES IN SCHEMA reporting
TO reporting_role;

--create login:
CREATE ROLE james
WITH LOGIN
PASSWORD 'some_password';

--assign user to group:
GRANT reporting_role
TO james;


--basic pattern:
GRANT SELECT
ON customers
TO reporting_user;

--grant multiple rights:
GRANT SELECT, INSERT, UPDATE
ON customers
TO app_user;

--remove access:
REVOKE UPDATE
ON customers
FROM app_user;

--for schemas:
GRANT USAGE
ON SCHEMA reporting
TO reporting_user;

--then tables inside that schema:
GRANT SELECT
ON ALL TABLES IN SCHEMA reporting
TO reporting_user;

--permissions for future tables
ALTER DEFAULT PRIVILEGES
IN SCHEMA reporting
GRANT SELECT
ON TABLES
TO reporting_user;