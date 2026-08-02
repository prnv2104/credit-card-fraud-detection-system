-- =====================================================
-- Credit Card Fraud Detection System
-- fraud_detection.sql
-- =====================================================

INSERT INTO FraudAlerts
(transaction_id, reason, severity)

SELECT
    transaction_id,

    CASE
        WHEN amount > 100000 THEN 'High Value Transaction'
        WHEN status = 'FAILED' THEN 'Failed Transaction'
    END,

    CASE
        WHEN amount > 100000 THEN 'HIGH'
        WHEN status = 'FAILED' THEN 'MEDIUM'
    END

FROM Transactions

WHERE amount > 100000
   OR status = 'FAILED';