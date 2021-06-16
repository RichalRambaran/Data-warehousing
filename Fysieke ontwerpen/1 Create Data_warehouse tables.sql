-- create all dimension tables
CREATE TABLE time_dimension (
    full_date date PRIMARY KEY,
    year int NOT NULL,
    quarter int NOT NULL,
    month int NOT NULL,
    day int NOT NULL
);

CREATE TABLE customer_dimension (
	id int IDENTITY(1, 1) PRIMARY KEY,
	retailer_code int NOT NULL,
	company_name varchar(255) NOT NULL,
	country varchar(255) NOT NULL,
	state varchar(255) NOT NULL,
	address varchar(255) NOT NULL,
	discount float NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
	source varchar(255) NOT NULL,
);

CREATE TABLE employee_dimension (
	id int IDENTITY(1, 1) PRIMARY KEY,
	staff_code int NOT NULL,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
	source varchar(255) NOT NULL,
);

CREATE TABLE product_dimension (
	id int IDENTITY(1, 1) PRIMARY KEY,
	product_number int NOT NULL,
	product_name varchar(255) NOT NULL,
	product_type varchar(255) NOT NULL,
    record_start_date date NOT NULL,
    record_end_date date NULL,
	source varchar(255) NOT NULL,
);

-- create all fact tables
CREATE TABLE order_header_fact (
	order_number int,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	employee_id int NOT NULL,
	source varchar(255) NOT NULL,
    PRIMARY KEY (order_number, source),
	FOREIGN KEY (time_id) REFERENCES time_dimension(full_date),
	FOREIGN KEY (customer_id) REFERENCES customer_dimension(id),
	FOREIGN KEY (employee_id) REFERENCES employee_dimension(id)
);

CREATE TABLE order_details_fact (
	order_detail_code int,
	order_line_id int NOT NULL,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	employee_id int NOT NULL,
	quantity int NOT NULL,
	unit_price float NOT NULL,
	total_price float NOT NULL,
	source varchar(255) NOT NULL,
    PRIMARY KEY (order_detail_code, order_line_id, source),
	FOREIGN KEY (time_id) REFERENCES time_dimension(full_date),
	FOREIGN KEY (customer_id) REFERENCES customer_dimension(id),
	FOREIGN KEY (product_id) REFERENCES product_dimension(id),
	FOREIGN KEY (employee_id) REFERENCES employee_dimension(id)
);

CREATE TABLE returned_item_fact (
	return_code int,
	time_id date NOT NULL,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	reason varchar(255) NOT NULL,
	source varchar(255) NOT NULL,
    PRIMARY KEY (return_code, source),
	FOREIGN KEY (time_id) REFERENCES time_dimension(full_date),
	FOREIGN KEY (customer_id) REFERENCES customer_dimension(id),
	FOREIGN KEY (product_id) REFERENCES product_dimension(id)
);