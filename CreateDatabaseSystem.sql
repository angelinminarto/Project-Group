
--NAMA =
--2301850550 - ANGELIN MINARTO
--2301857260 - YOHANES RAJABASA
--2301904036 - SAYYID AHMAD SIDQI
--2301871100 - TRIADI WICAKSANA

--START

CREATE DATABASE CateringDelVia
USE CateringDelVia

CREATE TABLE StaffPosition
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'SP%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	[Name] VARCHAR(255)
)

CREATE TABLE Staff
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'ST%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	StaffPositionID VARCHAR(5),
	FOREIGN KEY (StaffPositionID) REFERENCES StaffPosition(ID),
	[Name] VARCHAR(255),
	Gender CHAR(1),
	Email VARCHAR(255) CHECK(Email NOT LIKE '@%' AND Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com' OR Email LIKE '%@yahoo.co.id'),
	Phone VARCHAR(255) CHECK(Phone LIKE '08%'),
	Salary NUMERIC(19,2) CHECK(Salary between 500000 and 5000000)
)

CREATE TABLE Customer
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'CU%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	[Name] VARCHAR(255),
	PhoneNumber VARCHAR(255) CHECK(PhoneNumber LIKE '08%'),
	[Address] VARCHAR(255),
	Gender CHAR(1),
	Email VARCHAR(255) CHECK(Email NOT LIKE '@%' AND Email LIKE '%@gmail.com' OR Email LIKE '%@yahoo.com' OR Email LIKE '%@yahoo.co.id')
)

CREATE TABLE Menu
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'ME%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	[Name] VARCHAR(255) CHECK(LEN([Name]) >5 ),
	[Description] VARCHAR(255),
	Price NUMERIC(19,2)
)

CREATE TABLE Vendor
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'VE%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	[Name] VARCHAR(255) CHECK([Name] LIKE 'PT.%'),
	PhoneNumber VARCHAR(255),
	[Address] VARCHAR(255)
)

CREATE TABLE Ingredient
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'ID%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	[Name] VARCHAR(255),
	Stock INT,
	Price NUMERIC(19,2)
)

CREATE TABLE PurchaseTransaction
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'PU%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	PurchaseDate DATE,
	Quantity INT,
	IDStaff VARCHAR(5),
	FOREIGN KEY (IDStaff) REFERENCES Staff(ID),
	VendorID VARCHAR(5),
	FOREIGN KEY (VendorID) REFERENCES Vendor(ID)
)

CREATE TABLE ServicesTransaction
(
	ID VARCHAR(5) PRIMARY KEY CHECK(SUBSTRING(ID,1,2) LIKE 'TR%' AND SUBSTRING(ID,3,3) LIKE '%[0-9]'),
	ReservationType VARCHAR(255),
	ReservationAddress VARCHAR(255),
	IDStaff VARCHAR(5),
	FOREIGN KEY (IDStaff) REFERENCES Staff(ID),
	CustomerID VARCHAR(5),
	FOREIGN KEY (CustomerID) REFERENCES Customer(ID),
	Pax INT,
	[Date] DATE
)

CREATE TABLE PurchaseTransactionDetail
(
	PurchaseTransactionID VARCHAR(5) FOREIGN KEY (PurchaseTransactionID) REFERENCES PurchaseTransaction(ID),
	IngredientID VARCHAR(5) FOREIGN KEY (IngredientID) REFERENCES Ingredient(ID)
)

CREATE TABLE ServicesTransactionDetail
(
	ServicesTransactionID VARCHAR(5) FOREIGN KEY (ServicesTransactionID) REFERENCES ServicesTransaction(ID),
	MenuID VARCHAR(5) FOREIGN KEY (MenuID) REFERENCES Menu(ID)
)

--END