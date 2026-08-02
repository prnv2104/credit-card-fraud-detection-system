CREATE VIEW HighValueTransactions AS
SELECT
    transaction_id,
    card_id,
    amount,
    transaction_time,
    city
FROM Transactions
WHERE amount > 10000;


CREATE VIEW SuccessfulTransactions AS
SELECT *
FROM Transactions
WHERE status = 'SUCCESS';


CREATE VIEW FailedTransactions AS
SELECT *
FROM Transactions
WHERE status = 'FAILED';


CREATE VIEW CustomerCardDetails AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    cd.card_number,
    cd.credit_limit,
    cd.available_limit
FROM Customers c
JOIN Cards cd
ON c.customer_id = cd.customer_id;


CREATE VIEW CustomerTransactions AS
SELECT
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
ON cd.card_id = t.card_id;