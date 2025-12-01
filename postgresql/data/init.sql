-- Init the database with :
-- 20 customers
-- 15 products
-- 40 orders
-- 80 order_items

-- ============================================
-- CUSTOMERS
-- ============================================
INSERT INTO customers (first_name, last_name, email, created_at) VALUES
('Alice', 'Martin', 'alice.martin@example.com', '2025-01-12'),
('Bob', 'Johnson', 'bob.johnson@example.com', '2025-02-18'),
('Carla', 'Nguyen', 'carla.nguyen@example.com', '2025-03-03'),
('David', 'Lopez', 'david.lopez@example.com', '2025-03-22'),
('Emma', 'Schmidt', 'emma.schmidt@example.com', '2025-04-10'),
('Frank', 'Peters', 'frank.peters@example.com', '2025-04-18'),
('Grace', 'Kim', 'grace.kim@example.com', '2025-05-01'),
('Henry', 'Wilson', 'henry.wilson@example.com', '2025-05-14'),
('Isabelle', 'Rossi', 'isabelle.rossi@example.com', '2025-06-02'),
('Jack', 'Turner', 'jack.turner@example.com', '2025-06-18'),
('Karen', 'Sato', 'karen.sato@example.com', '2025-07-05'),
('Leo', 'Garcia', 'leo.garcia@example.com', '2025-07-20'),
('Maria', 'Fernandez', 'maria.fernandez@example.com', '2025-08-07'),
('Nathan', 'Brown', 'nathan.brown@example.com', '2025-08-22'),
('Olivia', 'Bianchi', 'olivia.bianchi@example.com', '2025-09-09'),
('Paul', 'Kovac', 'paul.kovac@example.com', '2025-09-23'),
('Quinn', 'Dupont', 'quinn.dupont@example.com', '2025-10-01'),
('Rita', 'Hassan', 'rita.hassan@example.com', '2025-10-16'),
('Steve', 'Wong', 'steve.wong@example.com', '2025-11-04'),
('Tina', 'Novak', 'tina.novak@example.com', '2025-11-19');



-- ============================================
-- PRODUCTS
-- ============================================
INSERT INTO products (name, price, category) VALUES
('Wireless Mouse', 24.99, 'Electronics'),
('Mechanical Keyboard', 79.99, 'Electronics'),
('27-inch Monitor', 189.99, 'Electronics'),
('USB-C Hub', 39.99, 'Accessories'),
('Noise Cancelling Headphones', 129.99, 'Electronics'),
('Desk Lamp', 19.99, 'Home Office'),
('Office Chair', 149.99, 'Furniture'),
('Standing Desk', 299.99, 'Furniture'),
('Water Bottle', 12.99, 'Lifestyle'),
('Bluetooth Speaker', 49.99, 'Electronics'),
('Webcam HD', 59.99, 'Electronics'),
('Laptop Sleeve', 18.99, 'Accessories'),
('Portable SSD 1TB', 119.99, 'Electronics'),
('Smart Notebook', 28.99, 'Lifestyle'),
('Ergonomic Mousepad', 9.99, 'Accessories');



-- ============================================
-- ORDERS (40 fake orders)
-- customer_id references 1–20
-- ============================================
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2025-07-01', 'completed'),
(2, '2025-07-03', 'completed'),
(3, '2025-07-05', 'completed'),
(4, '2025-07-07', 'completed'),
(5, '2025-07-09', 'completed'),
(6, '2025-07-11', 'completed'),
(7, '2025-07-13', 'completed'),
(8, '2025-07-15', 'completed'),
(9, '2025-07-17', 'completed'),
(10, '2025-07-19', 'completed'),
(11, '2025-07-21', 'completed'),
(12, '2025-07-23', 'completed'),
(13, '2025-07-25', 'completed'),
(14, '2025-07-27', 'completed'),
(15, '2025-07-29', 'completed'),
(16, '2025-08-01', 'completed'),
(17, '2025-08-03', 'completed'),
(18, '2025-08-05', 'completed'),
(19, '2025-08-07', 'completed'),
(20, '2025-08-09', 'completed'),
(1, '2025-08-11', 'completed'),
(2, '2025-08-12', 'completed'),
(3, '2025-08-13', 'completed'),
(4, '2025-08-14', 'completed'),
(5, '2025-08-15', 'completed'),
(6, '2025-08-16', 'completed'),
(7, '2025-08-17', 'completed'),
(8, '2025-08-18', 'completed'),
(9, '2025-08-19', 'completed'),
(10, '2025-08-20', 'completed'),
(11, '2025-08-21', 'completed'),
(12, '2025-08-22', 'completed'),
(13, '2025-08-23', 'completed'),
(14, '2025-08-24', 'completed'),
(15, '2025-08-25', 'completed'),
(16, '2025-08-26', 'completed'),
(17, '2025-08-27', 'completed'),
(18, '2025-08-28', 'completed'),
(19, '2025-08-29', 'completed'),
(20, '2025-08-30', 'completed');



-- ============================================
-- ORDER ITEMS (80 items, 2 per order)
-- ============================================
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 24.99), (1, 5, 1, 129.99),
(2, 8, 1, 299.99), (2, 9, 2, 12.99),
(3, 2, 1, 79.99), (3, 15, 1, 9.99),
(4, 3, 1, 189.99), (4, 6, 1, 19.99),
(5, 4, 1, 39.99), (5, 10, 1, 49.99),
(6, 11, 1, 59.99), (6, 12, 1, 18.99),
(7, 13, 1, 119.99), (7, 9, 1, 12.99),
(8, 7, 1, 149.99), (8, 1, 1, 24.99),
(9, 14, 1, 28.99), (9, 5, 1, 129.99),
(10, 3, 1, 189.99), (10, 2, 1, 79.99),
(11, 4, 1, 39.99), (11, 15, 2, 9.99),
(12, 6, 1, 19.99), (12, 8, 1, 299.99),
(13, 12, 1, 18.99), (13, 10, 1, 49.99),
(14, 3, 1, 189.99), (14, 1, 1, 24.99),
(15, 11, 1, 59.99), (15, 13, 1, 119.99),
(16, 5, 1, 129.99), (16, 7, 1, 149.99),
(17, 6, 1, 19.99), (17, 2, 1, 79.99),
(18, 9, 3, 12.99), (18, 14, 1, 28.99),
(19, 10, 1, 49.99), (19, 15, 1, 9.99),
(20, 4, 1, 39.99), (20, 8, 1, 299.99),
(21, 12, 1, 18.99), (21, 7, 1, 149.99),
(22, 3, 1, 189.99), (22, 11, 1, 59.99),
(23, 5, 1, 129.99), (23, 9, 2, 12.99),
(24, 6, 1, 19.99), (24, 1, 1, 24.99),
(25, 2, 1, 79.99), (25, 13, 1, 119.99),
(26, 10, 1, 49.99), (26, 4, 1, 39.99),
(27, 14, 1, 28.99), (27, 15, 1, 9.99),
(28, 7, 1, 149.99), (28, 3, 1, 189.99),
(29, 5, 1, 129.99), (29, 2, 1, 79.99),
(30, 8, 1, 299.99), (30, 9, 1, 12.99),
(31, 1, 1, 24.99), (31, 11, 1, 59.99),
(32, 13, 1, 119.99), (32, 6, 1, 19.99),
(33, 3, 1, 189.99), (33, 14, 1, 28.99),
(34, 12, 1, 18.99), (34, 10, 1, 49.99),
(35, 7, 1, 149.99), (35, 4, 1, 39.99),
(36, 8, 1, 299.99), (36, 15, 1, 9.99),
(37, 2, 1, 79.99), (37, 6, 1, 19.99),
(38, 5, 1, 129.99), (38, 11, 1, 59.99),
(39, 1, 1, 24.99), (39, 12, 1, 18.99),
(40, 3, 1, 189.99), (40, 10, 1, 49.99);