ANALYZE transactions;  --refresh statistics about table

SELECT
    attname,  --column name
    n_distinct, --percentage of distinct values so -0.3 is 30%
    most_common_vals, -- most common values
    most_common_freqs -- frequency of common values
FROM pg_stats
WHERE tablename = 'transactions';