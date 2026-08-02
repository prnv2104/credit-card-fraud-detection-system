DELIMITER $$

CREATE TRIGGER AutoFraudAlert
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.amount > 100000 THEN
        INSERT INTO FraudAlerts
        (transaction_id, reason, severity)
        VALUES
        (
            NEW.transaction_id,
            'Automatic High Value Fraud Detection',
            'HIGH'
        );
    END IF;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO TransactionLogs
    (transaction_id, action)
    VALUES
    (
        NEW.transaction_id,
        'New Transaction Added'
    );
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER UpdateAvailableLimit
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.status = 'SUCCESS' THEN
        UPDATE Cards
        SET available_limit = available_limit - NEW.amount
        WHERE card_id = NEW.card_id;
    END IF;
END $$

DELIMITER ;