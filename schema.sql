-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

-- Drop table

-- DROP TABLE public.addition;

CREATE TABLE public.addition (
	add_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	add_name varchar(255) NOT NULL,
	add_amt numeric(10, 2) NULL,
	invoice_id int4 NULL,
	CONSTRAINT addition_pkey PRIMARY KEY (add_id),
	CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.invoice(invoice_id)
);

-- Table Triggers

create trigger update_total_fee_trigger after
insert
    or
delete
    or
update
    on
    public.addition for each row execute function update_total_fee();

-- Drop table

-- DROP TABLE public.courier;

CREATE TABLE public.courier (
	courier_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	courier_name varchar(255) NOT NULL,
	delivery_opt varchar(255) NOT NULL,
	delivery_fee numeric(10, 2) NOT NULL,
	CONSTRAINT courier_pkey PRIMARY KEY (courier_id)
);

-- Drop table

-- DROP TABLE public.insurance;

CREATE TABLE public.insurance (
	insurance_id serial4 NOT NULL,
	insurance_name varchar(255) NOT NULL,
	insurance_fee numeric(10, 2) NULL,
	CONSTRAINT insurance_pkey PRIMARY KEY (insurance_id)
);

-- Drop table

-- DROP TABLE public.invoice;

CREATE TABLE public.invoice (
	invoice_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	invoice_number varchar(255) NOT NULL,
	total_fee_amt numeric(10, 2) NULL,
	courier_id int4 NOT NULL,
	pymt_id int4 NOT NULL,
	seller_id int4 NULL,
	insurance_id int4 NULL,
	buyer_id int4 NULL,
	invoice_date date NOT NULL,
	CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id),
	CONSTRAINT fk_invoice_buyer_id FOREIGN KEY (buyer_id) REFERENCES public."user"(user_id),
	CONSTRAINT fk_invoice_insurance_id FOREIGN KEY (insurance_id) REFERENCES public.insurance(insurance_id),
	CONSTRAINT fk_invoice_seller_id FOREIGN KEY (seller_id) REFERENCES public."user"(user_id),
	CONSTRAINT invoice_courier_fk FOREIGN KEY (courier_id) REFERENCES public.courier(courier_id),
	CONSTRAINT invoice_pymt_method_fk FOREIGN KEY (pymt_id) REFERENCES public.pymt_method(pymt_id)
);

-- Drop table

-- DROP TABLE public.order_item;

CREATE TABLE public.order_item (
	order_item_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	product_id int4 NOT NULL,
	quantity int4 NOT NULL,
	total_price numeric(10, 2) NOT NULL,
	invoice_id int4 NULL,
	CONSTRAINT order_item_pkey PRIMARY KEY (order_item_id),
	CONSTRAINT fk_order_item_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.invoice(invoice_id),
	CONSTRAINT invoice_addition_fk FOREIGN KEY (product_id) REFERENCES public.product(product_id)
);

-- Table Triggers

create trigger update_total_price before
insert
    or
update
    on
    public.order_item for each row execute function calculate_total_price();

-- Drop table

-- DROP TABLE public.product;

CREATE TABLE public.product (
	product_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	product_name varchar(255) NOT NULL,
	product_price numeric NOT NULL,
	product_weight_grams numeric NOT NULL,
	CONSTRAINT product_pkey PRIMARY KEY (product_id)
);

-- Drop table

-- DROP TABLE public.pymt_method;

CREATE TABLE public.pymt_method (
	pymt_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	method_name varchar(255) NOT NULL,
	CONSTRAINT pymt_method_pkey PRIMARY KEY (pymt_id)
);

-- Drop table

-- DROP TABLE public."user";

CREATE TABLE public."user" (
	user_id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	user_name varchar NOT NULL,
	user_email varchar NULL,
	user_address text NULL,
	user_type varchar NOT NULL,
	user_phone varchar(255) NULL,
	CONSTRAINT user_pk PRIMARY KEY (user_id)
);