few_shots = [
    {'Question' : "What is the total number of shares for Apple Inc.?", 
     'SQLQuery' : "SELECT total_shares FROM stocks WHERE company_name = 'Apple Inc.'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "1000000"},
    
    {'Question' : "What is the current price of Tesla Inc. stock?", 
     'SQLQuery' : "SELECT current_price FROM stocks WHERE company_name = 'Tesla Inc.'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "450.75"},
    
    {'Question' : "What is the total sales volume for Microsoft Corp. on January 1st, 2024?", 
     'SQLQuery' : "SELECT volume FROM price_history JOIN stocks ON price_history.stock_id = stocks.stock_id WHERE company_name = 'Microsoft Corp.' AND date = '2024-01-01'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "2000000"},
    
    {'Question' : "How many shares of Amazon.com Inc. were sold on January 2nd, 2024?", 
     'SQLQuery' : "SELECT SUM(quantity) FROM stock_transactions JOIN stocks ON stock_transactions.stock_id = stocks.stock_id WHERE company_name = 'Amazon.com Inc.' AND transaction_date = '2024-01-02' AND transaction_type = 'Sell'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "500"},
    
    {'Question' : "What was the opening price of the stock of NVIDIA Corp. on January 1st, 2024?", 
     'SQLQuery' : "SELECT open_price FROM price_history JOIN stocks ON price_history.stock_id = stocks.stock_id WHERE company_name = 'NVIDIA Corp.' AND date = '2024-01-01'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "120.00"},
    
    {'Question' : "What was the closing price of Oracle Corp. stock on January 1st, 2024?", 
     'SQLQuery' : "SELECT close_price FROM price_history JOIN stocks ON price_history.stock_id = stocks.stock_id WHERE company_name = 'Oracle Corp.' AND date = '2024-01-01'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "145.50"},
    
    {'Question' : "How much was the total amount spent on buying stocks of Meta Platforms Inc. on January 2nd, 2024?", 
     'SQLQuery' : "SELECT SUM(price_per_share * quantity) FROM stock_transactions JOIN stocks ON stock_transactions.stock_id = stocks.stock_id WHERE company_name = 'Meta Platforms Inc.' AND transaction_date = '2024-01-02' AND transaction_type = 'Buy'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "15600.00"},
    
    {'Question' : "What is the high price of Tesla Inc. stock on January 1st, 2024?", 
     'SQLQuery' : "SELECT high_price FROM price_history JOIN stocks ON price_history.stock_id = stocks.stock_id WHERE company_name = 'Tesla Inc.' AND date = '2024-01-01'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "465.00"},
    
    {'Question' : "How many shares of Meta Platforms Inc. are available?", 
     'SQLQuery' : "SELECT total_shares FROM stocks WHERE company_name = 'Meta Platforms Inc.'", 
     'SQLResult': "Result of the SQL query", 
     'Answer' : "1500000"}
]