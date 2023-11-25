CREATE TABLE DimCustomer
(
	CustomerID int PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
	LastName varchar (50) NOT NULL,
	Age int,
	Gender varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	NoHp varchar (50) NOT NULL
);