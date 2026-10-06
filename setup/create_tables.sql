CREATE TABLE customers (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts (
    account_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    opened_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_accounts_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    amount NUMERIC(12, 2) NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_transactions_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);

CREATE TABLE merchants (
    merchant_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    merchant_name VARCHAR(100) NOT NULL,
    merchant_category VARCHAR(50)
);

CREATE TABLE transaction_merchants (
    transaction_id INT NOT NULL,
    merchant_id INT NOT NULL,

    PRIMARY KEY (
        transaction_id,
        merchant_id
    ),

    CONSTRAINT fk_transaction_merchants_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES transactions(transaction_id),

    CONSTRAINT fk_transaction_merchants_merchant
        FOREIGN KEY (merchant_id)
        REFERENCES merchants(merchant_id)
);