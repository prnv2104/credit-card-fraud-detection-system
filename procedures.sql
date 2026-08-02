DELIMITER $$

CREATE PROCEDURE GetCustomerTransactions(IN custID INT)
BEGIN
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        t.transaction_id,
        t.amount,
        t.transaction_time,
        t.status
    FROM Customers c
    JOIN Cards cd
        ON c.customer_id = cd.customer_id
    JOIN Transactions t
        ON cd.card_id = t.card_id
    WHERE c.customer_id = custID;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE CustomerTotalSpending(IN custID INT)
BEGIN
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(t.amount) AS TotalSpent
    FROM Customers c
    JOIN Cards cd
        ON c.customer_id = cd.customer_id
    JOIN Transactions t
        ON cd.card_id = t.card_id
    WHERE c.customer_id = custID
    GROUP BY c.customer_id, c.first_name, c.last_name;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE HighValueTransactionsReport(IN limitAmount DECIMAL(12,2))
BEGIN
    SELECT
        transaction_id,
        card_id,
        amount,
        transaction_time,
        city,
        status
    FROM Transactions
    WHERE amount > limitAmount
    ORDER BY amount DESC;
END $$

DELIMITER ;