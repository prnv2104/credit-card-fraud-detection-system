-- =====================================================
-- Credit Card Fraud Detection System
-- indexes.sql
-- =====================================================

CREATE INDEX idx_amount
ON Transactions(amount);

CREATE INDEX idx_customer
ON Cards(customer_id);

CREATE INDEX idx_email
ON Customers(email);