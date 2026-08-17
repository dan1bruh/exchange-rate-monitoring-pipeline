CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE exchange_rates (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    rate_date DATE NOT NULL,
    base_currency VARCHAR(3) NOT NULL,
    quote_currency VARCHAR(3) NOT NULL,
    rate NUMERIC(12, 6) NOT NULL,
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT exchange_rates_unique_rate
        UNIQUE (
            rate_date,
            base_currency,
            quote_currency
        )
);
