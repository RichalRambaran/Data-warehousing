
alter table campaign add constraint  fk_cam_prom  foreign key (pr_number)  references promotion(pr_number);
alter table inventory_levels add constraint fk_inlv_prod foreign key(product_number) references product(product_number);
alter table order_details add constraint fk_ordet_order foreign key(order_number) references order_header(order_number);
alter table product add constraint fk_prod_prtp foreign key(product_type_code) references product_type(product_type_code);
alter table product_forecast add constraint fk_prfc_prod foreign key(product_number) references product(product_number);
alter table product_type add constraint fk_prtp_prln foreign key(product_line_code) references product_line(product_line_code);
alter table retailer_site add constraint fk_rest_reta foreign key(retailer_code) references retailer(retailer_code); 
alter table order_header add constraint fk_order_rest foreign key(retailer_site_code) references retailer_site(retailer_site_code);
alter table retailer add constraint fk_reta_retype foreign key(retailer_type_code) references retailer_type(retailer_type_code);
alter table order_header add constraint fk_order_sales_branch foreign key(sales_branch_code) references sales_branch(sales_branch_code);
alter table order_header add constraint fk_order_method foreign key(order_method_code) references order_method(order_method_code);
alter table order_header add constraint fk_order_sales_staff foreign key(sales_staff_code) references sales_staff(sales_staff_code);
alter table returned_item add constraint fk_return_retreason foreign key(return_reason_code) references return_reason(return_reason_code);
alter table sales_target add constraint fk_target_staff foreign key(sales_staff_code) references sales_staff(sales_staff_code);
alter table sales_target add constraint fk_target_prod foreign key(product_number) references product(product_number);
alter table sales_target add constraint fk_target_retailer foreign key(retailer_code) references retailer(retailer_code);
alter table retailer_site add constraint fk_retsite_retailer foreign key(retailer_code) references retailer(retailer_code);
alter table returned_item add constraint fk_retitem_ordt foreign key(order_detail_code) references order_details(order_detail_code);
delete from campaign where PR_NUMBER = 6 and PRODUCT_NUMBER = 116;
alter table campaign add constraint fk_camp_prod foreign key(product_number) references product(product_number);
alter table sales_branch add constraint fk_sabr_country foreign key(country_code) references country(country_code);
alter table retailer_site add constraint fk_retsite_country foreign key(country_code) references country(country_code);
alter table sales_staff add constraint fk_salstaff_sabr foreign key(sales_branch_code) references sales_branch(sales_branch_code);
commit;

