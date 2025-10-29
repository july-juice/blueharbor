# combined dataset preview

use blueharbor;

drop table if exists joined_data;
create table if not exists joined_data AS
select 
    s.shipment_id, s.origin_country, s.destination_country, s.declared_value, s.weight_kg, s.incoterm, s.shipment_date,
    p.product_name, p.product_category,
    t.vat_rate, t.customs_duty_rate,
    i.invoice_id, i.invoice_value, i.vat_amount, i.customs_amount, i.tax_flag, i.invoice_date
from shipments as s
join products as p 
    on s.product_id = p.product_id
join invoices as i
    on s.shipment_id = i.shipment_id
left join tax_rates as t 
    on s.destination_country = t.country
order by s.shipment_date desc

