alter table employee add constraint empl_dept_fk foreign key(dept_id) references department(dept_id);
alter table sales_order add constraint saor_empl_fk foreign key(sales_rep) references employee(emp_id);
alter table sales_order_item add constraint sait_saor_fk foreign key(id) references sales_order(id);
delete from sales_order_item where prod_id  in (303,402);
alter table sales_order_item add constraint sait_prod_fk foreign key(prod_id) references product(id);
alter table sales_order add constraint saor_fico_fk foreign key(fin_code_id) references fin_code(code);
alter table sales_order add constraint saor_cust_fk foreign key(cust_id) references customer(id);