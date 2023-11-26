# PBI-IDX-Data_Engineering

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
