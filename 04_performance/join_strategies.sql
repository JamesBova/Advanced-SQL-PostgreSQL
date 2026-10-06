-- 3 join stratagies for postgresql automatically picks.

/*
Nested Loop
= repeated lookups

Hash Join
= build lookup structure, then match

Merge Join
= walk two ordered datasets together

Nested Loop → good when one side is small or indexed lookups are cheap
Hash Join → good for equality joins over larger sets
Merge Join → good when both sides are sorted on the join key
*/

EXPLAIN
SELECT
    c.customer_id,
    c.first_name,
    a.account_id
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id;