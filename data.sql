INSERT INTO public.addition (add_name,add_amt,invoice_id) VALUES
	 ('Service Fee',1000.00,1),
	 ('Application Fee',1000.00,1);
INSERT INTO public.courier (courier_name,delivery_opt,delivery_fee) VALUES
	 ('J & T','Reguler',126000.00);
INSERT INTO public.insurance (insurance_name,insurance_fee) VALUES
	 ('Delivery Insurance from Tokopedia',57700.00);
INSERT INTO public.invoice (invoice_number,total_fee_amt,courier_id,pymt_id,seller_id,insurance_id,buyer_id,invoice_date) VALUES
	 ('INV/20330311/MPL/3694776524',2000.00,1,1,1,1,2,'2024-05-22');
INSERT INTO public.order_item (product_id,quantity,total_price,invoice_id) VALUES
	 (1,1,20500000.00,1);
INSERT INTO public.product (product_name,product_price,product_weight_grams) VALUES
	 ('SAPPHIRE NITRO+ RADEON RX 7900 XTX 24GB',20500000,5000);
INSERT INTO public.pymt_method (method_name) VALUES
	 ('BCA Virtual Account'),
	 ('GoPay Coins');
INSERT INTO public."user" (user_name,user_email,user_address,user_type,user_phone) VALUES
	 ('COC Computer',NULL,NULL,'Merchant',NULL),
	 ('Sum Ting Wong',NULL,'Digital Park, Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau, 29466','Customer','6281312341234');
