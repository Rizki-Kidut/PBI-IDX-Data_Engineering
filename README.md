## Chalenge
Salah satu client dari ID/X Partners yang bergerak di bidang e-commerce memiliki kebutuhan untuk membuat sebuah Data Warehouse yang berasal dari beberapa tabel dari database sumber. Data Warehouse ini nantinya terdiri dari satu tabel Fact dan beberapa tabel Dimension.
Sebagai Data Engineer, ada beberapa task yang perlu anda lakukan yaitu :

1. Melakukan Import/Restore Database Staging.
2. Membuat sebuah Database bernama DWH_Project, serta membuat Tabel Fact dan Dimension   
    dari tabel yang ada di database Staging.
3. Membuat Job ETL di aplikasi talend untuk memindahkan data dari Staging ke Data Warehouse.   
    Khusus untuk Tabel DimCustomer, lakukan transformasi data dengan merubah data
    dari kolom FirstName dan LastName menjadi huruf capital semua, lalu gabungkan kedua kolom
    tersebut menjadi satu kolom yang bernama CustomerName.
4. Membuat Store Procedure (SP) untuk menampilkan summary sales order berdasarkan status 
    pengiriman. 

## Hasil 1 & 2 Melakukan Import Database Staging, dan membuat database DWH_Project dan Tabel Fact dan Dimension 

1. Import database staging melalui file staging.bak pada menu SSMS 
![Import Staging dan membuat DWH_Project database](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/3e105277efe85b64ad8e8df31c336fff202d5d16/Import%20database%20Staging.bak%20%26%20create%20DWH_Project%20database.png)


2. Membuat database DWH_Project sebagai database tujuan & Membuat tabel DimCustomer, DimProduct, DimStatusOrder, dan FactSalesOrder dengan menggunakan SQL Syntax
- Syntax Create database DWH_Project:
  ```
  CREATE DATABASE DWH_Project;

  USE DWH_Project;
  ```
  
- Syntax Create DimCustomer:
  ```
  CREATE TABLE DimCustomer
  (
	CustomerID int CONSTRAINT PK_CustomerID PRIMARY KEY ,
	CustomerName varchar(50) NOT NULL,
	Age int,
	Gender varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	NoHp varchar (50) NOT NULL
  );
  ```
  
- Syntax Create DimProduct:
  ```
  CREATE TABLE DimProduct
  (
	ProductID int CONSTRAINT PK_ProductID PRIMARY KEY NOT NULL,
	ProductName varchar(255) NOT NULL,
	ProductCategory varchar (255) NOT NULL,
	ProductUnitPrice int NOT NULL,
  );
  ```
  
- Syntax Create DimStatusOrder:
  ```
  CREATE TABLE DimStatusOrder
  (
	StatusID int CONSTRAINT PK_StatusID PRIMARY KEY,
	StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar (50) NOT NULL,
  );
  ```
  
- Syntax Create FactSalesOrder:
  ```
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
  ```
  
## Hasil 3 Membuat Job ETL pada Talend Studio
1. Menghubungkan database Staging dan DWH_Project dengan Windows Authentication dengan menggunakan jtds-1.3.1.jar driver pada Talend Studio.
   
![Koneksi Database Staging via JTDS](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20Connection%20to%20DB%20in%20metadata%20Staging%20DB.png)

![Koneksi Database DWH_Project via JTDS](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20Connection%20to%20DB%20in%20metadata%202.png)

2. Melakukan retrieve schema untuk Database Staging dan DWH_Project.
   
![Retrieve Schema DWH_Project](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Retrieve%20Schema%20DWH_Project%20DB.png)

3. Membuat ETL untuk memindahkan data dari Staging ke DWH_Project pada Talend Studio.
   
![ETL Jobs pada Talend Studio](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Talend%20ETL.png)

4. Menerapkan Transformasi pada table DimCustomer dengan tools tMap.
   
![Transformasi dengan tMap](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Talend%20T%20Map.png)

## Hasil 4
1. Membuat stored procedure untuk menampilkan summary sales order berdasarkan status order pada SSMS. Untuk membuat syntax lebih clean, diterapkan pula alias pada table.
Syntax Stored Procedure:
```
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
```

2. Mengeksekusi stored procedure dengan dua nilai (StatusID = 3 & 2).
   
![Eksekusi Stored Procedure StatusID = 3](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Stored%20Procedure%20Status%20ID%3D3.png)

![Eksekusi Stored Procedure StatusID = 2](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Stored%20Procedure%20Status%20ID%20%3D%202.png)

# Terima Kasih
