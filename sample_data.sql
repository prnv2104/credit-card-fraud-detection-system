INSERT INTO MerchantCategories (category_name) VALUES
('Grocery'),
('Electronics'),
('Restaurant'),
('Fuel'),
('Healthcare'),
('Travel'),
('Fashion'),
('Entertainment'),
('Education'),
('Online Shopping');

INSERT INTO Customers
(first_name,last_name,email,phone,dob,city,state)
VALUES
('Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-10','Delhi','Delhi'),
('Priya','Verma','priya@gmail.com','9876543211','1999-01-15','Mumbai','Maharashtra'),
('Aman','Singh','aman@gmail.com','9876543212','1997-09-12','Chandigarh','Punjab'),
('Sneha','Gupta','sneha@gmail.com','9876543213','2000-02-22','Bangalore','Karnataka'),
('Rohit','Mehta','rohit@gmail.com','9876543214','1996-06-30','Pune','Maharashtra'),
('Anjali','Kapoor','anjali@gmail.com','9876543215','1995-07-20','Jaipur','Rajasthan'),
('Vikas','Arora','vikas@gmail.com','9876543216','1994-08-18','Lucknow','UP'),
('Neha','Joshi','neha@gmail.com','9876543217','1998-11-01','Indore','MP'),
('Karan','Malhotra','karan@gmail.com','9876543218','1999-12-25','Hyderabad','Telangana'),
('Simran','Kaur','simran@gmail.com','9876543219','1997-03-19','Amritsar','Punjab');

INSERT INTO Merchants
(merchant_name, category_id, city, country, risk_level)
VALUES
('Amazon',10,'Bangalore','India','LOW'),
('Flipkart',10,'Bangalore','India','LOW'),
('Reliance Fresh',1,'Delhi','India','LOW'),
('DMart',1,'Mumbai','India','LOW'),
('Starbucks',3,'Delhi','India','LOW'),
('Dominos',3,'Chandigarh','India','LOW'),
('Indian Oil',4,'Delhi','India','LOW'),
('HP Petrol Pump',4,'Jaipur','India','LOW'),
('Apollo Hospital',5,'Delhi','India','LOW'),
('MakeMyTrip',6,'Gurgaon','India','MEDIUM');

INSERT INTO Cards
(customer_id,card_number,expiry_date,cvv,credit_limit,available_limit,issued_date)
VALUES
(1,'4532010000000001','2029-12-31','123',100000,100000,'2024-01-01'),
(2,'4532010000000002','2029-11-30','234',150000,150000,'2024-01-05'),
(3,'4532010000000003','2028-10-31','345',80000,80000,'2024-01-10'),
(4,'4532010000000004','2028-09-30','456',120000,120000,'2024-01-15'),
(5,'4532010000000005','2029-08-31','567',90000,90000,'2024-01-20'),
(6,'4532010000000006','2029-07-31','678',110000,110000,'2024-01-25'),
(7,'4532010000000007','2028-06-30','789',95000,95000,'2024-02-01'),
(8,'4532010000000008','2028-05-31','890',130000,130000,'2024-02-05'),
(9,'4532010000000009','2029-04-30','901',200000,200000,'2024-02-10'),
(10,'4532010000000010','2029-03-31','012',175000,175000,'2024-02-15');

INSERT INTO Transactions
(card_id, merchant_id, amount, transaction_time, city, payment_mode, status)
VALUES
(1,1,2500,'2026-08-01 10:15:00','Delhi','ONLINE','SUCCESS'),
(2,2,15000,'2026-08-01 11:20:00','Mumbai','ONLINE','SUCCESS'),
(3,3,800,'2026-08-01 12:10:00','Chandigarh','SWIPE','SUCCESS'),
(4,4,3500,'2026-08-01 13:05:00','Bangalore','CONTACTLESS','SUCCESS'),
(5,5,1200,'2026-08-01 14:00:00','Pune','SWIPE','SUCCESS'),
(6,6,900,'2026-08-01 15:10:00','Jaipur','CHIP','SUCCESS'),
(7,7,4500,'2026-08-01 16:30:00','Lucknow','SWIPE','SUCCESS'),
(8,8,3000,'2026-08-01 17:00:00','Indore','CONTACTLESS','SUCCESS'),
(9,9,18000,'2026-08-01 18:15:00','Hyderabad','ONLINE','SUCCESS'),
(10,10,22000,'2026-08-01 19:45:00','Amritsar','ONLINE','SUCCESS'),
(1,2,125000,'2026-08-02 09:30:00','Delhi','ONLINE','SUCCESS'),
(1,5,300,'2026-08-02 09:35:00','Mumbai','SWIPE','SUCCESS'),
(2,3,70000,'2026-08-02 10:15:00','Mumbai','ONLINE','FAILED'),
(3,8,25000,'2026-08-02 11:20:00','Chandigarh','CONTACTLESS','SUCCESS'),
(4,9,150000,'2026-08-02 12:00:00','Delhi','ONLINE','SUCCESS'),
(5,1,5500,'2026-08-02 12:45:00','Pune','ONLINE','SUCCESS'),
(6,4,450,'2026-08-02 13:15:00','Jaipur','SWIPE','SUCCESS'),
(7,6,2500,'2026-08-02 14:20:00','Lucknow','CHIP','FAILED'),
(8,7,9200,'2026-08-02 15:00:00','Indore','ONLINE','SUCCESS'),
(9,10,32000,'2026-08-02 16:10:00','Hyderabad','ONLINE','SUCCESS');
