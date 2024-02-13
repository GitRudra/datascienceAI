/*
 * Copyright (c) 2024 Workspot, Inc. All rights reserved.
 */

create table customerbase(
    customer_id int,
customer_name varchar(100),
phoneno varchar(100),
customer_email varchar(100)
);

create table product_category
(category_id varchar(10),
category_desc varchar(100))


create TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    price DECIMAL(10, 2),
	cat_id varchar(10),
	green_dot varchar(10)
);

create TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
	customer_id int,
	delivery_fee int,
    FOREIGN KEY (product_id) REFERENCES Products (product_id)
);


select AVG(quantity), sale_date from Sales
GROUP BY sale_date


CREATE VIEW vw_product_sale AS
SELECT
pc.category_id,
pc.category_desc,
p.product_id,
p.name as product_name,
p.description as product_description,
p.price as product_price,
p.green_dot as green_dot,
s.sale_id,
-- s.product_id as product_id,
s.sale_date as sale_date,
s.quantity as quantity,
s.quantity * p.price as sale_amnt
s.delivery_fee as delivery_fee
from Sales s
left join Products p ON (s.product_id = p.product_id)
left join product_category pc on (p.cat_id = pc.category_id)