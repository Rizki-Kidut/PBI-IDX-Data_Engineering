CREATE TABLE DimStatusOrder
(
	StatusID int CONSTRAINT PK_StatusID PRIMARY KEY,
	StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar (50) NOT NULL,
);