CREATE TABLE DimProduct
(
	ProductID int CONSTRAINT PK_ProductID PRIMARY KEY NOT NULL,
	ProductName varchar(255) NOT NULL,
	ProductCategory varchar (255) NOT NULL,
	ProductUnitPrice int NOT NULL,
);

