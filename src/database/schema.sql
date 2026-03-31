CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    user_role TEXT NOT NULL DEFAULT
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    sku TEXT NOT NULL,
    product_name TEXT NOT NULL,
    product_description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    stock INTEGER NOT NULL
);

CREATE TYPE transaction_enum AS ENUM ('IN', 'OUT');

CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL,
    total_value NUMERIC(10, 2)  NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    transaction_type transaction_enum NOT NULL
);
