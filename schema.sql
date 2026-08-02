DROP DATABASE IF EXISTS CreditCardFraudDB;

CREATE DATABASE CreditCardFraudDB;

USE CreditCardFraudDB;
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dob DATE,
    city VARCHAR(50),
    state VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ACTIVE','BLOCKED') DEFAULT 'ACTIVE'
);
CREATE TABLE MerchantCategories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE Merchants (
    merchant_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_name VARCHAR(100) NOT NULL,
    category_id INT,
    city VARCHAR(50),
    country VARCHAR(50),
    risk_level ENUM('LOW','MEDIUM','HIGH') DEFAULT 'LOW',

    FOREIGN KEY(category_id)
    REFERENCES MerchantCategories(category_id)
);
CREATE TABLE Cards (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    card_number VARCHAR(16) UNIQUE NOT NULL,
    expiry_date DATE,
    cvv CHAR(3),
    credit_limit DECIMAL(12,2),
    available_limit DECIMAL(12,2),
    card_status ENUM('ACTIVE','BLOCKED','EXPIRED') DEFAULT 'ACTIVE',
    issued_date DATE,

    FOREIGN KEY(customer_id)
    REFERENCES Customers(customer_id)
);
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT NOT NULL,
    merchant_id INT NOT NULL,
    amount DECIMAL(12,2),
    transaction_time DATETIME,
    city VARCHAR(50),
    payment_mode ENUM('SWIPE','ONLINE','CONTACTLESS','CHIP'),
    status ENUM('SUCCESS','FAILED'),

    FOREIGN KEY(card_id)
    REFERENCES Cards(card_id),

    FOREIGN KEY(merchant_id)
    REFERENCES Merchants(merchant_id)
);
CREATE TABLE FraudAlerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    reason VARCHAR(255),
    severity ENUM('LOW','MEDIUM','HIGH'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(transaction_id)
    REFERENCES Transactions(transaction_id)
);
CREATE TABLE FailedAttempts (
    attempt_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT,
    attempt_time DATETIME,
    location VARCHAR(100),
    device VARCHAR(100),

    FOREIGN KEY(card_id)
    REFERENCES Cards(card_id)
);
CREATE TABLE CardBlocks (
    block_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT,
    reason VARCHAR(255),
    blocked_on DATETIME,

    FOREIGN KEY(card_id)
    REFERENCES Cards(card_id)
);
CREATE TABLE DailySummary (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    card_id INT,
    summary_date DATE,
    total_amount DECIMAL(12,2),
    total_transactions INT,

    FOREIGN KEY(card_id)
    REFERENCES Cards(card_id)
);
CREATE TABLE TransactionLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    action VARCHAR(100),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(transaction_id)
    REFERENCES Transactions(transaction_id)
);