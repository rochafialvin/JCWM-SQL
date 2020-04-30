-- Pilih database
use cinema_booking_system;

-- Membuat ER Diagram (melihat skema hubungan antar tabel)
-- Database > Reverse Engineer >Next > Masukkan Password > Next > Ceklis database yang ingin dibuat ER Diagramnya 
-- > Next > Next > Execute > Next > Finish > ER Diagram berhasil dibuat

-- Menyimpan ER Diagram ke PNG
-- File > Export > Export as PNG

select * from customers ;

-- Aggregate Function
-- COUNT , SUM, MIN, MAX, AVG

-- Jumlah customer
SELECT COUNT(*) FROM customers;

-- Jumlah customer yang memiliki nama depan / Banyaknya data pada kolom 'first_name'
SELECT COUNT(first_name) FROM customers;

-- Jumlah customer yang tidak memiliki nama depan / Banyaknya data pada kolom 'first_name' yang kosong (null)
SELECT COUNT(last_name) FROM customers WHERE first_name IS NULL;

-- Durasi film terlama
SELECT MAX(length_min) FROM films;

-- Durasi film tercepat
SELECT MIN(length_min) FROM films;

-- Hasil akumulasi jumlah bangku dari seluruh ruangan
SELECT SUM(no_seats) FROM rooms;

-- Rata - rata durasi film
SELECT AVG(length_min) FROM films;
-- Rata - rata durasi film (dua angka di belakang koma)
SELECT ROUND(AVG(length_min), 2) FROM films;














