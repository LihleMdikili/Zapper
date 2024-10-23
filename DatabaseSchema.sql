CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F', 'O')),
    IDNumber VARCHAR(20) NOT NULL,
    DateOfBirth DATE,
    Address VARCHAR(255),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50),
    AccountCreated DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Merchants (
    MerchantID INT PRIMARY KEY,
    MerchantName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100) NOT NULL UNIQUE,
    ContactPhoneNumber VARCHAR(20),
    VATNumber VARCHAR(50),
    RegistrationNumber VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50),
    MerchantCategory VARCHAR(100),
    DateJoined DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    MerchantID INT,
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    CurrencyCode CHAR(3) NOT NULL,
    PaymentMethod VARCHAR(50),
    TransactionType VARCHAR(50),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Completed', 'Failed', 'Refunded')),
    ReferenceNumber VARCHAR(100),
    Description VARCHAR(255),
    CustomerIP VARCHAR(45),
    MerchantIP VARCHAR(45),
    DeviceType VARCHAR(50),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (MerchantID) REFERENCES Merchants(MerchantID)
); 
