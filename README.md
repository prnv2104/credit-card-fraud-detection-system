# Credit Card Fraud Detection System

A SQL-based database project that simulates a real-world credit card transaction system with automated fraud detection, transaction monitoring, analytical reporting, and database automation using MySQL.

---

## Features

- Customer, Card and Merchant Management
- Credit Card Transaction Processing
- Fraud Alert Generation
- Automatic Transaction Logging
- Automatic Credit Limit Updates
- Stored Procedures for Reports
- SQL Views for Business Insights
- Window Functions & CTE Analytics
- Index Optimization for Faster Queries

---

## Tech Stack

- MySQL 8.0
- MySQL Workbench
- SQL

---

## Database Design

The project consists of the following entities:

- Customers
- Cards
- Merchant Categories
- Merchants
- Transactions
- Fraud Alerts
- Failed Attempts
- Card Blocks
- Daily Summary
- Transaction Logs

---

## Project Structure

```
CreditCardFraudDetectionSystem
│
├── schema.sql
├── sample_data.sql
├── views.sql
├── procedures.sql
├── triggers.sql
├── analytics.sql
├── indexes.sql
├── fraud_detection.sql
├── README.md
└── screenshots/
```

---

## Key Features

### Database Design
- Relational schema with Primary Keys and Foreign Keys
- Normalized database structure
- Referential Integrity

### Stored Procedures

- GetCustomerTransactions()
- CustomerTotalSpending()
- HighValueTransactionsReport()

### Triggers

- AutoFraudAlert
- LogTransaction
- UpdateAvailableLimit

### Views

- HighValueTransactions
- SuccessfulTransactions
- FailedTransactions
- CustomerCardDetails
- CustomerTransactions

### Analytics

Implemented using:

- Window Functions
  - ROW_NUMBER()
  - RANK()
  - DENSE_RANK()

- Common Table Expressions (CTEs)

- Aggregate Functions

- Customer Spending Analysis

- Merchant Revenue Analysis

- Daily Transaction Summary

- Payment Mode Analysis

### Indexes

Indexes created on frequently queried columns to improve query performance.

---

## Sample Outputs

The repository contains screenshots demonstrating:

- Database Structure
- Tables
- Views
- Stored Procedures
- Triggers
- Customer Analytics
- Fraud Alerts
- Transaction Logs
- Window Functions
- Indexes

---

## How to Run

1. Execute schema.sql
2. Execute sample_data.sql
3. Execute views.sql
4. Execute procedures.sql
5. Execute triggers.sql
6. Execute indexes.sql
7. Execute fraud_detection.sql
8. Execute analytics.sql
---

## Future Improvements

- Machine Learning based fraud prediction
- Java/Spring Boot REST API
- React Dashboard
- Power BI Analytics Dashboard
- Email/SMS Fraud Notifications

---

## Resume Highlights

- Designed and implemented a normalized relational database with 10+ tables.
- Developed SQL Views, Stored Procedures, and Triggers to automate business workflows.
- Implemented fraud detection rules for high-value and failed transactions.
- Optimized query performance using indexes.
- Performed advanced SQL analytics using Window Functions and CTEs.