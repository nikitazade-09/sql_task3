Create table flower_product(
Product_id serial primary key,
Product_name varchar not null,
price numeric not null,
Stock_quantity int not null,
flower_type VARCHAR NOT NULL 
       CONSTRAINT ck_valid_flower_type 
        CHECK (flower_type IN ('Rose', 'Lily', 'Tulip', 'Orchid', 'Sunflower', 'Mixed', 'Other'))
);

Select * from Flower_product;

INSERT INTO public.flower_product(
product_id,product_name,price,stock_quantity,flower_type)
	VALUES (1,'Classic Dozen Red Roses', 59.99, 120, 'Rose');

Select * from Flower_product;

-- update

select price from Flower_product where product_id = 5;

update Flower_product set price = 25.18 where product_id = 5;

Select * from Flower_product;

-- alter

Select * from Flower_product;

alter table Flower_product add column Address varchar[];

-- order by
-- offset
-- limit

Select * from Flower_product order by product_id asc;

Select flower_type, price from Flower_product order by product_id asc offset 100 limit 100;

--count
-- group by

select * from Flower_product;

select count(product_id) from Flower_product;

select distinct product_name from Flower_product;

select count(product_id), product_name from Flower_product group by product_name;

-- sum
-- min
-- max
-- avg

select * from Flower_product;

select sum(price) from Flower_product;

select min(price) from Flower_product;

select max(price) from Flower_product;

select avg(price) from Flower_product;

CREATE TABLE fruit_product (
    Product_id SERIAL PRIMARY KEY,
    fruit_name VARCHAR NOT NULL UNIQUE,
    category VARCHAR NOT NULL,
        CONSTRAINT ck_valid_fruit_category
        CHECK (category IN ('Berry', 'Citrus', 'Stone Fruit', 'Tropical', 'Melon', 'Pome')),
    price int NOT NULL,
    storage VARCHAR(100)  -- **Added a data type (VARCHAR(100))**
);

select * from fruit_product;

select price from fruit_product where product_id = 5;

update fruit_product set price = 25.18 where product_id = 5;

Select * from fruit_product;

-- alter

Select * from fruit_product;

alter table fruit_product add column country varchar[];

-- order by
-- offset
-- limit

Select * from fruit_product order by product_id asc;

Select price from fruit_product order by product_id asc offset 100 limit 100;

--count
-- group by

select * from fruit_product;

select count(product_id) from fruit_product;

select distinct fruit_name from fruit_product;

select count(product_id), fruit_name from fruit_product group by fruit_name;

-- sum
-- min
-- max
-- avg

select * from fruit_product;

select sum(price) from fruit_product;

select min(price) from fruit_product;

select max(price) from fruit_product;

select avg(price) from fruit_product;


CREATE TABLE shoe_brands (
    Product_id serial PRIMARY KEY,
    brand_name varchar NOT NULL UNIQUE,
    headquarters_country varchar NOT NULL,
    year_founded smallint,
	CONSTRAINT check_year_founded 
        CHECK (year_founded <= EXTRACT(YEAR FROM CURRENT_DATE) AND year_founded > 1800),
    website_url varchar
);

select * from shoe_brands;

INSERT INTO public.shoe_brands(
	product_id,brand_name,headquarters_country,year_founded,website_url)
	VALUES (1,'Nike', 'USA', 1964, 'https://www.nike.com');

select * from shoe_brands;

select * from shoe_brands where product_id between 1 and 600;

create table shoe_brands2 as (select * from shoe_brands);

select * from shoe_brands where product_id between 50 and 900
union
select * from shoe_brands2 where product_id between 300 and 700;


select * from shoe_brands where year_founded between 400 and 1000
except
select * from shoe_brands2 where year_founded between 500 and 900;

select * from shoe_brands where year_founded between 200 and 800
intersect
select * from shoe_brands2 where year_founded between 300 and 700;

CREATE TABLE electronics_stock (
    product_id serial primary key,
    productName varchar(50),
    category varchar not null,
    price float not null,
    stockquantity int not null
);

select * from electronics_stock;

INSERT INTO public.electronics_stock(
	product_id, productName, category, price, stockquantity)
	VALUES (1,'Smartwatch Z-Series','Wearables',249.99,150);

select * from electronics_stock;

CREATE TABLE books (
    author_id serial primary key,
    FirstName varchar,
    LastName varchar,
    city text not null,
    book_id int
);

select * from books;

INSERT INTO public.books(
	author_id, firstname, lastname, city, book_id)
	VALUES (1,'FScott','Fitzgerald','New York',101);

select * from books;

CREATE TABLE groceryShop (
    Order_id serial primary key,
    product_id int not null,
    shopName varchar,
    Customer_id int not null,
    paymentMethod varchar
);

select * from groceryShop;

INSERT INTO public.groceryshop(
	order_id, product_id, shopname, customer_id, paymentmethod)
	VALUES (1,101,'QuickMart',201,'Credit Card');

select * from groceryShop;

select * from Flower_product;

select * from fruit_product;

alter table Flower_product add constraint fk_flower_fruit 
foreign key (product_id) references fruit_product(product_id);

select * from fruit_product as f
inner join flower_product as r
on f.product_id =r.product_id
order by stock_quantity;


select * from electronics_stock;

select * from fruit_product;

alter table electronics_stock add constraint fk_electronics_fruit 
foreign key (product_id) references fruit_product(product_id);


select * from Flower_product;

select * from Shoe_brands;

alter table Flower_product add constraint fk_flower_shoe 
foreign key (product_id) references shoe_brands(product_id

select * from flower_product as p
left join shoe_brands as s
on p.product_id =s.product_id
order by year_founded;


select * from groceryshop;

select * from shoe_brands;

alter table groceryshop add constraint fk_grocery_shoe 
foreign key (order_id) references shoe_brands(product_id);

select * from groceryshop as g
right join shoe_brands as s
on g.product_id =s.product_id
order by customer_id;


select * from Flower_product;

select * from fruit_product;

alter table Flower_product add constraint fk_flower_fruit 
foreign key (product_id) references fruit_product(product_id);


select * from Groceryshop;

select * from books;

alter table groceryshop add constraint fk_grocery_books 
foreign key (product_id) references books(author_id);





