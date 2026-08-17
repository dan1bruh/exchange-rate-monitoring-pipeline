CREATE OR REPLACE VIEW vw_rate_changes AS
SELECT
    rate_date,
    base_currency,
    quote_currency,
    rate,

    LAG(rate) OVER (
        PARTITION BY base_currency, quote_currency
        ORDER BY rate_date
    ) AS previous_rate,

    ROUND(
        (
            rate - LAG(rate) OVER (
                PARTITION BY base_currency, quote_currency
                ORDER BY rate_date
            )
        )
        /
        NULLIF(
            LAG(rate) OVER (
                PARTITION BY base_currency, quote_currency
                ORDER BY rate_date
            ),
            0
        )
        * 100,
        4
    ) AS daily_change_percent

FROM exchange_rates;
