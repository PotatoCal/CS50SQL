# Design Document

By Calvin Chan

Video overview: <https://youtu.be/QRIA8JAM3T0>


## Scope

This database has been created for the purpose of logging and tracking a user's investments:

* Users, with their basic information
* Stocks, with their unique identifier and price over time in USD (daily)
* Transactions, with the number of units, date of the transaction, type of transaction and price at the time of transaction
* Holdings, with the number of stocks per user, current value and change over time
* Portfolios, as convenient views of a user's holdings

Out of scope is a more frequent/live-feed of stock prices, recording dividends from stocks, recording cash balances from selling and buying stocks, recording realised gains and updating the "cost_basis" when stocks are sold.


## Functional Requirements

This database will support:

* CRUD operations for users and their trades and holdings
* CRUD operations for adding stocks to the database that users can perform trades with
* Tracking historical prices of stocks, holdings and portfolios
* Automated checks to ensure no negative or fractional amount of stocks can be traded, as well as no negative prices of stocks
* Automated update of a user's holdings when a transaction is added or removed

Note that in this iteration, the system will not support a more frequent/live-feed of stock prices, recording dividends from stocks, recording cash balances from selling and buying stocks, recording realised gains and updating the "cost_basis" when stocks are sold.


## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

#### Users

The `users` table includes:

* `id`, which specifies the unique ID for the user as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `first_name`, which specifies the first name for the user as `TEXT`.
* `last_name`, which specifies the last name for the user as `TEXT`.
* `username`, which specifies the username for the user as `TEXT`. A `UNIQUE` constraint ensures no two users have the same username. A `NOT NULL` constraint ensures each user has a username to login with.
* `password`, which specifies the user's password for their username AS `TEXT`. A `NOT NULL` constraint ensures each user has a password to login with.

#### Stocks

The `stocks` table includes:

* `ticker`, which specifies the unique ID for an stock as a `TEXT`. This column thus has the `PRIMARY KEY` constraint applied, alongside `date`.
* `date`, which specifies a given date for information of an stock as a `DATE` with `NUMERIC` affinity. This column thus has the `PRIMARY KEY` constraint applied, alongside `ticker`. It also has a DEFAULT value of CURRENT_DATE.
* `name`, which specifies the name for the stock as `TEXT`.
* `industry`, which specifies the industry for the stock as `TEXT`.
* `price`, which specifies the price of an stock in cents (USD) on a given date as `INTEGER`.

All columns in the `stocks` table are required and hence should have the `NOT NULL` constraint applied. The `price` column has an additional constraint to check if its value is greater than 0, given that an stock's price cannot be equal to or less than 0.

#### Transactions

The `transactions` table includes:

* `id`, which specifies the unique ID for a transaction as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
* `user_id`, which specifies the unique ID for the user as an `INTEGER`. This column has a `FOREIGN KEY` constraint applied, as it references the `id` column in the `users` table.
* `ticker`, which specifies the unique ID for an stock as `TEXT`. This column has a `FOREIGN KEY` constraint applied, as it references the `ticker` column in the `stocks` table.
* `date`, which specifies a given date for information of an stock as a `DATE` with `NUMERIC` affinity. This column has a `FOREIGN KEY` constraint applied, as it references the `ticker` column in the `stocks` table. It also has a DEFAULT value of CURRENT_DATE.
* `type`, which specifies the type of transaction as a `TEXT`. The possible values are `BUY`, `SELL`, `DEPOSIT` and `WITHDRAW`.
* `price`, which specifies the price of the stock in cents (USD) on the date the transaction took place as an `INTEGER`.
* `units`, which specifies the number of units of the specified stock in a transaction as an `INTEGER`. Transactions are not allowed on partial stocks, only whole stocks.
* `value`, which represents the value of the transaction (`price` * `units`) as an `INTEGER`. This is a generated column.

All columns in the `transactions` table are required and hence should have the `NOT NULL` constraint applied. The `units` and `price` columns has an additional constraint to check that only integers (whole numbers) are entered in as values, there can be no decimal/partial units and that it is positive only.

#### Holdings

The `holdings` table includes:

* `date`, which specifies a given date for information of a holding as a `DATE` with `NUMERIC` affinity. This column thus has the `PRIMARY KEY` constraint applied, alongside `user_id` and `ticker`. It also has a DEFAULT value of CURRENT_DATE.
* `user_id`, which specifies the unique ID for the user as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied, alongside `date` and `ticker`. This column also has a `FOREIGN KEY` constraint applied, as it references the `id` column in the `users` table
* `ticker`, which specifies the unique ID for a stock as an `TEXT`. This column thus has the `PRIMARY KEY` constraint applied, alongside `date` and `user_id`.
* `tags`, which specifies the user-generated tags of a holding as `TEXT`. The possible values are free-form.
* `units`, which specifies the number of units a holding has as an `INTEGER`.
* `average_purchase_price`, which specifies the average purchase price in cents (USD) of a holding for a user, given an stock as an `INTEGER`.
* `current_stock_price` which specifies the current share price of a specific stock in cents (USD) as an `INTEGER`.
* `cost_basis`, which specifies the sum of the price of the stocks in holding in cents (USD), the user bought the stocks for as an `INTEGER`.
* `current_value`, which specifies the current value of the holdings of a specific stock in cents (USD) as an `INTEGER`.

All columns in the `holdings` table, except for `tags` are required and hence should have the `NOT NULL` constraint applied. The `units`, `average_purchase_price`, `cost_basis`, `current_stock_price` and `current_value` columns have an additional constraint to check that only integers (whole numbers) are entered in as values, there can be no decimal/partial units and that they are positive integers only. `units` can have a zero value, but the other 3 columns cannot.

### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](erd_investment.png)

As detailed by the diagram:

* A user can have zero to many transactions, as well as zero to many holdings. They however do not have a direct relation to stocks, they hold stocks through holdings. If a user has not submitted any transactions, they have zero transactions, and therefore zero holdings.
* An stock can have zero to many transactions, which are subsequently linked to users and holdings. stocks have to be manually added into the stocks table.
* A transaction can only have one user, one stock and one holding. They are the connecting entity for all the other entities. Even if two transactions look identical (i.e. Same user, affecting the same stock and holding), they will be different transactions and have different IDs from each other (i.e. Calvin could buy the same stock twice on the same day for the same number of units).
* A holding can only have one user, but it can have one to many transactions. A holding is the sum of transactions for a specific stock for a specific user on a specific date.


## Optimizations

The core use case of a user of this database is two-fold.
    (1) To view the current-value of their total holdings (portfolio), which is to also see how much it cost them, and the resulting change in value.
    (2) To record all transactions they've taken and subsequently the current value, cost-basis and change in each of their holdings.

As a result, three views have been created for each of the above two user stories.

### Portfolio VIEW
* `user_id`, to represent the user, from the `holdings` table
* `date`, to represent the date, from the `holdings` table
* `total_cost_basis`, to represent the sum of a user's cost of holdings on a specific date (USD with 2DP, instead of cents), calculated from the `holdings` table
* `total_current_value`, to represent the current sum value of a user's holdings on a specific date (USD with 2DP, instead of cents), calculated from the `holdings` table
* `total_change_value`, to represent the change in value of a user's holdings on a specific date (USD with 2DP, instead of cents), calculated from `total_cost_basis` and `total_current_value` columns
* `total_change_perecent`, calculated from `total_change_value` and `total_cost_basis`
* Grouped by `user_id` and `date`

### Portfolio by stocks VIEW
* `user_id`, to represent the user, from the `holdings` table
* `date`, to represent the date, from the `holdings` table
* `ticker`, to represent the stock, from the `stocks` table
* `tags`, to represent the user generated tags for their stocks, from the `holdings` table
* `industry`, to represent the stock' industry, from the `stocks` table
* `stock_current_value`, to represent the current value of a user's holdings in a specific stock on a specific date (USD with 2DP, instead of cents), calculated from the `holdings` table
* `stock_portfolio_percent`, to represent the current percentage of a user's portfolio a specific stock takes on a specific date, calculated from the `stock_current_value` and `total_current_value` columns
* Grouped by `user_id`, `date` and `ticker`

### Current holdings VIEW
* `user_id`, to represent the user, from the `holdings` table
* `date`, to represent the date, from the `holdings` table
* `ticker`, to represent the stock, from the `stocks` table
* `units`, to represent the number of units a user holds of an stock, from the `holdings` table
* `average_purchase_price`, to represent the average purchase price of a user's holdings of a specific stock on a specific date (USD with 2DP, instead of cents), from the `holdings` table
* `current_stock_price`, to represent the current share price of a specific stock on a specific date (USD with 2DP, instead of cents), from the `holdings` table
* `holding_cost_basis`, to represent the total cost basis of a user's holdings of a specific stock on a specific date (USD with 2DP, instead of cents), from the `holdings` table
* `holding_current_value`, to represent the total current value of a user's holdings of a specific stock on a specific date (USD with 2DP, instead of cents), from the `holdings` table
* `holding_change_value`, to represent the dollar change in value of a user's holdings of a specific stock on a specific date (USD with 2DP, instead of cents), from the `holdings` table
* `holding_change_percent`, calculated from `stock_change_value` and `stock_cost_basis`

Other queries would be derivations or "deep-dives" of the above two user stories. The common queries of which are stored in `queries.sql`.
As a result of these common queries, the below indexes have been created in the schema.sql file.

Per the typical queries in `queries.sql`, it is common for the system using the database to query for a user by their username. For that reason, an index has been created on the `username` column of the `users` table, to speed up the identification of a user by that column.

Per the typical queries in `queries.sql`, it is common for users of the system to look up stocks by their name, to check for stock information when deciding whether to engage in a transaction or not. For that reason, an index has been created on the `name` column of the `stocks` table to speed up identification of an stock.

Per the typical queries in `queries.sql`, it is common for users of the system to look up their own transactions. For that reason, an index has been created on the `user_id` column of the `transactions` table to speed up identification of a transaction by user.

Per the typical queries in `queries.sql`, it is common for users of the system to search through their own holdings in a variety of ways (i.e. Date, Ticker and Tags). For that reason, indexes have been created on the `user_id`, `ticker` and `tags` columns respectively on the `holdings` table to speed up identification of a user's holding.


## Limitations

The current schema assumes individual ownership of transactions and holdings. Collaborative ownership would require a shift to a many-to-many relationship between users and transactions and holdings.
The current schema also assumes a stock's price will be consistent for a calendar date. It does not allow for multiple price changes within a day, only across days. As such, the time-scale is at minimum daily.
The current schema does not support transactions of a fractional scale.
The current schema does not support dividend transactions.
The current schema does not support transfer of holdings from on user to another.
The current schema does not support a change in a user's password and logging a password change.
The current schema does not support tracking a user's cash balance from deposits or trading stocks, and whether they have enough cash to trade stocks.
The current schema does not support tracking realised gains from a sale of stocks.
The current schema does not support updating the cost-basis of holdings when stocks are sold, only the cost-basis of all stocks they have bought for that holding.
