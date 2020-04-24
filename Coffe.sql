-- LIST DATABASE
SHOW DATABASES;

-- CREATE DATABASE
CREATE DATABASE coffe_store;

-- CHOOSE DATABASE
USE coffe_store;

-- LIST TABLES
SHOW TABLES;

-- CREATE TABLE
-- Products
CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT, nilainya terus bertambah secara otomatis ketika ada data baru masuk.
    name VARCHAR(30),
    price DECIMAL(3, 2), -- 2.00, 3.14, 2.25 , 4.16
	origin VARCHAR(20)
);

-- Customers
CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender ENUM('M', 'F'), -- value yang boleh disimpan hanyalah 'M' atau 'F'
    phone_number VARCHAR(13)
);

-- Orders
CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    order_time DATETIME,
    -- kolom 'product_id' merupakan foreign key, dimana dia 'nge-link' ke kolom 'id' yang ada di table 'products'
    CONSTRAINT FK_ProductId FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE SET NULL,
    -- kolom 'customer_id' merupakan foreign key, dimana dia 'nge-link' ke kolom 'id' yang ada di table 'customers'
	CONSTRAINT FK_CustomerId FOREIGN KEY (customer_id) REFERENCES customers(id) ON UPDATE CASCADE ON DELETE SET NULL
);



-- #############
-- CONFIG TABLE#
-- #############

-- DESKRIPSI TABLE / INFORMASI TABLE (jumlah kolum, nama beserta tipe data setiap kolum , dst)
DESC customers;

-- ADD NEW COLUMN (Paling belakang)
-- Tambahkan kolom baru 'hobby' dan posisi di paling belakang
ALTER TABLE customers
ADD COLUMN hobby VARCHAR(20);

-- ADD NEW COLUMN (Tentukan posisi)
-- Tambahkan kolom baru 'age' dan posisi setelah kolom 'last_name'
ALTER TABLE customers
ADD COLUMN age INT
AFTER last_name;

-- RENAME COLUMN
-- Ubah nama kolom 'hobby' menjadi 'hobi'
ALTER TABLE customers
CHANGE hobby hobi VARCHAR(20);

-- DELETE COLUMN
ALTER TABLE customers
DROP COLUMN hobi;

ALTER TABLE customers
DROP COLUMN age;




-- #######
-- CRUD ##
-- #######

-- CREAT DATA
-- Penyebutan nama kolom tidak harus berurut seperti pada table
-- Yang harus diperhatikan adalah urutan kolom dengan urutan data yang di input
INSERT INTO products (name, price, origin) VALUES ('Espresso', 2.50, 'Brazil');

INSERT INTO products (origin, name, price) VALUES ('Brazil', 'Macchiato', 3.00);

-- Dapat input data lebih dari 1 dalam sekali input
INSERT INTO products (name, price, origin)
VALUES	('Cappuccino', 3.50, 'Costa Rica'),
		('Latte', 3.50, 'Indonesia'),
        ('Americano',3.00,'Brazil'),
		('Flat White',3.50,'Indonesia'),
		('Filter',3.00,'India');


-- READ DATA

-- Tampilkan semua kolom dari tabel products
SELECT * FROM products; 

-- Tampilkan kolom nama dan asal dari tabel products
SELECT name, origin FROM products;



















