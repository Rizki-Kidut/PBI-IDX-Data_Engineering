CREATE TABLE FactSalesOrder
(
	OrderID int PRIMARY KEY NOT NULL,
	CustomerID int FOREIGN KEY REFERENCES DimCustomer(CustomerID) NOT NULL,
	ProductID int FOREIGN KEY REFERENCES DimProduct(ProductID) NOT NULL,
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int FOREIGN KEY REFERENCES DimStatusOrder(StatusID) NOT NULL,
	OrderDate date NOT NULL
);