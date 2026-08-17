# Automated exchange rate monitoring pipeline

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
