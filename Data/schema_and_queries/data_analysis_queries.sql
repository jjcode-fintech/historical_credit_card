-- Group transactions of each cardholder
CREATE VIEW Tranactions_GROUPBY_Cardholder AS
    SELECT 
        ch.id, ch.name, t.amount
    FROM transaction as t
        JOIN credit_card as cc ON t.card = cc.card
        GROUP BY cc.cardholder_id,t.amount
        ORDER BY cc.cardholder_id;


-- Count the transactions that are less than $2.00 per cardholder
CREATE VIEW Tranactions_Less_$2 AS
    SELECT 
        ch.id, ch.name, COUNT(t.id) AS total_transactions 
    FROM transaction as t
        JOIN credit_card as cc on t.card = cc.card
        JOIN card_holder as ch on cc.cardholder_id = ch.id
        WHERE t.amount < 2.00
        GROUP BY ch.id
        ORDER BY total_transactions DESC

-- Create a view of top 100 highest transactions made between 7:00 am and 9:00 am
CREATE VIEW TOP_100_Transactions_7am_to_9am AS
    SELECT 
        cc.cardholder_id, t.amount,t.date
    FROM transaction AS t
        JOIN credit_card as cc ON t.card = cc.card
        WHERE EXTRACT(HOUR FROM t.date) <= 9 AND EXTRACT(HOUR FROM t.date) >=7
        ORDER BY t.amount DESC
        LIMIT 100;


-- Top 5 merchants prone to being hacked using small transactions
CREATE VIEW TOP_5_SMALL_TRANSACTIONS AS
    SELECT 
        m.id, count(t.amount) as small_transactions
    FROM merchant as m
        JOIN transaction as t on m.id = t.id_merchant
        WHERE t.amount < 2.00 
        GROUP BY m.id 
        ORDER BY count(t.amount) desc

