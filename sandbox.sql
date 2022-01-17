USE noodles;

SHOW CREATE TABLE orders;

-- Mencari tahu perbedaan hari
SELECT order_time, DATEDIFF(CURRENT_DATE(), order_time ) AS Different FROM orders; 
-- Tanggal, waktu, tanggal dan waktu
SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP() ; 
-- Add Multiple column
ALTER TABLE orders
ADD  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
-- Delete Multiple column
ALTER TABLE orders
DROP  created_at ,
DROP updated_at ;


-- LATER SHOULD ADD THIS
-- Tampilkan pesanan yang dilakukan oleh customer dengan rentan usia 18 - 30 (Kita tidak memiliki column age).
SELECT * FROM orders o JOIN customers c ON o.customer_id = c.id
WHERE age BETWEEN 18 AND 30;

-- Selain dari top 10.
💘
