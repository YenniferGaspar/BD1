USE VR;

INSERT INTO category (id, name, description)
VALUES
    (1, 'Electronics', 'Electronic devices and components'),
    (2, 'Clothing', 'Fashion and apparel'),
    (3, 'Books', 'Literature and educational material'),
    (4, 'Home Appliances', 'Household electronic appliances'),
    (5, 'Sports', 'Sports equipment and accessories');

INSERT INTO customer (ID, name, address, telephone, supplier_ruc, supplier_2_ruc)
VALUES
    (1, 'John Doe', '123 Main St, Anytown', '123456789', 12345, 'A123'),
    (2, 'Jane Smith', '456 Oak Ave, Anycity', '987654321', 54321, 'B456'),
    (3, 'Michael Johnson', '789 Elm Blvd, Anystate', '456789012', 67890, 'C789'),
    (4, 'Emily Davis', '321 Pine Dr, Anymunicipality', '345678901', 24680, 'D246'),
    (5, 'Chris Wilson', '555 Maple Ln, Anycountry', '901234567', 13579, 'E135');


INSERT INTO product (code, name, price, category_id, supplier_ruc)
VALUES
    (101, 'Smartphone', 599.99, 1, 'A123'),
    (102, 'Laptop', 999.99, 1, 'B456'),
    (103, 'T-shirt', 19.99, 2, 'C789'),
    (104, 'Book: Introduction to Programming', 49.99, 3, 'D246'),
    (105, 'Microwave Oven', 129.99, 4, 'E135');

INSERT INTO sale (ID, date, final_amount, customer_ID)
VALUES
    (1, '2024-06-30', 799.98, 1),
    (2, '2024-07-01', 1119.98, 2),
    (3, '2024-07-02', 19.99, 3),
    (4, '2024-07-03', 49.99, 4),
    (5, '2024-07-04', 129.99, 5);


INSERT INTO saleDetail (quantity, price, sale_ID, product_code)
VALUES
    (2, 1199.98, 1, 101),
    (1, 999.99, 2, 102),
    (3, 59.97, 3, 103),
    (1, 49.99, 4, 104),
    (1, 129.99, 5, 105);

INSERT INTO supplier (ruc, names, address, phone)
VALUES
    ('A123', 'ElectroTech Inc.', '123 Tech St, Techcity', '987654321'),
    ('B456', 'Gadgets World Ltd.', '456 Gadget Ave, Gadgettown', '123456789'),
    ('C789', 'Fashion Trends LLC', '789 Fashion Blvd, Fashioncity', '456789012'),
    ('D246', 'Bookworm Enterprises', '246 Book Dr, Bookville', '901234567'),
    ('E135', 'Home Appliances Co.', '135 Home Ln, Homestate', '345678901');

