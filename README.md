# Automated exchange rate monitoring pipeline

  Goal of the project: Automatically tracks EUR/USD/GBP/CHF exchange rates, detects significant daily movements, and visualizes trends without manual data entry.

  End-to-end exchange rate monitoring built with:
               **- Power Automate**
               **- PostgreSQL**
               **- Power Query**
               **- Power BI**
               **- Frankfurter REST API**
## Architecture

      Frankfurter REST API
              |
              v
      Power Automate
              |
              v
      Parse JSON
              |
              v
      Record Validation
              |
              +---- Existing Record ---> Update
              |
              +---- New Record --------> Insert
              |
              v
      PostgreSQL
              |
              v
      SQL View
      LAG + Daily Change
              |
              v
      Power Query
              |
              v
      Power BI Dashboard


## Workflow
  1. Power Automate retrives EUR, USD, GBP and CHF exchange rates from Frankfurter API,
  2. JSON response is parsed and processed
  3. Existing records are checked
  4. New exchange rates are inserted into PostgreSQL
  5. Existing records are updated and not duplicated
  6. PostgreSQL stores historical exchange-rate data
  7. Using a window function called LAG() the previous exchange rate and daily percentage change is calculated
  8. Power Query adds additional currency info and groups exchange rate changes into different movement categories
  9. Finally, Power BI visualization
