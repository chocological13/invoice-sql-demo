INSERT INTO public.addition (add_name,add_amt,courier_id,invoice_id) VALUES
	 ('Insurance Fee',57700.00,NULL,1),
	 ('Service Fee',1000.00,NULL,1),
	 ('Application Fee',1000.00,NULL,1),
	 ('Delivery Fee',126000.00,NULL,1);
INSERT INTO public.courier (courier_name,delivery_opt,delivery_fee) VALUES
	 ('J & T','Reguler',126000.00);
INSERT INTO public.insurance (insurance_name) VALUES
	 ('Delivery Insurance from Tokopedia');
INSERT INTO public.invoice (invoice_number,order_id,total_fee_amt,courier_id,pymt_id,invoice_amount) VALUES
	 ('INV/20330311/MPL/3694776524',1,185700,1,1,NULL);
INSERT INTO public."order" (user_id,order_price,order_date) VALUES
	 (1,20500000.00,'2024-06-03');
INSERT INTO public.order_item (product_id,quantity,total_price,order_id) VALUES
	 (1,1,20500000.00,1);
INSERT INTO public.product (product_name,product_price,product_weight_grams) VALUES
	 ('SAPPHIRE NITRO+ RADEON RX 7900 XTX 24GB',20500000,5000);
INSERT INTO public.pymt_method (method_name) VALUES
	 ('BCA Virtual Account'),
	 ('GoPay Coins');
INSERT INTO public."user" (user_name,user_email,user_address,user_type,user_phone) VALUES
	 ('COC Computer',NULL,NULL,'Merchant',NULL),
	 ('Sum Ting Wong',NULL,'Digital Park, Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau, 29466','Customer','6281312341234');
