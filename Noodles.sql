-- LIST DATABASE
SHOW DATABASES;

-- CREATE DATABASE
CREATE DATABASE noodles;

-- CHOOSE DATABASE
USE noodles;

-- LIST TABLES
SHOW TABLES;

-- CREATE TABLE
-- Products
CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY, -- AUTO_INCREMENT, nilainya terus bertambah secara otomatis ketika ada data baru masuk.
    variant VARCHAR(30),
    price DECIMAL(3, 2), -- tiga digit total dan dua digit di belakang koma, 2.00, 3.14, 2.25 , 4.16
    -- DECIMAL(5,2) maka digit maksimal yang dapat disimpan adalah 5 , artinya bisa menyimpan digit dibawah itu, contoh 1.45 , 23.88 , 765.89 , tidak bisa jika nilai seperti ini 1453.66 (total digitnya 6)
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
    -- saat id pada product mengalami perubahan, maka product_id pada orders akan ikut berubah. saat id product dihapus, product_id pada orders akan di set null
    CONSTRAINT FK_ProductId FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE SET NULL,
    -- kolom 'customer_id' merupakan foreign key, dimana dia 'nge-link' ke kolom 'id' yang ada di table 'customers'
	CONSTRAINT FK_CustomerId FOREIGN KEY (customer_id) REFERENCES customers(id) ON UPDATE CASCADE ON DELETE SET NULL
);

-- ################
-- # CONFIG TABLE #
-- ################

-- DESKRIPSI TABLE / INFORMASI TABLE (jumlah kolum, nama beserta tipe data setiap kolum , dst)
DESC products;

-- ADD NEW COLUMN (Paling belakang)
-- Tambahkan kolom baru 'address' dan posisi di paling belakang
ALTER TABLE customers
ADD COLUMN address VARCHAR(20);

-- ADD NEW COLUMN (Tentukan posisi)
-- Tambahkan kolom baru 'age' dan posisi setelah kolom 'last_name'
ALTER TABLE customers
ADD COLUMN age INT
AFTER last_name;

-- RENAME COLUMN
-- Ubah nama kolom 'address' menjadi 'alamat'
ALTER TABLE customers
CHANGE address alamat VARCHAR(20);

-- DELETE COLUMN
ALTER TABLE customers
DROP COLUMN alamat;

ALTER TABLE customers
DROP COLUMN age;

-- ###########
-- # C R U D #
-- ###########

-- CREAT DATA
-- ##########

-- Penyebutan nama kolom tidak harus berurut seperti pada table
-- Yang harus diperhatikan adalah urutan kolom dengan urutan data yang di input
INSERT INTO products (variant, price, origin) VALUES ('Mi Goreng', 2.50, 'Indonesia');

INSERT INTO products (origin, variant, price) VALUES ('Aceh', 'Mi Goreng Aceh', 3.00);

-- Dapat input data lebih dari 1 dalam sekali input
INSERT INTO products (variant, price, origin)
VALUES	('Soto Banjar', 3.50, 'Banjar'),
		('Soto Banjar Limau Kulit', 3.60, 'Banjar'),
		('Mi Cakalang', 3.50, 'Manado'),
        ('Mi Goreng Cakalang',3.00,'Manado'),
		('Empal Gentong',3.50,'Betawi'),
		('Soto Betawi',3.00,'Betawi'),
		('Mi Kocok Bandung',3.00,'Bandung'),
		('Soto Medan', 2.30,'Medan'),
		('Kari Ayam Medan', 2.50,'Medan'),
		('Bulgogi', 4.20, 'Korea'),
		('Laksa', 4.00, 'Singapore'),
		('Tomyum', 3.80, 'Thailand');
	
DESC customers;
INSERT INTO customers (first_name, last_name, gender, phone_number)
VALUES ('Hinata','Shoyo','M','01123147789'),
('Elon','Musk','F','01123439899'),('Mark','Zuckerberg','M','01174592013'),
('Leonardo','Davinci','M',NULL),('Sarah','Teressa','F','01176348290'),
('Neil','Armstrong','F','01145787353'),('Michael','Jordan','M','01980289282'),
('Daily','Nash','F','01176987789'),('Max','Jordan','M','01173456782'),
('Senku',NULL,'F','01139287883'),('Linda','Jordan','F','01176923804'),
('Kevin','Hard','M',NULL),('John','Smith','M','01174987221'),
('John','Teressa','M',NULL),('Elon','Smith','F','01176984116'),('Gob','Jordan','M','01176985498'),
('George','Jordan','M','01176984303'),('Lucian','Jordan','F','01198773214'),
('George','Evans','M','01174502933'),('Emily','Sinek','F','01899284352'),
('Steph','Smith','M','01144473330'),('Jennifer',NULL,'F',NULL),
('Toby','Wan','M','01176009822'),('Paul','London','M','01966947113');

INSERT INTO orders (product_id,customer_id,order_time) VALUES (1,1,'2017-01-01 08-02-11'),(1,2,'2017-01-01 08-05-16'),
(5,12,'2017-01-01 08-44-34'),(3,4,'2017-01-01 09-20-02'),
(1,9,'2017-01-01 11-51-56'),(6,22,'2017-01-01 13-07-10'),
(1,1,'2017-01-02 08-03-41'),(3,10,'2017-01-02 09-15-22'),
(2,2,'2017-01-02 10-10-10'),(3,13,'2017-01-02 12-07-23'),
(1,1,'2017-01-03 08-13-50'),(7,16,'2017-01-03 08-47-09'),
(6,21,'2017-01-03 09-12-11'),(5,22,'2017-01-03 11-05-33'),
(4,3,'2017-01-03 11-08-55'),(3,11,'2017-01-03 12-02-14'),
(2,23,'2017-01-03 13-41-22'),(1,1,'2017-01-04 08-08-56'),
(3,10,'2017-01-04 11-23-43'),(4,12,'2017-01-05 08-30-09'),
(7,1,'2017-01-06 09-02-47'),(3,18,'2017-01-06 13-23-34'),
(2,16,'2017-01-07 09-12-39'),(2,14,'2017-01-07 11-24-15'),
(4,5,'2017-01-08 08-54-11'),(1,1,'2017-01-09 08-03-11'),
(6,20,'2017-01-10 10-34-12'),(3,3,'2017-01-10 11-02-11'),
(4,24,'2017-01-11 08-39-11'),(4,8,'2017-01-12 13-20-13'),
(1,1,'2017-01-14 08-27-10'),(4,15,'2017-01-15 08-30-56'),
(1,7,'2017-01-16 10-02-11'),(2,10,'2017-01-17 09-50-05'),
(1,1,'2017-01-18 08-22-55'),(3,9,'2017-01-19 09-00-19'),
(7,11,'2017-01-19 11-33-00'),(6,12,'2017-01-20 08-02-21'),
(3,14,'2017-01-21 09-45-50'),(5,2,'2017-01-22 10-10-34'),
(6,24,'2017-01-23 08-32-19'),(6,22,'2017-01-23 08-45-12'),
(6,17,'2017-01-23 12-45-30'),(2,11,'2017-01-24 08-01-27'),
(1,1,'2017-01-25 08-05-13'),(6,11,'2017-01-26 10-49-10'),
(7,3,'2017-01-27 09-23-57'),(7,1,'2017-01-27 10-08-16'),
(3,18,'2017-01-27 10-13-09'),(4,19,'2017-01-27 11-02-40'),
(3,10,'2017-01-28 08-03-21'),(1,2,'2017-01-28 08-33-28'),
(1,12,'2017-01-28 11-55-33'),(1,13,'2017-01-29 09-10-17'),
(6,6,'2017-01-30 10-07-13'),(1,1,'2017-02-01 08-10-14'),
(2,14,'2017-02-02 10-02-11'),(7,10,'2017-02-02 09-43-17'),
(7,20,'2017-02-03 08-33-49'),(4,21,'2017-02-04 09-31-01'),
(5,22,'2017-02-05 09-07-10'),(3,23,'2017-02-06 08-15-10'),
(2,24,'2017-02-07 08-27-26'),(1,1,'2017-02-07 08-45-10'),
(6,11,'2017-02-08 10-37-10'),(3,13,'2017-02-09 08-58-18'),
(3,14,'2017-02-10 09-12-40'),(5,4,'2017-02-10 11-05-34'),
(1,2,'2017-02-11 08-00-38'),(3,8,'2017-02-12 08-08-08'),
(7,20,'2017-02-12 09-22-10'),(1,1,'2017-02-13 08-37-45'),
(5,2,'2017-02-13 12-34-56'),(4,3,'2017-02-14 08-22-43'),(5,4,'2017-02-14 09-12-56'),(3,5,'2017-02-15 08-09-10'),(6,7,'2017-02-15 09-05-12'),(1,8,'2017-02-15 09-27-50'),(2,9,'2017-02-16 08-51-12'),(3,10,'2017-02-16 13-07-46'),(4,11,'2017-02-17 08-03-55'),(4,12,'2017-02-17 09-12-11'),(5,10,'2017-02-17 11-41-17'),(6,18,'2017-02-17 13-05-56'),(7,19,'2017-02-18 08-33-27'),(1,17,'2017-02-19 08-12-31'),(1,1,'2017-02-20 09-50-17'),(3,5,'2017-02-20 09-51-29'),(4,6,'2017-02-20 10-43-39'),(3,1,'2017-02-21 08-32-17'),(1,1,'2017-02-21 10-30-11'),(3,2,'2017-02-21 11-08-45'),(4,3,'2017-02-22 11-46-32'),(2,15,'2017-02-22 13-35-16'),(6,13,'2017-02-23 08-34-48'),(4,24,'2017-02-24 08-32-03'),(2,13,'2017-02-25 08-03-12'),(7,17,'2017-02-25 09-34-23'),(7,23,'2017-02-25 11-32-54'),(5,12,'2017-02-26 11-47-34'),
(6,4,'2017-02-27 12-12-34'),(1,1,'2017-02-28 08-59-22');

-- UPDATE DATA
-- ##############

-- UPDATE table_name
-- SET column_name = new_value
-- WHERE conditions;

-- Mode : Safe Update pada workbench menyebabkan kita harus menggunakan kolom KEY (PRIMARY, FOREIGN) pada saat update menggunakan WHERE.
-- Kita akan non-aktifkan mode ini untuk bisa menggunakan kolom lainnya pada WHERE.
SET SQL_SAFE_UPDATES = 0;

-- Ubah nilai origin menjadi Jakarta untuk product yang memiliki id = 7
UPDATE products
SET origin = 'Jakarta'
WHERE id = 7;
-- Ubah nilai harga dan origin untuk produk bernama Soto Banjar
UPDATE products
SET price = 3.25, origin = 'Jakarta'
WHERE variant = 'Mi Goreng';
-- Ubah nilai origin untuk produk yang berasal dari Jakarta
UPDATE products
SET origin = 'DKI'
WHERE origin = 'Jakarta';

UPDATE products SET origin = NULL where variant = 'Tomyum';

-- DELETE DATA
-- ##############
SELECT * FROM products;
-- Hapus mi yang berasal dari Aceh
DELETE FROM products
WHERE origin = 'Aceh';

-- Hapus semua data mi
DELETE FROM products;

-- READ DATA
-- ############

-- Tampilkan semua kolom dari tabel products
SELECT * FROM products; 

-- Tampilkan kolom variant dan asal dari tabel products
SELECT variant, origin FROM products;

-- AND
-- Tampilkan data yang memiliki harga 3.50 dan berasal dari Banjar
SELECT * FROM products
WHERE price = 3.50 AND origin = 'Banjar';

-- OR
-- Tampilkan data yang memiliki harga 3.00 atau berasal dari Colombia
SELECT * FROM products
WHERE price = 3.00 OR origin = 'Manado';

-- INEQUALITY (>, <, >=, <=, !=)
-- Tampilkan product yang harganya kurang dari sama dengan 3;

WHERE price <= 3.00;

-- Tampilkan product yang tidak memiliki asal, atau origin is null
SELECT * FROM products
WHERE origin IS NULL;

-- Tampilkan product yang memiliki asal (origin) dan harganya 3.00
SELECT * FROM products
WHERE origin IS NOT NULL AND price = 3.00;

SELECT * FROM products;

-- EXERCISE
-- ########
-- Tampilkan nama depan dan nomor handphone untuk perempuan yang memiliki nama belakang = Jordan
SELECT first_name, phone_number FROM customers WHERE gender = 'F' AND last_name = 'Jordan';
-- Tampilkan nama product yang memiliki harga lebih besar dari 3.50 atau berasal dari Medan
SELECT variant FROM products WHERE price > 3.50 OR origin = 'Medan';
-- Tampilkan semua kolom untuk laki - laki yang tidak memiliki nomor handphone
SELECT * FROM customers WHERE gender = 'M' AND phone_number IS NULL;
-- Tampilkan semua kolom untuk customer yang memiliki nama belakang antara 'George', 'Jordan', 'Armstrong';
SELECT * FROM customers WHERE last_name = 'Smith' OR last_name = 'Jordan' OR last_name = 'Armstrong';


-- IN
-- ##
-- Solusi OR yang banyak
-- Tampilkan semua kolom untuk customer yang memiliki nama belakang antara 'Smith', 'Jordan', 'Armstrong';
SELECT * FROM customers WHERE last_name IN ('Smith', 'Jordan', 'Armstrong');

-- NOT IN
-- ######
-- Tampilkan semua kolom untuk customer yang nama belakangnya selain 'Smith' 'Jordan', 'Armstrong';
SELECT * FROM customers WHERE last_name != 'Smith' AND last_name != 'Jordan' AND last_name != 'Armstrong';
SELECT * FROM customers WHERE last_name NOT IN ('Smith', 'Jordan', 'Armstrong');

-- BETWEEN
-- #######
-- Tampikan id produk, id customer tanggal order untuk tanggal order dari 1 sampai 7 januari
SELECT product_id, customer_id, order_time
FROM orders
WHERE order_time BETWEEN '2017-01-01' AND '2017-01-07 23:59:59';

-- Tampilkan id produk, id customer tanggal order untuk customer yang memiliki id antara 5 sampai 11
SELECT product_id, customer_id, order_time
FROM orders
WHERE customer_id BETWEEN 5 AND 11;

-- LIKE (case insensitive)
-- % , karakter apapun , dan berapapun
-- _ , krakter apapun, satu karakter
 
-- Customer yang memiliki huruf o, sebelum dan sesudah huruf o boleh ada karakter apapun dan berapapun
SELECT *  FROM customers
WHERE first_name LIKE '%o%';
-- Customer yang memiliki huruf o, sebelum dan sesudah huruf o hanya boleh ada satu karakter apapun
SELECT *  FROM customers
WHERE first_name LIKE '_o_';
-- Customer yang memiliki huruf o, sebelum huruf hanya ada boleh satu karakter dan sesudah huruf o  boleh ada berapapun karakter
SELECT *  FROM customers
WHERE first_name LIKE '_o%';
-- Customer yang memiliki huruf o, sebelum  huruf o boleh ada karakter berapapun namun hanya ada 1 karakter di belakang
SELECT *  FROM customers
WHERE last_name LIKE '%o_';
-- Customer yang nama belakangnya memiliki huruf terakhir s ,
SELECT *  FROM customers
WHERE last_name LIKE '%s';
-- Customer yang nama belakangnya memiliki huruf awal W ,
SELECT *  FROM customers
WHERE last_name LIKE 'W%';

-- ORDER BY
-- ########
-- Mengurutkan data berdasarkan kolom tertentu
-- ASC / ASCENDING : kecil ke besar (default)
-- DESC / DESCENDING : besar ke kecil

-- Mengurutkan produk berdasarkan harga
SELECT * FROM products
ORDER BY price;

SELECT * FROM products
ORDER BY price DESC;

-- Mengurutkan data berdasarkan nama
SELECT * FROM products
ORDER BY name;

SELECT * FROM orders
WHERE customer_id = 4
ORDER BY order_time DESC;

SELECT * FROM products;

-- Tampilkan nama produk dan harga untuk semua product yang berasal dari DKI atau Manado
SELECT variant, price, origin FROM products WHERE origin IN ('DKI', 'Manado');

-- Tampilkan semua kolom untuk order yang terjadi pada bulan februari untuk costumer dengan id 2 , 4, 6, 8
SELECT * FROM orders WHERE order_time LIKE '2017-02-%' AND customer_id IN (2, 4, 6, 8) ORDER BY order_time;
SELECT * FROM orders WHERE MONTH(order_time) = 2 AND customer_id IN (2, 4, 6, 8) ORDER BY order_time;

-- Tampilkan nama depan, nama belakang, nomor tlp untuk customer yang nama belakang mengandung huruf 'ar'
SELECT first_name, last_name, phone_number FROM customers WHERE last_name LIKE '%ar%';

-- DISTINCT
-- ########
-- Menampilkan data secara unique

-- Satu kolom
SELECT DISTINCT origin FROM products;

-- Ubah harga soto banjang menjadi 3.6 untuk menampilkan nilai 3.6 dan Banjar hanya muncul satu kali
-- Lebih dari satu kolom
SELECT DISTINCT price, origin FROM products WHERE price >= 2.60 ORDER BY price;

-- LIMIT & OFFSET
-- ##############
-- LIMIT : Membatasi jumlah data
-- OFFSET : Skip data

SELECT id, variant from products LIMIT 3; -- Mi Goreng, Soto Banjar, Soto Banjar Limau Kulit

SELECT id, variant from products LIMIT 3 OFFSET 2; -- Soto Banjar Limau Kulit, Mi Cakalang, Mi Goreng Cakalang

-- ALIAS
-- #####
-- Mengubah nama kolom saat ditampilkan

SELECT variant AS Rasa, price AS `Harga 2019`, ROUND(price + (price * 0.1), 2)  AS `Harga 2020` FROM products;

SELECT variant Rasa, price Harga, origin Asal FROM products;

-- Only on Mysql, not standard SQL, PostgreSQL cant do this.
SELECT name `Nama`, price `Harga`, origin `Asal` FROM products;

SELECT ROUND(3.75595747393, 2); -- 3.76

-- Exercise
-- Tampilkan semua kolom untuk 3 order pertama yang dilakukan oleh customer dengan id 4
SELECT * FROM orders WHERE customer_id = 4 LIMIT 3;

-- Tampilkan product id berapa saja yang berhasil terjual pada bulan februari
SELECT DISTINCT product_id FROM orders WHERE MONTH(order_time) = 2 ORDER BY product_id;

-- Tampilkan semua kolom untuk orderan terakhir yang dilakukan oleh customer dengan id 4
SELECT * FROM orders WHERE customer_id = 4 ORDER BY order_time DESC LIMIT 1;


-- JOIN : INNER | LEFT (OUTER) | RIGHT (OUTER) | FULL (OUTER)
-- ####
-- Menggabungkan tabel untuk mendapatkan informasi yang lebih lengkap

-- 1 , 3, 4, 5, 6, 7
-- SELECT * FROM orders;
-- Tampilkan product yang belum pernah di order 
-- SELECT * FROM products WHERE id NOT IN (SELECT DISTINCT product_id FROM orders WHERE product_id IS NOT NULL );
-- SELECT DISTINCT product_id FROM orders;
-- SELECT * FROM products JOIN orders ON products.id = orders.product_id;

-- Menampilkan nama produk dan waktu order
-- Urutan akan mengikuti table yang pertama disebut yaitu products
SELECT products.id, variant, order_time
FROM products
JOIN orders ON products.id = orders.product_id;

-- Join kemudian di Limit
SELECT variant, order_time
FROM products
JOIN orders ON products.id = orders.product_id
WHERE variant = 'Mi Cakalang' LIMIT 4;

-- Join menggunakan Alias
SELECT variant `Rasa`, order_time `Waktu Pemesanan`
FROM products
JOIN orders ON products.id = orders.product_id
WHERE variant = 'Mi Cakalang' LIMIT 4;

-- Alias table dengan satu huruf atau lebih
SELECT p.variant, o.order_time
FROM products p
JOIN orders o ON p.id = o.customer_id;

-- Tampilkan semua product berserta informasi ordernya.
SELECT products.id, variant, order_time
FROM products
LEFT JOIN orders ON products.id = orders.product_id;

-- Tampilkan semua orderan beserta informasi productnya.
SELECT products.id, variant, order_time
FROM products
RIGHT JOIN orders ON products.id = orders.product_id;

-- INNER JOIN MORE THAN TWO TABLES
-- ###############################

-- Join tiga tabel
SELECT 
	o.id, 
    c.first_name, c.gender,
    p.variant, 
    o.order_time
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN products p ON p.id = o.product_id;

-- Join tiga tabel + alias + kolom baru (Ppn)
SELECT 
	o.id `No Antrian`, 
    c.first_name `Nama`, c.gender `Jenis Kelamin`,
    p.variant `Pesanan`, p.price `Harga`, ROUND(p.price + (p.price * 0.025), 2) `Plus PPN`,
    o.order_time `Waktu Pemesanan`
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN products p ON p.id = o.product_id;

-- Join tiga tabel + alias + kolom baru + Where
SELECT 
	o.id `No Antrian`, 
    c.first_name `Nama`, c.gender `Jenis Kelamin`,
    p.variant `Pesanan`, p.price `Harga`, ROUND(p.price + (p.price * 0.025), 2) `Plus PPN`,
    o.order_time `Waktu Pemesanan`
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN products p ON p.id = o.product_id
WHERE c.first_name = 'Hinata' LIMIT 3;

-- Tampilkan Order id, First name, Last name, phone number, untuk yang customer yang membeli Soto Banjar
SELECT 
	o.id , 
	c.first_name, c.last_name, c.phone_number
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN products p ON p.id = o.product_id
WHERE p.variant = 'Soto Banjar';

-- Tampilkan nama variant dan waktu order untuk Mi Cakalang yang terjual antara 15 januari hingga 14 februari
SELECT 
	p.variant,
    o.order_time
FROM products p
JOIN orders o ON p.id = o.product_id
WHERE p.variant = 'Mi Cakalang' AND o.order_time BETWEEN '2017-01-15' AND '2017-02-15 23:59:59';

-- Tampilkan Nama Produk, Harga, Waktu Order, yang di beli oleh perempuan, penjualan 15 januari - 14 februari di urutkan berdasarkan waktu order
SELECT 
	p.variant, p.price,
    o.order_time
FROM products p
JOIN orders o ON p.id = o.product_id
JOIN customers c ON c.id = o.customer_id
WHERE c.gender = 'F' AND o.order_time BETWEEN '2017-01-15' AND '2017-02-15 23:59:59';
