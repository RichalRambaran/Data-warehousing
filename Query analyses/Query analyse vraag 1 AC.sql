SELECT soi.id AS order_id,
	soi.line_id,
    c.company_name,
    CAST(so.order_date AS DATE) AS order_date,
    p.id AS product_id,
    p.name,
    p.category,
    soi.quantity,
    ROUND(p.unit_price, 2) AS unit_price,
    ROUND((soi.quantity * unit_price), 2) AS total_price
FROM sales_order_item soi
	LEFT JOIN sales_order so ON soi.id = so.id
    LEFT JOIN customer c ON so.cust_id = c.id
    LEFT JOIN product p ON soi.prod_id = p.id
ORDER BY order_id, line_id ASC