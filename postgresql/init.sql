CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    subscription_plan TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    price NUMERIC(10,2),
    category TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT NOW(),
    status TEXT
);

CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

CREATE TABLE shipments (
    shipment_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_id INT REFERENCES orders(order_id),
    shipped_date  TIMESTAMP DEFAULT NOW(),
    delivery_date  TIMESTAMP DEFAULT NOW(),
    carrier TEXT
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_id INT REFERENCES orders(order_id),
    amount NUMERIC(10,2),
    payment_method TEXT,
    payment_date  TIMESTAMP DEFAULT NOW()
);