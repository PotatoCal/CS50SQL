-- Insert statements to populate users table
INSERT INTO "users"
    ("first_name", "last_name", "username", "password")
VALUES
    ("Calvin", "Chan", "PotatoCal", "password")
;
INSERT INTO "users"
    ("username", "password")
VALUES
    ("Anon","v")
;
SELECT * FROM users;

-- Insert statements to populate stocks table
INSERT INTO "stocks"
    ("date", "ticker", "name", "industry", "price")
VALUES
    ("2025-05-23", "APPL", "Apple", "Technology", 19527),
    ("2025-05-23", "AMZN", "Amazon", "Technology", 20099),
    ("2025-05-23", "VRTX", "Vertex Pharmaceuticals", "Health", 43600),
    ("2025-05-23", "NVDA", "Nvidia", "Technology", 13129),
    ("2025-05-23", "GBTC", "Bitcoin trust", "Crypto", 8567),
    ("2025-05-23", "MELI", "MercadoLibre", "Retail", 250783),
    ("2025-05-23", "GOOG", "Google", "Technology", 16959),
    ("2025-05-23", "MCK", "McKesson Corp", "Health", 71609),
    ("2025-05-23", "ETHE", "Ethereum trust", "Crypto", 2127),
    ("2025-05-23", "TSM", "Taiwan Semiconductor", "Semiconductor", 19198),
    ("2025-05-22", "APPL", "Apple", "Technology", 19490),
    ("2025-05-22", "AMZN", "Amazon", "Technology", 20010),
    ("2025-05-22", "VRTX", "Vertex Pharmaceuticals", "Health", 46876),
    ("2025-05-21", "NVDA", "Nvidia", "Technology", 9000),
    ("2025-05-22", "GBTC", "Bitcoin trust", "Crypto", 9100),
    ("2025-05-22", "MELI", "MercadoLibre", "Retail", 250122),
    ("2025-05-22", "GOOG", "Google", "Technology", 17010),
    ("2025-05-22", "MCK", "McKesson Corp", "Health", 70274),
    ("2025-05-22", "ETHE", "Ethereum trust", "Crypto", 2105),
    ("2025-05-22", "TSM", "Taiwan Semiconductor", "Semiconductor", 19085),
    ("2025-05-21", "APPL", "Apple", "Technology", 19460),
    ("2025-05-21", "AMZN", "Amazon", "Technology", 19925),
    ("2025-05-21", "VRTX", "Vertex Pharmaceuticals", "Health", 40029),
    ("2025-05-20", "NVDA", "Nvidia", "Technology", 8748),
    ("2025-05-21", "GBTC", "Bitcoin trust", "Crypto", 9500),
    ("2025-05-21", "MELI", "MercadoLibre", "Retail", 247998),
    ("2025-05-21", "GOOG", "Google", "Technology", 16859),
    ("2025-05-21", "MCK", "McKesson Corp", "Health", 70674),
    ("2025-05-21", "ETHE", "Ethereum trust", "Crypto", 2098),
    ("2025-05-21", "TSM", "Taiwan Semiconductor", "Semiconductor", 18957),
    ("2025-05-20", "APPL", "Apple", "Technology", 20000),
    ("2025-05-20", "AMZN", "Amazon", "Technology", 18754),
    ("2025-05-20", "VRTX", "Vertex Pharmaceuticals", "Health", 36899),
    ("2025-05-22", "NVDA", "Nvidia", "Technology", 8200),
    ("2025-05-20", "GBTC", "Bitcoin trust", "Crypto", 9304),
    ("2025-05-20", "MELI", "MercadoLibre", "Retail", 245896),
    ("2025-05-20", "GOOG", "Google", "Technology", 16395),
    ("2025-05-20", "MCK", "McKesson Corp", "Health", 70375),
    ("2025-05-20", "ETHE", "Ethereum trust", "Crypto", 3109),
    ("2025-05-20", "TSM", "Taiwan Semiconductor", "Semiconductor", 19056),
    ("2025-05-19", "APPL", "Apple", "Technology", 21057),
    ("2025-05-19", "AMZN", "Amazon", "Technology", 18899),
    ("2025-05-19", "VRTX", "Vertex Pharmaceuticals", "Health", 31058),
    ("2025-05-19", "NVDA", "Nvidia", "Technology", 7849),
    ("2025-05-19", "GBTC", "Bitcoin trust", "Crypto", 10000),
    ("2025-05-19", "MELI", "MercadoLibre", "Retail", 250312),
    ("2025-05-19", "GOOG", "Google", "Technology", 15983),
    ("2025-05-19", "MCK", "McKesson Corp", "Health", 71204),
    ("2025-05-19", "ETHE", "Ethereum trust", "Crypto", 3087),
    ("2025-05-19", "TSM", "Taiwan Semiconductor", "Semiconductor", 18562),
    ("2025-05-18", "APPL", "Apple", "Technology", 20912),
    ("2025-05-18", "AMZN", "Amazon", "Technology", 18502),
    ("2025-05-18", "VRTX", "Vertex Pharmaceuticals", "Health", 29068),
    ("2025-05-18", "NVDA", "Nvidia", "Technology", 6794),
    ("2025-05-18", "GBTC", "Bitcoin trust", "Crypto", 9803),
    ("2025-05-18", "MELI", "MercadoLibre", "Retail", 252019),
    ("2025-05-18", "GOOG", "Google", "Technology", 17020),
    ("2025-05-18", "MCK", "McKesson Corp", "Health", 71957),
    ("2025-05-18", "ETHE", "Ethereum trust", "Crypto", 3125),
    ("2025-05-18", "TSM", "Taiwan Semiconductor", "Semiconductor", 17957),
    ("2025-05-17", "APPL", "Apple", "Technology", 20911),
    ("2025-05-17", "AMZN", "Amazon", "Technology", 17905),
    ("2025-05-17", "VRTX", "Vertex Pharmaceuticals", "Health", 27454),
    ("2025-05-17", "NVDA", "Nvidia", "Technology", 5603),
    ("2025-05-17", "GBTC", "Bitcoin trust", "Crypto", 9957),
    ("2025-05-17", "MELI", "MercadoLibre", "Retail", 261230),
    ("2025-05-17", "GOOG", "Google", "Technology", 18120),
    ("2025-05-17", "MCK", "McKesson Corp", "Health", 70957),
    ("2025-05-17", "ETHE", "Ethereum trust", "Crypto", 3295),
    ("2025-05-17", "TSM", "Taiwan Semiconductor", "Semiconductor", 18036),
    ("2025-05-24", "APPL", "Apple", "Technology", 19612),
    ("2025-05-24", "AMZN", "Amazon", "Technology", 20100),
    ("2025-05-24", "VRTX", "Vertex Pharmaceuticals", "Health", 42968),
    ("2025-05-24", "NVDA", "Nvidia", "Technology", 13098),
    ("2025-05-24", "GBTC", "Bitcoin trust", "Crypto", 8703),
    ("2025-05-24", "MELI", "MercadoLibre", "Retail", 253098),
    ("2025-05-24", "GOOG", "Google", "Technology", 16590),
    ("2025-05-24", "MCK", "McKesson Corp", "Health", 71911),
    ("2025-05-24", "ETHE", "Ethereum trust", "Crypto", 2001),
    ("2025-05-24", "TSM", "Taiwan Semiconductor", "Semiconductor", 18943),
    ("2025-05-24", "BRKB", "Berkshire Hathaway Inc Class B", "Finance", 50346),
    ("2025-05-25", "APPL", "Apple", "Technology", 19172),
    ("2025-05-25", "AMZN", "Amazon", "Technology", 20184),
    ("2025-05-25", "VRTX", "Vertex Pharmaceuticals", "Health", 43109),
    ("2025-05-25", "NVDA", "Nvidia", "Technology", 13583),
    ("2025-05-25", "GBTC", "Bitcoin trust", "Crypto", 8674),
    ("2025-05-25", "MELI", "MercadoLibre", "Retail", 255903),
    ("2025-05-25", "GOOG", "Google", "Technology", 15876),
    ("2025-05-25", "MCK", "McKesson Corp", "Health", 71976),
    ("2025-05-25", "ETHE", "Ethereum trust", "Crypto", 2174),
    ("2025-05-25", "TSM", "Taiwan Semiconductor", "Semiconductor", 18954),
    ("2025-05-25", "BRKB", "Berkshire Hathaway Inc Class B", "Finance", 51008)
;
INSERT INTO "stocks"
    ("ticker", "name", "industry", "price")
VALUES
    ("APPL", "Apple", "Technology", 20485),
    ("AMZN", "Amazon", "Technology", 21268),
    ("VRTX", "Vertex Pharmaceuticals", "Health", 43976),
    ("NVDA", "Nvidia", "Technology", 14196),
    ("GBTC", "Bitcoin trust", "Crypto", 8795),
    ("MELI", "MercadoLibre", "Retail", 257004),
    ("GOOG", "Google", "Technology", 15925),
    ("MCK", "McKesson Corp", "Health", 72854),
    ("ETHE", "Ethereum trust", "Crypto", 2288),
    ("TSM", "Taiwan Semiconductor", "Semiconductor", 19271),
    ("BRKB", "Berkshire Hathaway Inc Class B", "Finance", 51522)
;
SELECT * FROM stocks;

-- Insert statements to populate transactions table
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    1, "BRKB", date, "BUY", "price", 10
FROM
    stocks
WHERE
    date = "2025-05-24"
    AND ticker = "BRKB"
;
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    1, "BRKB", date, "BUY", "price", 5
FROM
    stocks
WHERE
    date = "2025-05-25"
    AND ticker = "BRKB"
;
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    1, "APPL", date, "BUY", "price", 20
FROM
    stocks
WHERE
    date = "2025-05-18"
    AND ticker = "APPL"
;
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    1, "APPL", date, "SELL", "price", -10
FROM
    stocks
WHERE
    date = "2025-05-23"
    AND ticker = "APPL"
;
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    2, "APPL", date, "BUY", "price", 30
FROM
    stocks
WHERE
    date = "2025-05-21"
    AND ticker = "APPL"
;
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    2, "TSM", date, "BUY", "price", 20
FROM
    stocks
WHERE
    date = "2025-05-19"
    AND ticker = "TSM"
;
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    2, "TSM", date, "SELL", "price", -20
FROM
    stocks
WHERE
    date = "2025-05-22"
    AND ticker = "TSM"
;
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    2, "APPL", date, "BUY", "price", 10
FROM
    stocks
WHERE
    date = "2025-05-25"
    AND ticker = "APPL"
;
SELECT * FROM transactions;

-- Insert statements to populate holdings table
INSERT INTO "holdings"
    ("user_id", "ticker", "units", "average_purchase_price", "current_stock_price", "cost_basis", "current_value")
with
    buy_transactions as (
        SELECT
            user_id,
            ticker,
            COUNT(*) AS no_transactions,
            value/SUM(units) AS avg_price,
            SUM(value) AS cost_basis
        FROM
            transactions
        WHERE
            type = "BUY"
        GROUP BY
            user_id, ticker
    ),
    current_stock_prices as (
        SELECT
            *
        FROM
            stocks
        WHERE
            date = CURRENT_DATE
    )
SELECT
    a.user_id,
    a.ticker,
    SUM(a.units) AS current_units,
    b.avg_price AS average_purchase_price,
    c.price AS current_stock_price,
    b.cost_basis,
    SUM(a.units) * c.price AS current_value
FROM
    transactions a
LEFT JOIN
    buy_transactions b
    ON a.user_id = b.user_id
    AND a.ticker = b.ticker
LEFT JOIN
    current_stock_prices c
    ON a.ticker = c.ticker
GROUP BY
    a.user_id, a.ticker
;
SELECT * FROM holdings;

-- View Total portfolio for a user
SELECT * FROM portfolio
WHERE user_id = 1;

-- View Portfolio by holdings for a user
SELECT * FROM portfolio_by_stocks
WHERE user_id = 1;

-- View All current holdings and details for a user
SELECT * FROM current_holdings
WHERE user_id = 1;

-- Add a new stock
INSERT INTO "stocks"
    ("ticker", "name", "industry", "price")
VALUES
    ("NEW", "New stock", "Emerging", 10000)
;
SELECT * FROM stocks;

-- Add new prices for all assets for today
INSERT INTO "stocks"
    ("ticker", "name", "industry", "price")
VALUES
    ("APPL", "Apple", "Technology", 19892),
    ("AMZN", "Amazon", "Technology", 21234),
    ("VRTX", "Vertex Pharmaceuticals", "Health", 44012),
    ("NVDA", "Nvidia", "Technology", 13847),
    ("GBTC", "Bitcoin trust", "Crypto", 8872),
    ("MELI", "MercadoLibre", "Retail", 257928),
    ("GOOG", "Google", "Technology", 16921),
    ("MCK", "McKesson Corp", "Health", 72456),
    ("ETHE", "Ethereum trust", "Crypto", 2201),
    ("TSM", "Taiwan Semiconductor", "Semiconductor", 19482),
    ("BRKB", "Berkshire Hathaway Inc Class B", "Finance", 51437)
;

-- Add a transaction for a user
INSERT INTO "transactions"
    ("user_id", "ticker", "date", "type", "price", "units")
SELECT
    1, "NEW", date, "BUY", "price", 10
FROM
    stocks
WHERE
    date = "2025-05-26"
    AND ticker = "NEW"
;

-- Add a tag to a holding
UPDATE holdings
SET tags = "Long-term hold"
WHERE user_id = 1 AND ticker = "BRKB";

SELECT * FROM holdings;

-- Look up a specific holding for a user
SELECT * FROM current_holdings
WHERE user_id = 1 AND ticker = "BRKB";

-- Look up all transactions for a specific holding for a user
-- FUTURE UPGRADE TO DO THIS ABOVE QUERY
