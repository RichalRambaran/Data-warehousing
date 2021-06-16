SELECT so.id,
	CAST(so.order_date AS DATE) AS order_date,
    c.company_name,
    e.emp_id,
    e.emp_fname,
    e.emp_lname
FROM sales_order so
	LEFT JOIN customer c ON so.cust_id = c.id
    LEFT JOIN employee e ON so.sales_rep = e.emp_id