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
- [Syntax Create database DWH_Project](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20DWH_Project%20Database.sql)
- [Syntax Create DimCustomer](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20DimCustomer%20table.sql)
- [Syntax Create DimProduct](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20DimProduct%20table.sql)
- [Syntax Create DimStatusOrder](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20DimStatusOrder%20table.sql)
- [Syntax Create FactSalesOrder](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20FactSalesOrder%20table.sql)

## Hasil 3 Membuat Job ETL pada Talend Studio
1. Menghubungkan database Staging dan DWH_Project dengan Windows Authentication dengan menggunakan jtds-1.3.1.jar driver pada Talend Studio.
![Koneksi Database Staging via JTDS](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20Connection%20to%20DB%20in%20metadata%20Staging%20DB.png)
![Koneksi Database DWH_Project via JTDS](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20Connection%20to%20DB%20in%20metadata%202.png)
2. Melakukan retrieve schema untuk Database Staging dan DWH_Project.
![Retrieve Schema DWH_Project](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Retrieve%20Schema%20DWH_Project%20DB.png)
3. Membuat ETL untuk memindahkan data dari Staging ke DWH_Project pada Talend Studio.
![ETL Jobs pada Talend Studio](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Talend%20ETL.png)
3. Menerapkan Transformasi pada table DimCustomer dengan tools tMap.
![Transformasi dengan tMap](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Talend%20T%20Map.png)

## Hasil 4
1. Membuat stored procedure untuk menampilkan summary sales order berdasarkan status order pada SSMS. Untuk membuat syntax lebih clean, diterapkan pula alias pada table.
[Syntax Stored Procedure](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Create%20Store%20Procedure.sql)
2. Mengeksekusi stored procedure dengan dua nilai (StatusID = 3 & 2).
![Eksekusi Stored Procedure StatusID = 3](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Stored%20Procedure%20Status%20ID%3D3.png)
![Eksekusi Stored Procedure StatusID = 2](https://github.com/Rizki-Kidut/PBI-IDX-Data_Engineering/blob/99ea671604b7b8a0e49453c00242a26ab27aa9d2/Stored%20Procedure%20Status%20ID%20%3D%202.png)

# Terima Kasih
