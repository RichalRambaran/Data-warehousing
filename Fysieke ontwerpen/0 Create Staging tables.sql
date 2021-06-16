-- Staging dimension tables
create table customer_GO (
    retailer_code int PRIMARY KEY,
    company_name varchar(255) NOT NULL,
	country varchar(255) NOT NULL,
	region varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	discount float NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
    source varchar(255) NOT NULL
);

create table customer_AC (
    id int PRIMARY KEY,
    company_name varchar(255) NOT NULL,
    country varchar(255) NOT NULL,
    state varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    discount float NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
    source varchar(255) NOT NULL
);

create table employee_GO (
    sales_staff_code int PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
    source varchar(255) NOT NULL
);

create table employee_AC (
    emp_id int PRIMARY KEY,
    emp_fname varchar(255) NOT NULL,
    emp_lname varchar(255) NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
    source varchar(255) NOT NULL
);

CREATE TABLE product_GO (
	product_number int PRIMARY KEY,
	product_name varchar(255) NOT NULL,
	product_type varchar(255) NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
	source varchar(255) NOT NULL
);

CREATE TABLE product_AC (
	id int PRIMARY KEY,
	product_name varchar(255) NOT NULL,
	category varchar(255) NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
	source varchar(255) NOT NULL
);

-- Staging fact tables
CREATE TABLE order_header_GO (
	order_number int PRIMARY KEY,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	employee_id int NOT NULL,
	source varchar(255) NOT NULL
);

CREATE TABLE order_header_AC (
	id int PRIMARY KEY,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	employee_id int NOT NULL,
	source varchar(255) NOT NULL
);

CREATE TABLE order_details_GO (
	order_detail_code int PRIMARY KEY,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	employee_id int NOT NULL,
	quantity int NOT NULL,
	unit_price float NOT NULL,
	total_price float NOT NULL,
	source varchar(255) NOT NULL
);

CREATE TABLE order_details_AC (
	id int NOT NULL,
	line_id int NOT NULL,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	employee_id int NOT NULL,
	quantity int NOT NULL,
	unit_price float NOT NULL,
	total_price float NOT NULL,
	source varchar(255) NOT NULL,
	PRIMARY KEY(id, line_id)
);

CREATE TABLE returned_item_GO (
	return_code int PRIMARY KEY,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	reason varchar(255) NOT NULL,
	source varchar(255) NOT NULL
);