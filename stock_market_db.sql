-- Create the database
CREATE DATABASE stock_market;
USE stock_market;

-- Create the stocks table
CREATE TABLE stocks (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL UNIQUE,
    company_name VARCHAR(100) NOT NULL,
    sector ENUM('Technology', 'Healthcare', 'Finance', 'Energy', 'Consumer Goods') NOT NULL,
    current_price DECIMAL(10, 2) CHECK (current_price > 0),
    total_shares BIGINT CHECK (total_shares > 0),
    UNIQUE KEY symbol_company (symbol, company_name)
);

-- Create the price_history table
CREATE TABLE price_history (
    price_id INT AUTO_INCREMENT PRIMARY KEY,
    stock_id INT NOT NULL,
    date DATE NOT NULL,
    open_price DECIMAL(10, 2) CHECK (open_price > 0),
    close_price DECIMAL(10, 2) CHECK (close_price > 0),
    high_price DECIMAL(10, 2) CHECK (high_price > 0),
    low_price DECIMAL(10, 2) CHECK (low_price > 0),
    volume BIGINT CHECK (volume > 0),
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- Create the stock_transactions table
CREATE TABLE stock_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    stock_id INT NOT NULL,
    transaction_type ENUM('Buy', 'Sell') NOT NULL,
    transaction_date DATE NOT NULL,
    quantity INT CHECK (quantity > 0),
    price_per_share DECIMAL(10, 2) CHECK (price_per_share > 0),
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- Create a stored procedure to populate the stocks table
DELIMITER $$
CREATE PROCEDURE PopulateStocks()
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE max_records INT DEFAULT 50;
    DECLARE symbol VARCHAR(10);
    DECLARE company_name VARCHAR(100);
    DECLARE sector ENUM('Technology', 'Healthcare', 'Finance', 'Energy', 'Consumer Goods');
    DECLARE current_price DECIMAL(10, 2);
    DECLARE total_shares BIGINT;

    -- Seed the random number generator
    SET SESSION rand_seed1 = UNIX_TIMESTAMP();

    WHILE counter < max_records DO
        -- Generate random values
        SET symbol = CONCAT('SYM', LPAD(FLOOR(1 + RAND() * 999), 3, '0'));
        SET company_name = CONCAT('Company', LPAD(counter + 1, 3, '0'));
        SET sector = ELT(FLOOR(1 + RAND() * 5), 'Technology', 'Healthcare', 'Finance', 'Energy', 'Consumer Goods');
        SET current_price = ROUND(10 + RAND() * 490, 2); -- Prices between 10 and 500
        SET total_shares = FLOOR(1e6 + RAND() * 9e6);    -- Shares between 1M and 10M

        -- Attempt to insert a new record
        BEGIN
            DECLARE CONTINUE HANDLER FOR 1062 BEGIN END;  -- Handle duplicate key error
            INSERT INTO stocks (symbol, company_name, sector, current_price, total_shares)
            VALUES (symbol, company_name, sector, current_price, total_shares);
            SET counter = counter + 1;
        END;
    END WHILE;
END$$
DELIMITER ;

-- Call the stored procedure to populate the stocks table
CALL PopulateStocks();

-- Insert at least 10 records into the price_history table
INSERT INTO price_history (stock_id, date, open_price, close_price, high_price, low_price, volume)
VALUES
(1, '2024-01-01', 100.00, 105.00, 110.00, 95.00, 1000000),
(2, '2024-01-01', 200.00, 210.00, 220.00, 190.00, 2000000),
(3, '2024-01-01', 300.00, 295.00, 310.00, 280.00, 1500000),
(4, '2024-01-01', 150.00, 155.00, 160.00, 145.00, 800000),
(5, '2024-01-01', 50.00, 55.00, 60.00, 45.00, 500000),
(6, '2024-01-01', 90.00, 95.00, 100.00, 85.00, 750000),
(7, '2024-01-01', 120.00, 130.00, 135.00, 110.00, 900000),
(8, '2024-01-01', 250.00, 260.00, 270.00, 240.00, 3000000),
(9, '2024-01-01', 400.00, 390.00, 410.00, 380.00, 1000000),
(10, '2024-01-01', 80.00, 85.00, 90.00, 70.00, 600000);

-- Insert at least 10 records into the stock_transactions table
INSERT INTO stock_transactions (stock_id, transaction_type, transaction_date, quantity, price_per_share)
VALUES
(1, 'Buy', '2024-01-02', 100, 105.00),
(2, 'Sell', '2024-01-02', 200, 210.00),
(3, 'Buy', '2024-01-02', 150, 295.00),
(4, 'Sell', '2024-01-02', 50, 155.00),
(5, 'Buy', '2024-01-02', 100, 55.00),
(6, 'Sell', '2024-01-02', 75, 95.00),
(7, 'Buy', '2024-01-02', 120, 130.00),
(8, 'Sell', '2024-01-02', 300, 260.00),
(9, 'Buy', '2024-01-02', 100, 390.00),
(10, 'Sell', '2024-01-02', 80, 85.00);


SET SQL_SAFE_UPDATES = 0;


-- Update the company_name with real company names
UPDATE stocks SET company_name = 'Apple Inc.' WHERE company_name = 'Company001';
UPDATE stocks SET company_name = 'Microsoft Corp.' WHERE company_name = 'Company002';
UPDATE stocks SET company_name = 'Amazon.com Inc.' WHERE company_name = 'Company003';
UPDATE stocks SET company_name = 'Tesla Inc.' WHERE company_name = 'Company004';
UPDATE stocks SET company_name = 'Alphabet Inc.' WHERE company_name = 'Company005';
UPDATE stocks SET company_name = 'Meta Platforms Inc.' WHERE company_name = 'Company006';
UPDATE stocks SET company_name = 'Netflix Inc.' WHERE company_name = 'Company007';
UPDATE stocks SET company_name = 'NVIDIA Corp.' WHERE company_name = 'Company008';
UPDATE stocks SET company_name = 'Intel Corp.' WHERE company_name = 'Company009';
UPDATE stocks SET company_name = 'Adobe Inc.' WHERE company_name = 'Company010';
UPDATE stocks SET company_name = 'Oracle Corp.' WHERE company_name = 'Company011';
UPDATE stocks SET company_name = 'Salesforce Inc.' WHERE company_name = 'Company012';
UPDATE stocks SET company_name = 'PepsiCo Inc.' WHERE company_name = 'Company013';
UPDATE stocks SET company_name = 'Coca-Cola Co.' WHERE company_name = 'Company014';
UPDATE stocks SET company_name = 'Pfizer Inc.' WHERE company_name = 'Company015';
UPDATE stocks SET company_name = 'Johnson & Johnson' WHERE company_name = 'Company016';
UPDATE stocks SET company_name = 'Chevron Corp.' WHERE company_name = 'Company017';
UPDATE stocks SET company_name = 'ExxonMobil Corp.' WHERE company_name = 'Company018';
UPDATE stocks SET company_name = 'Cisco Systems Inc.' WHERE company_name = 'Company019';
UPDATE stocks SET company_name = 'Qualcomm Inc.' WHERE company_name = 'Company020';
UPDATE stocks SET company_name = 'Broadcom Inc.' WHERE company_name = 'Company021';
UPDATE stocks SET company_name = 'Procter & Gamble Co.' WHERE company_name = 'Company022';
UPDATE stocks SET company_name = 'Unilever PLC' WHERE company_name = 'Company023';
UPDATE stocks SET company_name = 'Roche Holding AG' WHERE company_name = 'Company024';
UPDATE stocks SET company_name = 'Merck & Co. Inc.' WHERE company_name = 'Company025';
UPDATE stocks SET company_name = 'Eli Lilly and Co.' WHERE company_name = 'Company026';
UPDATE stocks SET company_name = 'AbbVie Inc.' WHERE company_name = 'Company027';
UPDATE stocks SET company_name = 'AstraZeneca PLC' WHERE company_name = 'Company028';
UPDATE stocks SET company_name = 'Bristol-Myers Squibb' WHERE company_name = 'Company029';
UPDATE stocks SET company_name = 'Amgen Inc.' WHERE company_name = 'Company030';
UPDATE stocks SET company_name = 'Gilead Sciences Inc.' WHERE company_name = 'Company031';
UPDATE stocks SET company_name = 'Biogen Inc.' WHERE company_name = 'Company032';
UPDATE stocks SET company_name = 'Moderna Inc.' WHERE company_name = 'Company033';
UPDATE stocks SET company_name = 'Regeneron Pharmaceuticals' WHERE company_name = 'Company034';
UPDATE stocks SET company_name = 'GlaxoSmithKline PLC' WHERE company_name = 'Company035';
UPDATE stocks SET company_name = 'Sanofi SA' WHERE company_name = 'Company036';
UPDATE stocks SET company_name = 'Bayer AG' WHERE company_name = 'Company037';
UPDATE stocks SET company_name = 'Novartis AG' WHERE company_name = 'Company038';
UPDATE stocks SET company_name = 'Siemens AG' WHERE company_name = 'Company039';
UPDATE stocks SET company_name = 'Volkswagen AG' WHERE company_name = 'Company040';
UPDATE stocks SET company_name = 'SAP SE' WHERE company_name = 'Company041';
UPDATE stocks SET company_name = 'IBM Corp.' WHERE company_name = 'Company042';
UPDATE stocks SET company_name = 'Uber Technologies Inc.' WHERE company_name = 'Company043';
UPDATE stocks SET company_name = 'Lyft Inc.' WHERE company_name = 'Company044';
UPDATE stocks SET company_name = 'Shopify Inc.' WHERE company_name = 'Company045';
UPDATE stocks SET company_name = 'Square Inc.' WHERE company_name = 'Company046';
UPDATE stocks SET company_name = 'PayPal Holdings Inc.' WHERE company_name = 'Company047';
UPDATE stocks SET company_name = 'Airbnb Inc.' WHERE company_name = 'Company048';
UPDATE stocks SET company_name = 'Twitter Inc.' WHERE company_name = 'Company049';
UPDATE stocks SET company_name = 'Snap Inc.' WHERE company_name = 'Company050';

SET SQL_SAFE_UPDATES = 1;