select inv.invoice_number,
u.user_name as merchant,
u2.user_name as customer,
inv.invoice_date,
u2.user_address,
p.product_name,
p.product_weight_grams / 1000 as weight_kg,
oi.quantity,
p.product_price as unit_price,
oi.total_price,
c.courier_name,
c.delivery_opt, 
c.delivery_fee,
i.insurance_name,
i.insurance_fee,
c.delivery_fee + i.insurance_fee + oi.total_price as shopping_total,
a.add_amt as service_fee,
a2.add_amt as application_fee,
c.delivery_fee  + i.insurance_fee + oi.total_price + sum(a3.add_amt) as invoice_total,
pm.method_name as pymt_method
from invoice inv
inner join "user" u on u.user_id = inv.seller_id
inner join "user" u2 on u2.user_id = inv.buyer_id
inner join order_item oi on oi.invoice_id = inv.invoice_id 
inner join product p on p.product_id = oi.product_id
inner join courier c on c.courier_id = inv.courier_id
inner join insurance i on i.insurance_id = inv.insurance_id
inner join (
	select add_amt, invoice_id
	from addition
	where add_id = 1
) a on a.invoice_id = inv.invoice_id
inner join (
	select add_amt, invoice_id
	from addition
	where add_id = 2
) a2 on a2.invoice_id = inv.invoice_id
inner join addition a3 on a3.invoice_id = inv.invoice_id
inner join pymt_method pm on pm.pymt_id = inv.pymt_id 
group by inv.invoice_number,
u.user_name,
u2.user_name,
inv.invoice_date,
u2.user_address,
p.product_name,
p.product_weight_grams,
oi.quantity,
p.product_price,
oi.total_price,
c.courier_name,
c.delivery_opt, 
c.delivery_fee,
i.insurance_name,
i.insurance_fee,
a.add_amt,
a2.add_amt,
a3.add_amt,
pm.method_name 