-- Integers
SMALLINT
INTEGER
BIGINT

-- Exact numeric use for things like money
NUMERIC(12, 2)
DECIMAL(12, 2)

-- Floating point are approximate floating point types
REAL
DOUBLE PRECISION

-- Text
VARCHAR(100)  --variable-length text with a limit
TEXT -- variable-length text without a practical declared limit
CHAR(2)

-- Boolean
BOOLEAN

-- Date / time
DATE
TIME
TIMESTAMP --date + time, no timezone awareness
TIMESTAMPTZ --date + time with timezone handling

-- Auto-generated keys
GENERATED ALWAYS AS IDENTITY

-- Semi-structured / special
JSON
JSONB
UUID
ARRAY