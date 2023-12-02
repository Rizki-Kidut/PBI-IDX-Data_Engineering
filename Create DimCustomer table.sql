CREATE TABLE DimCustomer
(
	CustomerID int CONSTRAINT PK_CustomerID PRIMARY KEY ,
	CustomerName varchar(50) NOT NULL,
	Age int,
	Gender varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	NoHp varchar (50) NOT NULL
);

