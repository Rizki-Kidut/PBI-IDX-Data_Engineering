CREATE TABLE FactSalesOrder
(
	OrderID int CONSTRAINT PK_OrderID PRIMARY KEY NOT NULL,
	CustomerID int CONSTRAINT FK_CustomerID FOREIGN KEY REFERENCES DimCustomer(CustomerID) NOT NULL,
	ProductID int CONSTRAINT FK_ProductID FOREIGN KEY REFERENCES DimProduct(ProductID) NOT NULL,
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int CONSTRAINT FK_StatusID FOREIGN KEY REFERENCES DimStatusOrder(StatusID) NOT NULL,
	OrderDate date NOT NULL
);

