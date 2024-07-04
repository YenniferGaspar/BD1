CREATE DATABASE VR;
USE VR;

CREATE TABLE category (
    id int  NOT NULL,
    name varchar(60)  NULL,
    description text  NULL,
    CONSTRAINT category_pk PRIMARY KEY (id)
) COMMENT 'data will be stored here category';

-- Table: customer
CREATE TABLE customer (
    ID int  NOT NULL,
    name varchar(80)  NULL,
    ddress varchar(80)  NULL,
    telephone char(9)  NULL,
    supplier_ruc int  NOT NULL,
    supplier_2_ruc varchar(20)  NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (ID)
) COMMENT 'data will be stored here customer';

-- Table: product
CREATE TABLE product (
    code int  NOT NULL,
    name varchar(80)  NULL,
    price decimal(10,2)  NULL,
    category_id int  NOT NULL,
    supplier_ruc varchar(20)  NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (code)
) COMMENT 'data will be stored here product';

-- Table: sale
CREATE TABLE sale (
    ID int  NOT NULL,
    date date  NULL,
    final_amount decimal(10,2)  NULL,
    customer_ID int  NOT NULL,
    CONSTRAINT sale_pk PRIMARY KEY (ID)
) COMMENT 'Sales information will be saved here';

-- Table: saleDetail
CREATE TABLE saleDetail (
    quantity int  NOT NULL,
    price decimal(10,2)  NULL,
    sale_ID int  NOT NULL,
    product_code int  NOT NULL,
    CONSTRAINT saleDetail_pk PRIMARY KEY (quantity)
) COMMENT 'Sales informationDetail will be saved here';

-- Table: supplier
CREATE TABLE supplier (
    ruc varchar(20)  NOT NULL,
    names varchar(80)  NULL,
    address varchar(80)  NULL,
    phone char(9)  NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (ruc)
) COMMENT 'data will be stored here supplier';

-- foreign keys
-- Reference: customer_supplier (table: customer)
ALTER TABLE customer ADD CONSTRAINT customer_supplier FOREIGN KEY customer_supplier (supplier_2_ruc)
    REFERENCES supplier (ruc);

-- Reference: product_category (table: product)
ALTER TABLE product ADD CONSTRAINT product_category FOREIGN KEY product_category (category_id)
    REFERENCES category (id);

-- Reference: product_supplier (table: product)
ALTER TABLE product ADD CONSTRAINT product_supplier FOREIGN KEY product_supplier (supplier_ruc)
    REFERENCES supplier (ruc);

-- Reference: saleDetail_product (table: saleDetail)
ALTER TABLE saleDetail ADD CONSTRAINT saleDetail_product FOREIGN KEY saleDetail_product (product_code)
    REFERENCES product (code);

-- Reference: saleDetail_sale (table: saleDetail)
ALTER TABLE saleDetail ADD CONSTRAINT saleDetail_sale FOREIGN KEY saleDetail_sale (sale_ID)
    REFERENCES sale (ID);

-- Reference: sale_customer (table: sale)
ALTER TABLE sale ADD CONSTRAINT sale_customer FOREIGN KEY sale_customer (customer_ID)
    REFERENCES customer (ID);

-- End of file.

