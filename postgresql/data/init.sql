-- Init the database with :
-- 20 customers
-- 15 products
-- 40 orders
-- 80 order_items

-- ============================================
-- CUSTOMERS
-- ============================================
INSERT INTO customers (first_name, last_name, email, created_at) VALUES
('Alice', 'Martin', 'alice.martin@example.com', '2024-01-12'),
('Bob', 'Johnson', 'bob.johnson@example.com', '2024-02-18'),
('Carla', 'Nguyen', 'carla.nguyen@example.com', '2024-03-03'),
('David', 'Lopez', 'david.lopez@example.com', '2024-03-22'),
('Emma', 'Schmidt', 'emma.schmidt@example.com', '2024-04-10'),
('Frank', 'Peters', 'frank.peters@example.com', '2024-04-18'),
('Grace', 'Kim', 'grace.kim@example.com', '2024-05-01'),
('Henry', 'Wilson', 'henry.wilson@example.com', '2024-05-14'),
('Isabelle', 'Rossi', 'isabelle.rossi@example.com', '2024-06-02'),
('Jack', 'Turner', 'jack.turner@example.com', '2024-06-18'),
('Karen', 'Sato', 'karen.sato@example.com', '2024-07-05'),
('Leo', 'Garcia', 'leo.garcia@example.com', '2024-07-20'),
('Maria', 'Fernandez', 'maria.fernandez@example.com', '2024-08-07'),
('Nathan', 'Brown', 'nathan.brown@example.com', '2024-08-22'),
('Olivia', 'Bianchi', 'olivia.bianchi@example.com', '2024-09-09'),
('Paul', 'Kovac', 'paul.kovac@example.com', '2024-09-23'),
('Quinn', 'Dupont', 'quinn.dupont@example.com', '2024-10-01'),
('Rita', 'Hassan', 'rita.hassan@example.com', '2024-10-16'),
('Steve', 'Wong', 'steve.wong@example.com', '2024-11-04'),
('Tina', 'Novak', 'tina.novak@example.com', '2024-11-19');



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
(1, '2025-01-01', 'completed'),
(2, '2025-01-03', 'completed'),
(3, '2025-01-05', 'completed'),
(4, '2025-01-07', 'completed'),
(5, '2025-02-09', 'completed'),
(6, '2025-02-11', 'canceled'),
(7, '2025-02-13', 'canceled'),
(8, '2025-03-15', 'canceled'),
(9, '2025-03-17', 'canceled'),
(10, '2025-03-19', 'canceled'),
(11, '2025-04-21', 'completed'),
(12, '2025-04-23', 'completed'),
(13, '2025-04-25', 'completed'),
(14, '2025-04-27', 'completed'),
(15, '2025-05-29', 'completed'),
(16, '2025-05-01', 'completed'),
(17, '2025-05-03', 'completed'),
(18, '2025-06-05', 'completed'),
(19, '2025-06-07', 'completed'),
(20, '2025-06-09', 'completed'),
(1, '2025-06-11', 'completed'),
(2, '2025-07-12', 'completed'),
(3, '2025-07-13', 'completed'),
(4, '2025-07-14', 'completed'),
(5, '2025-08-15', 'completed'),
(6, '2025-08-16', 'completed'),
(7, '2025-08-17', 'completed'),
(8, '2025-08-18', 'completed'),
(9, '2025-09-19', 'completed'),
(10, '2025-09-20', 'completed'),
(11, '2025-09-21', 'completed'),
(12, '2025-10-22', 'completed'),
(13, '2025-10-23', 'completed'),
(14, '2025-10-24', 'completed'),
(15, '2025-10-25', 'completed'),
(16, '2025-11-26', 'completed'),
(17, '2025-11-27', 'completed'),
(18, '2025-11-28', 'completed'),
(19, '2025-12-03', 'completed'),
(20, '2025-12-04', 'completed');



-- ============================================
-- ORDER ITEMS (80 items, 2 per order)
-- ============================================
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), (1, 5, 1),
(2, 8, 4), (2, 9, 2),
(3, 2, 2), (3, 15, 1),
(4, 3, 1), (4, 6, 3),
(5, 4, 1), (5, 10, 2),
(6, 11, 1), (6, 12, 1),
(7, 13, 3), (7, 9, 1),
(8, 7, 1), (8, 1, 1),
(9, 14, 2), (9, 5, 3),
(10, 3, 1), (10, 2, 4),
(11, 4, 1), (11, 15, 2),
(12, 6, 3), (12, 8, 1),
(13, 12, 1), (13, 10, 1),
(14, 3, 1), (14, 1, 2),
(15, 11, 1), (15, 13, 1),
(16, 5, 2), (16, 7, 1),
(17, 6, 4), (17, 2, 3),
(18, 9, 3), (18, 14, 2),
(19, 10, 1), (19, 15, 1),
(20, 4, 1), (20, 8, 1),
(21, 12, 1), (21, 7, 1),
(22, 3, 2), (22, 11, 4),
(23, 5, 3), (23, 9, 2),
(24, 6, 1), (24, 1, 1),
(25, 2, 1), (25, 13, 2),
(26, 10, 1), (26, 4, 3),
(27, 14, 4), (27, 15, 1),
(28, 7, 2), (28, 3, 1),
(29, 5, 1), (29, 2, 1),
(30, 8, 3), (30, 9, 1),
(31, 1, 1), (31, 11, 2),
(32, 13, 1), (32, 6, 1),
(33, 3, 1), (33, 14, 3),
(34, 12, 1), (34, 10, 1),
(35, 7, 2), (35, 4, 4),
(36, 8, 1), (36, 15, 1),
(37, 2, 1), (37, 6, 1),
(38, 5, 1), (38, 11, 2),
(39, 1, 1), (39, 12, 1),
(40, 3, 3), (40, 10, 1);