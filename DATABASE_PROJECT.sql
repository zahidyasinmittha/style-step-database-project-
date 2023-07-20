-- Create the database
CREATE DATABASE shoe_store;

-- Use the shoe_store database
USE shoe_store;

-- Create the Customer table
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255) NOT NULL,
  CustomerEmail VARCHAR(255) NOT NULL,
  CustomerPhoneNumber VARCHAR(20) NOT NULL,
  CustomerAddress VARCHAR(255) NOT NULL,
  CustomerPassword VARCHAR(255) NOT NULL,
  CustomerDateOfBirth DATE NOT NULL,
  CustomerGender VARCHAR(10) NOT NULL
);

-- Create the Inventory table
CREATE TABLE Inventory (
  ShoeID INT PRIMARY KEY,
  ShoeName VARCHAR(255),
  ShoeBrand VARCHAR(255),
  ShoeCategory VARCHAR(255),
  ShoeQuantity INT,
  ShoeGender VARCHAR(10),
  ShoeSeason VARCHAR(50),
  ShoeReleaseDate DATE
);

-- Create the Shoes table
CREATE TABLE Shoes (
  ShoeID INT,
  IdShoe int primary key,
  ShoeSize INT,
  ShoeColor VARCHAR(50),
  ShoePrice DECIMAL(10, 2),
  ShoeDescription TEXT,
  FOREIGN KEY (ShoeID) REFERENCES Inventory(ShoeID)
);

-- Create the Complaint table
CREATE TABLE Complaint (
  ComplaintID INT PRIMARY KEY,
  CustomerID INT,
  ShoeID INT,
  ComplaintDate DATE,
  ComplaintDescription TEXT,
  ComplaintStatus VARCHAR(50),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (ShoeID) REFERENCES Shoes(ShoeID)
);

-- Create the Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ShoeID INT,
  ShoeSize INT,
  ShoeColor VARCHAR(50),
  ShoePrice DECIMAL(10, 2),
  ShoeQuantity INT,
  ShoePurchaseDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (ShoeID) REFERENCES Shoes(ShoeID)
);


-- Create the Purchase History table
CREATE TABLE PurchaseHistory (
  CustomerID INT,
  IdShoe INT,
  OrderID int,
  ShoeSize INT,
  Price DECIMAL(10, 2),
  Quantity INT,
  ShoePurchaseDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (IdShoe) REFERENCES Shoes(IdShoe),
   FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create the Payments table
CREATE TABLE Payments (
  PaymentID INT,
  OrderID INT,
  PaymentMethod VARCHAR(50),
  PaymentAmount DECIMAL(10, 2),
  PaymentDate DATE,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create the Shipping_orders table
CREATE TABLE Shipping_orders (
  ShippingID INT PRIMARY KEY,
  OrderID INT,
  ShippingAddress VARCHAR(255),
  ShippingMethod VARCHAR(50),
  ShippingCost DECIMAL(10, 2),
  ShippingDate DATE,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create the Analytics table
CREATE TABLE Analytics (
  TotalSales DECIMAL(10, 2),
  TotalProfits DECIMAL(10, 2),
  TotalReturns INT,
  TotalComplaints INT,
  ShoeInventoryLevels INT,
  Month VARCHAR(20),
  ID INT PRIMARY KEY AUTO_INCREMENT
);

-- Create the Admin table
CREATE TABLE Admin (
  AdminID INT PRIMARY KEY,
  AdminName VARCHAR(255),
  AdminEmail VARCHAR(255),
  AdminPhoneNumber VARCHAR(20),
  AdminAddress VARCHAR(255),
  AdminPassword VARCHAR(255),
  AdminRole VARCHAR(50)
);

-- Create the Staff table
CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  StaffName VARCHAR(255),
  StaffEmail VARCHAR(255),
  StaffPhoneNumber VARCHAR(20),
  StaffAddress VARCHAR(255),
  StaffPassword VARCHAR(255),
  StaffRole VARCHAR(50)
);

-- Create the Supplier table
CREATE TABLE Supplier (
  SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(255),
  SupplierEmail VARCHAR(255),
  SupplierPhoneNumber VARCHAR(20),
  SupplierAddress VARCHAR(255)
);

INSERT INTO Customer (CustomerID, CustomerName, CustomerEmail, CustomerPhoneNumber, CustomerAddress, CustomerPassword, CustomerDateOfBirth, CustomerGender)
VALUES (1, 'John Doe', 'johndoe@example.com', '1234567890', '123 Main St', 'password123', '1990-01-01', 'Male'),
       (2, 'Jane Smith', 'janesmith@example.com', '9876543210', '456 Elm St', 'qwerty456', '1995-05-10', 'Female'),
       (3, 'Alice Johnson', 'alicejohnson@example.com', '1231231234', '789 Oak St', 'pass1234', '1992-09-15', 'Female'),
       (4, 'Bob Anderson', 'bobanderson@example.com', '9879879876', '321 Pine St', 'securepwd', '1985-07-20', 'Male'),
       (5, 'Emily Davis', 'emilydavis@example.com', '5555555555', '456 Maple Ave', 'mypassword', '1998-12-03', 'Female'),
       (6, 'Michael Wilson', 'michaelwilson@example.com', '9998887777', '987 Cedar Ln', 'password1', '1993-04-28', 'Male'),
       (7, 'Olivia Thompson', 'oliviathompson@example.com', '1112223333', '654 Birch Rd', 'letmein', '1997-11-11', 'Female'),
       (8, 'David Lee', 'davidlee@example.com', '4444444444', '789 Elm St', 'password123', '1991-06-02', 'Male'),
       (9, 'Sophia Martinez', 'sophiamartinez@example.com', '7777777777', '123 Oak St', '12345678', '1994-03-18', 'Female'),
       (10, 'James Taylor', 'jamestaylor@example.com', '6666666666', '321 Pine Ave', 'abc123', '1988-09-09', 'Male'),
       (11, 'Emma Clark', 'emmaclark@example.com', '2223334444', '456 Maple St', 'qwerty', '1996-02-14', 'Female'),
       (12, 'Daniel Hernandez', 'danielhernandez@example.com', '8888888888', '987 Cedar Ave', 'password456', '1990-08-07', 'Male');

INSERT INTO Inventory (ShoeID, ShoeName, ShoeBrand, ShoeCategory, ShoeQuantity, ShoeGender, ShoeSeason, ShoeReleaseDate)
VALUES (1, 'Running Shoes', 'Nike', 'Sports', 50, 'Male', 'Summer', '2022-03-01'),
       (2, 'Sneakers', 'Adidas', 'Casual', 30, 'Female', 'All Seasons', '2022-06-15'),
       (3, 'Sandals', 'Reef', 'Casual', 20, 'Male', 'Summer', '2022-04-10'),
       (4, 'Boots', 'Timberland', 'Outdoor', 40, 'Male', 'Winter', '2022-09-20'),
       (5, 'Heels', 'Jimmy Choo', 'Formal', 15, 'Female', 'All Seasons', '2022-05-05'),
       (6, 'Flip Flops', 'Havaianas', 'Casual', 25, 'Female', 'Summer', '2022-06-30'),
       (7, 'Loafers', 'Gucci', 'Formal', 35, 'Male', 'All Seasons', '2022-02-15'),
       (8, 'Slippers', 'UGG', 'Casual', 10, 'Female', 'Winter', '2022-11-10');
       
INSERT INTO Shoes (IdShoe, ShoeID, ShoeSize, ShoeColor, ShoePrice, ShoeDescription)
VALUES (1, 1, 9, 'Blue', 99.99, 'Comfortable running shoes'),
       (2, 1, 10, 'Red', 99.99, 'Comfortable running shoes'),
       (3, 2, 7, 'Black', 79.99, 'Stylish sneakers'),
       (4, 2, 8, 'White', 79.99, 'Stylish sneakers'),
       (5, 3, 11, 'Brown', 49.99, 'Casual sandals'),
       (6, 3, 12, 'Black', 49.99, 'Casual sandals'),
       (7, 4, 10, 'Brown', 149.99, 'Durable boots'),
       (8, 5, 8, 'Silver', 199.99, 'Elegant heels'),
       (9, 6, 9, 'Blue', 29.99, 'Comfortable flip flops'),
       (10, 7, 9, 'Brown', 199.99, 'Stylish loafers'),
       (11, 8, 7, 'Pink', 49.99, 'Cozy slippers');
       
INSERT INTO Orders (OrderID, CustomerID, ShoeID, ShoeSize, ShoeColor, ShoePrice, ShoeQuantity, ShoePurchaseDate)
VALUES (1, 1, 2, 9, 'Blue', 99.99, 1, '2023-05-15'),
       (2, 3, 5, 8, 'Silver', 199.99, 2, '2023-05-20'),
       (3, 2, 3, 11, 'Brown', 49.99, 1, '2023-05-22'),
       (4, 4, 1, 10, 'Red', 99.99, 1, '2023-05-25'),
       (5, 1, 4, 9, 'Blue', 29.99, 1, '2023-05-26'),
       (6, 2, 1, 8, 'Black', 79.99, 1, '2023-05-27'),
       (7, 3, 6, 7, 'White', 49.99, 1, '2023-05-28'),
       (8, 4, 3, 10, 'Brown', 79.99, 1, '2023-05-28');

INSERT INTO PurchaseHistory (CustomerID, IdShoe, ShoeSize, Price, Quantity, ShoePurchaseDate)
VALUES (1, 1, 9, 99.99, 2, '2023-05-15'),
       (1, 2, 7, 79.99, 1, '2023-05-18'),
       (2, 1, 8, 99.99, 1, '2023-05-20'),
       (2, 2, 7, 79.99, 3, '2023-05-22'),
       (3, 1, 9, 99.99, 1, '2023-05-24'),
       (4, 2, 8, 79.99, 2, '2023-05-25'),
       (5, 1, 10, 99.99, 2, '2023-05-26'),
       (5, 2, 7, 79.99, 1, '2023-05-26'),
       (6, 1, 9, 99.99, 1, '2023-05-27'),
       (6, 2, 7, 79.99, 1, '2023-05-27');

INSERT INTO Complaint (ComplaintID, CustomerID, ShoeID, ComplaintDate, ComplaintDescription, ComplaintStatus)
VALUES (1, 1, 2, '2023-05-15', 'The shoes arrived damaged.', 'Open'),
       (2, 3, 5, '2023-05-20', 'Received the wrong shoe size.', 'Open'),
       (3, 2, 3, '2023-05-22', 'Shoe color is different from the picture.', 'Open'),
       (4, 4, 1, '2023-05-25', 'The shoe sole is coming apart.', 'Open'),
       (5, 1, 4, '2023-05-26', 'Shoe size is smaller than expected.', 'Open');

INSERT INTO Payments (PaymentID, OrderID, PaymentMethod, PaymentAmount, PaymentDate)
VALUES (1, 1, 'Credit Card', 99.99, '2023-05-15'),
       (2, 2, 'PayPal', 399.98, '2023-05-20'),
       (3, 3, 'Credit Card', 49.99, '2023-05-22'),
       (4, 4, 'Cash', 99.99, '2023-05-25'),
       (5, 5, 'Credit Card', 29.99, '2023-05-26'),
       (6, 6, 'PayPal', 79.99, '2023-05-27'),
       (7, 7, 'Credit Card', 49.99, '2023-05-28'),
       (8, 8, 'Credit Card', 79.99, '2023-05-28');

INSERT INTO Shipping_orders (ShippingID, OrderID, ShippingAddress, ShippingMethod, ShippingCost, ShippingDate)
VALUES (1, 1, '123 Main Street, City A', 'Standard Shipping', 5.99, '2023-05-15'),
       (2, 2, '456 Elm Street, City B', 'Express Shipping', 12.99, '2023-05-20'),
       (3, 3, '789 Oak Street, City C', 'Standard Shipping', 5.99, '2023-05-22'),
       (4, 4, '987 Pine Street, City D', 'Pickup', 0.00, '2023-05-25'),
       (5, 5, '321 Cedar Street, City E', 'Standard Shipping', 5.99, '2023-05-26'),
       (6, 6, '654 Maple Street, City F', 'Express Shipping', 12.99, '2023-05-27'),
       (7, 7, '987 Oak Street, City G', 'Standard Shipping', 5.99, '2023-05-28'),
       (8, 8, '789 Pine Street, City H', 'Standard Shipping', 5.99, '2023-05-28');

INSERT INTO Analytics (TotalSales, TotalProfits, TotalReturns, TotalComplaints, ShoeInventoryLevels, Month)
VALUES (5000.00, 2500.00, 100.00, 5, 1000, 'May 2023'),
       (6000.00, 3000.00, 150.00, 8, 950, 'June 2023'),
       (4500.00, 2000.00, 75.00, 3, 900, 'July 2023');
       
INSERT INTO Admin (AdminID, AdminName, AdminEmail, AdminPhoneNumber, AdminAddress, AdminPassword, AdminRole)
VALUES (1, 'John Doe', 'johndoe@example.com', '1234567890', '123 Main Street, City A', 'admin123', 'Administrator'),
       (2, 'Jane Smith', 'janesmith@example.com', '9876543210', '456 Elm Street, City B', 'admin456', 'Administrator');

INSERT INTO Staff (StaffID, StaffName, StaffEmail, StaffPhoneNumber, StaffAddress, StaffPassword, StaffRole)
VALUES (1, 'Mike Johnson', 'mike@example.com', '1234567890', '123 Main Street, City A', 'staff123', 'Sales Representative'),
       (2, 'Sarah Davis', 'sarah@example.com', '9876543210', '456 Elm Street, City B', 'staff456', 'Customer Support');
       
INSERT INTO Supplier (SupplierID, SupplierName, SupplierEmail, SupplierPhoneNumber, SupplierAddress)
VALUES (1, 'Nike', 'nike@example.com', '+1 (123) 456-7890', '123 Main Street, City A'),
       (2, 'Adidas', 'adidas@example.com', '+1 (987) 654-3210', '456 Elm Street, City B');
ALTER TABLE Customer
ADD COLUMN CustomerStatus VARCHAR(20);
ALTER TABLE Customer
MODIFY COLUMN CustomerPhoneNumber VARCHAR(15);
ALTER TABLE Inventory
CHANGE COLUMN ShoeBrand Brand VARCHAR(50);
ALTER TABLE Inventory CHANGE COLUMN Brand ShoeBrand VARCHAR(50);
ALTER TABLE Shoes
MODIFY COLUMN ShoePrice DECIMAL(10, 2) NOT NULL;
ALTER TABLE PurchaseHistory
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);
ALTER TABLE Inventory
MODIFY COLUMN ShoeQuantity INT;
ALTER TABLE Customer
DROP COLUMN CustomerStatus;

DROP TABLE Complaint;
DROP TABLE Orders;
DROP TABLE Payments;

SELECT * FROM Inventory WHERE ShoeBrand = 'Nike';
SELECT * FROM Shoes WHERE ShoeColor = 'Black' AND ShoePrice BETWEEN 50 AND 100;
SELECT * FROM Complaint WHERE ComplaintStatus = 'Open';
SELECT * FROM Shipping_orders WHERE ShippingMethod = 'Express';
SELECT SUM(Price) AS TotalSales, SUM(Price * Quantity) AS TotalProfits FROM PurchaseHistory;
SELECT COUNT(*) AS TotalReturns FROM PurchaseHistory WHERE Quantity > 0;
SELECT COUNT(*) AS TotalComplaints FROM Complaint;
SELECT * FROM Customer WHERE CustomerGender = 'Female';
SELECT * FROM Inventory WHERE ShoeQuantity > 10;
SELECT * FROM Inventory WHERE ShoeSeason = 'Summer';
SELECT * FROM Complaint WHERE ComplaintDate BETWEEN '2023-01-01' AND '2023-06-30';
SELECT * FROM Orders WHERE ShoeColor = 'Red' AND ShoeQuantity < 5;
SELECT * FROM Payments WHERE PaymentAmount BETWEEN 100 AND 500;
SELECT * FROM Shipping_orders WHERE ShippingCost BETWEEN 10 AND 20;
SELECT * FROM Customer WHERE MONTH(CustomerDateOfBirth) = 5;

SELECT * FROM Customer WHERE CustomerGender = 'Female' ORDER BY CustomerName;
SELECT ShoeBrand, SUM(ShoeQuantity) AS TotalQuantity, AVG(ShoePrice) AS AveragePrice FROM Inventory,Shoes GROUP BY ShoeBrand;
SELECT OrderID, SUM(ShoePrice * ShoeQuantity) AS TotalPrice FROM Orders GROUP BY OrderID HAVING TotalPrice > 100;
SELECT CustomerID, COUNT(*) AS ComplaintCount FROM Complaint GROUP BY CustomerID HAVING ComplaintCount < 3;
SELECT Customer.CustomerID, Customer.CustomerName, SUM(PurchaseHistory.Price) AS TotalPurchaseAmount FROM PurchaseHistory JOIN Customer ON PurchaseHistory.CustomerID = Customer.CustomerID GROUP BY Customer.CustomerID, Customer.CustomerName HAVING TotalPurchaseAmount BETWEEN 100 AND 500 ORDER BY TotalPurchaseAmount DESC;
SELECT ShoeCategory, SUM(ShoeQuantity) AS TotalQuantity FROM Inventory GROUP BY ShoeCategory ORDER BY TotalQuantity DESC;

ALTER TABLE PurchaseHistory ADD CONSTRAINT FK_PurchaseHistory_Customer FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE Complaint ADD CONSTRAINT FK_Complaint_Customer FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE PurchaseHistory ADD CONSTRAINT FK_PurchaseHistory_Inventory FOREIGN KEY (ShoeID) REFERENCES Inventory (ShoeID);
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customer FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Inventory FOREIGN KEY (ShoeID) REFERENCES Inventory (ShoeID);

SELECT Inventory.ShoeName,Shoes.ShoePrice FROM Inventory inner JOIN Shoes ON Inventory.ShoeID = Shoes.ShoeID;
SELECT Customer.CustomerName, PurchaseHistory.IdShoe, PurchaseHistory.Price FROM Customer LEFT JOIN PurchaseHistory ON Customer.CustomerID = PurchaseHistory.CustomerID;
SELECT Customer.CustomerName, PurchaseHistory.IdShoe, PurchaseHistory.Price FROM Customer RIGHT JOIN PurchaseHistory ON Customer.CustomerID = PurchaseHistory.CustomerID;
SELECT Customer.CustomerName, PurchaseHistory.IdShoe, PurchaseHistory.Price FROM Customer CROSS JOIN PurchaseHistory ON Customer.CustomerID = PurchaseHistory.CustomerID;
SELECT Customer.CustomerName, Inventory.ShoeName FROM Customer INNER JOIN PurchaseHistory ON Customer.CustomerID = PurchaseHistory.CustomerID INNER JOIN Inventory ON PurchaseHistory.IdShoe = Inventory.ShoeID;
SELECT Customer.CustomerName, Inventory.ShoeName, Payments.PaymentMethod FROM Customer JOIN Orders ON Customer.CustomerID = Orders.CustomerID JOIN Inventory ON Orders.ShoeID = Inventory.ShoeID JOIN Payments ON Orders.OrderID = Payments.OrderID WHERE Orders.OrderID=1;
SELECT Customer.CustomerName, SUM(PurchaseHistory.Price) AS TotalPurchaseAmount FROM Customer JOIN PurchaseHistory ON Customer.CustomerID = PurchaseHistory.CustomerID GROUP BY Customer.CustomerName;

SELECT CustomerName FROM Customer WHERE CustomerID IN ( SELECT CustomerID FROM PurchaseHistory );
SELECT CustomerName, (SELECT COUNT(*) FROM PurchaseHistory WHERE CustomerID = Customer.CustomerID) AS PurchaseCount FROM Customer;
SELECT IdShoe, AVG(Price) AS AveragePrice FROM PurchaseHistory GROUP BY IdShoe HAVING AVG(Price) > (SELECT AVG(Price) FROM PurchaseHistory);

drop database shoe_store;

select * from Shoes 
where ShoeColor like 'b%';

select Customer.customerID,Customer.CustomerName,Inventory.ShoeName,Orders.ShoePrice,Orders.ShoeQuantity from Customer
join Orders on Customer.customerID=Orders.customerID
join Inventory  on Inventory.ShoeID = Orders.ShoeID;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select Customer.customerID,Customer.CustomerName,Inventory.ShoeName,Orders.ShoePrice,Orders.ShoeQuantity from Customer
join Orders on Customer.customerID=Orders.customerID
join Inventory  on Inventory.ShoeID = Orders.ShoeID group by Customer.CustomerName;

SELECT @@sql_mode;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT Customer.customerID, Customer.CustomerName,PurchaseHistory.CustomerID,count(PurchaseHistory.CustomerID)
FROM Customer
JOIN PurchaseHistory ON Customer.customerID = PurchaseHistory.CustomerID
GROUP BY Customer.customerID, Customer.CustomerName;

DELIMITER //
create procedure max_order1()
begin
SELECT Customer.customerID, Customer.CustomerName, COUNT(PurchaseHistory.CustomerID) AS PurchaseCount
FROM Customer
JOIN PurchaseHistory ON Customer.customerID = PurchaseHistory.CustomerID
GROUP BY Customer.customerID, Customer.CustomerName
ORDER BY PurchaseCount DESC
LIMIT 1;
END //
DELIMITER ;

CALL max_order1();
SET GLOBAL sql_mode = 'modes_without_only_full_group_by';




