-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represent users using the system
CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
PRIMARY KEY("id")
);

-- Represent stocks on the database that can be transacted on
CREATE TABLE IF NOT EXISTS "stocks" (
    "ticker" TEXT,
    "date" DATE DEFAULT(CURRENT_DATE),
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "price" INTEGER NOT NULL CHECK("price" > 0),
PRIMARY KEY("ticker", "date")
);

-- Represents transactions on the system that users action with stocks on the database
CREATE TABLE IF NOT EXISTS "transactions" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "ticker" TEXT NOT NULL,
    "date" DATE NOT NULL DEFAULT(CURRENT_DATE),
    "type" TEXT NOT NULL CHECK("type" IN ("BUY", "SELL")),
    "price" INTEGER NOT NULL CHECK("price" > 0 AND ROUND("price",0) = "price"),
    "units" INTEGER NOT NULL CHECK(ROUND("units",0) = "units" AND (("type" = "BUY" AND "units" > 0) OR ("type" = "SELL" AND "units" < 0))),
    "value" INTEGER AS ("price" * "units") NOT NULL CHECK(ROUND("value",0) = "value"),
PRIMARY KEY("id"),
FOREIGN KEY("user_id") REFERENCES "users"("id"),
FOREIGN KEY("ticker","date") REFERENCES "stocks"("ticker", "date")
);
--> FUTURE UPGRADE: Create a Constraint that makes sure the INSERT statement into `transaction` table, uses a "user_id" that exists in the `users` table
--> FUTURE UPGRADE: Create a Constraint that makes sure the INSERT statement into `transaction` table, uses a "ticker" and "date" combo that exists in the `stocks` table
--> FUTURE UPGRADE: Create a Trigger that makes sure when the INSERT statement into the `transaction` table has `type` "SELL", the specified "user_id" has enough "units" of the specified "ticker" to sell
--> FUTURE UPGRADE: Create a Trigger so that when a valid INSERT statement into the `transaction` is executed, the relevant columns in the `holdings` table is updated for the specified `user` and `ticker`


-- Represents the holdings of stocks that a user has, calculatign and deriving fields from the transactions table
CREATE TABLE IF NOT EXISTS "holdings" (
    "date" DATE DEFAULT(CURRENT_DATE),
    "user_id" INTEGER,
    "ticker" TEXT,
    "tags" TEXT,
    "units" INTEGER NOT NULL CHECK("units" >= 0),
    "average_purchase_price" INTEGER NOT NULL CHECK("average_purchase_price" > 0 AND ROUND("average_purchase_price",0) = "average_purchase_price"),
    "current_stock_price" INTEGER NOT NULL CHECK("current_stock_price" > 0 AND ROUND("current_stock_price",0) = "current_stock_price"),
    "cost_basis" INTEGER NOT NULL CHECK("cost_basis" > 0 AND ROUND("cost_basis",0) = "cost_basis"),
    "current_value" INTEGER NOT NULL CHECK("current_value" >= 0 AND ROUND("current_value",0) = "current_value"),
PRIMARY KEY("date", "user_id", "ticker"),
FOREIGN KEY("user_id") REFERENCES "users"("id")
);


-- Create View to store all users' total portfolio as a high-level view
CREATE VIEW IF NOT EXISTS portfolio AS
    SELECT
        user_id,
        date,
        ROUND(SUM(cost_basis)/100.0,2) AS "total_cost_basis",
        ROUND(SUM(current_value)/100.0,2) AS "total_current_value",
        ROUND((SUM(current_value) - SUM(cost_basis))/100.0,2) AS "total_change_value",
        ROUND(ROUND((SUM(current_value) - SUM(cost_basis)),2)/SUM(cost_basis)*100,2) AS "total_change_perecent"
    FROM
        holdings
    GROUP BY
        user_id, date
;
--> FUTURE UPGRADE: Create a Trigger that recalls this table every day and with every new transaction

-- Create View to store all users' portfolio by stock holdings, and % of portfolio
CREATE VIEW IF NOT EXISTS portfolio_by_stocks AS
    SELECT
        a.user_id AS "user_id",
        a.date AS "date",
        a.ticker AS "ticker",
        a.tags AS "tags",
        c.industry AS "industry",
        a.current_value AS "stock_current_value",
        ROUND(a.current_value/b.total_current_value,2) AS "stock_portfolio_percent"
    FROM
        holdings a
    LEFT JOIN
        portfolio b
        ON a.user_id = b.user_id
        AND a.date = b.date
    LEFT JOIN
        stocks c
        ON a.ticker = c.ticker
    WHERE
        a.current_value > 0
    GROUP BY
        a.user_id, a.date, a.ticker
;
--> FUTURE UPGRADE: Create a Trigger that recalls this table every day and with every new transaction

-- Create View to store all users' stock holdings and key info of each holding
CREATE VIEW IF NOT EXISTS current_holdings AS
    SELECT
        user_id,
        date,
        ticker,
        units,
        ROUND(average_purchase_price/100.0,2) AS "average_purchase_price",
        ROUND(current_stock_price/100.0,2) AS "current_stock_price",
        ROUND(cost_basis/100.0,2) AS "holding_cost_basis",
        ROUND(current_value/100.0,2) AS "holding_current_value",
        ROUND(ROUND(current_value/100.0,2) - ROUND(cost_basis/100.0,2),2) AS "holding_change_value",
        ROUND((current_value - cost_basis)/CAST(cost_basis AS REAL)*100,2)AS "holding_change_percent"
    FROM
        holdings
    WHERE
        units > 0
;
--> FUTURE UPGRADE: Create a Trigger that recalls this table every day and with every new transaction


-- ##### CREATE INDEX for users on username (for checking login details)
CREATE INDEX users_username
ON users(username);

-- ##### CREATE INDEX for stocks on name (for looking up stock info)
CREATE INDEX stocks_name
ON stocks(name);

-- ##### CREATE INDEX for transactions on user_id (for looking up a user's transactions)
CREATE INDEX transactions_user_id
ON transactions(user_id);

-- ##### CREATE INDEX for holdings on user_id, ticker (for looking up a user's holdings for a specific stock)
CREATE INDEX holdings_user_ticker
ON holdings(user_id, ticker);

-- ##### CREATE INDEX for holdings on user_id, tags (for looking up a user's holdings by tags)
CREATE INDEX holdings_user_tags
ON holdings(user_id, tags);

