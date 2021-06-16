SELECT soi.id AS order_id,
	soi.line_id,
    c.company_name,
    c.discount,
    CAST(so.order_date AS DATE) AS order_date,
    e.emp_id,
    e.emp_fname,
    e.emp_lname,
    p.id AS product_id,
    p.name,
    p.category,
    soi.quantity
FROM sales_order_item soi
	LEFT JOIN sales_order so ON soi.id = so.id
    LEFT JOIN customer c ON so.cust_id = c.id
    LEFT JOIN product p ON soi.prod_id = p.id
    LEFT JOIN employee e ON so.sales_rep = e.emp_id
ORDER BY order_id, line_id ASC