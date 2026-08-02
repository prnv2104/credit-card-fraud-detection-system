-- =====================================================
-- Credit Card Fraud Detection System
-- analytics.sql
-- =====================================================

-- =====================================================
-- WINDOW FUNCTIONS
-- =====================================================

-- ROW_NUMBER()
SELECT
    transaction_id,
    amount,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS RowNum
FROM Transactions;


-- RANK()
SELECT
    transaction_id,
    amount,
    RANK() OVER (ORDER BY amount DESC) AS RankNum
FROM Transactions;


-- DENSE_RANK()
SELECT
    transaction_id,
    amount,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS DenseRank
FROM Transactions;


-- ROW_NUMBER vs RANK vs DENSE_RANK
SELECT
    transaction_id,
    amount,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS RowNum,
    RANK() OVER (ORDER BY amount DESC) AS RankNum,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS DenseRank
FROM Transactions;


-- =====================================================
-- COMMON TABLE EXPRESSION (CTE)
-- =====================================================

WITH HighTransactions AS
(
    SELECT
        transaction_id,
        amount,
        city
    FROM Transactions
    WHERE amount > 10000
)
SELECT *
FROM HighTransactions;


-- =====================================================
-- ANALYTICAL QUERIES
-- =====================================================

-- Query 1 : Highest Spending Customer
SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS Customer,
    SUM(t.amount) AS TotalSpent
FROM Customers c
JOIN Cards cd
ON c.customer_id = cd.customer_id
JOIN Transactions t
ON cd.card_id = t.card_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY TotalSpent DESC;


-- Query 2 : Merchant Revenue
SELECT
    m.merchant_name,
    SUM(t.amount) AS Revenue
FROM Merchants m
JOIN Transactions t
ON m.merchant_id = t.merchant_id
GROUP BY m.merchant_name
ORDER BY Revenue DESC;


-- Query 3 : Top 5 Highest Transactions
SELECT
    transaction_id,
    amount,
    city
FROM Transactions
ORDER BY amount DESC
LIMIT 5;


-- Query 4 : Average Transaction Amount
SELECT
    AVG(amount) AS AverageTransaction
FROM Transactions;


-- Query 5 : Successful vs Failed Transactions
SELECT
    status,
    COUNT(*) AS TotalTransactions
FROM Transactions
GROUP BY status;


-- Query 6 : Customer with Maximum Transactions
SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS Customer,
    COUNT(*) AS TotalTransactions
FROM Customers c
JOIN Cards cd
ON c.customer_id = cd.customer_id
JOIN Transactions t
ON cd.card_id = t.card_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY TotalTransactions DESC;


-- Query 7 : Fraud Alerts by Severity
SELECT
    severity,
    COUNT(*) AS TotalAlerts
FROM FraudAlerts
GROUP BY severity;


-- Query 8 : Daily Transaction Summary
SELECT
    DATE(transaction_time) AS TransactionDate,
    COUNT(*) AS TotalTransactions,
    SUM(amount) AS TotalAmount
FROM Transactions
GROUP BY DATE(transaction_time);


-- Query 9 : City-wise Spending
SELECT
    city,
    SUM(amount) AS TotalSpent
FROM Transactions
GROUP BY city
ORDER BY TotalSpent DESC;


-- Query 10 : Payment Mode Usage
SELECT
    payment_mode,
    COUNT(*) AS TotalTransactions
FROM Transactions
GROUP BY payment_mode;

-- =====================================================
-- END OF analytics.sql
-- =====================================================