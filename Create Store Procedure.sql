CREATE PROCEDURE dbo.summary_order_status
@StatusID int AS BEGIN
SELECT 
f.OrderID, 
c.CustomerName, 
p.ProductName,
f.Quantity,
s.StatusOrder,
s.StatusOrderDesc
FROM
dbo.FactSalesOrder AS f
JOIN DimCustomer AS c ON  f.CustomerID = c.CustomerID
JOIN DimProduct AS p ON f.ProductID = p.ProductID
JOIN DimStatusOrder AS s ON f.StatusID = s.StatusID
WHERE s.StatusID = @StatusID;
END