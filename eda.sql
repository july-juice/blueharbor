select * from joined_data;
select * from invoices;
select * from products;
select * from shipments;
select * from tax_rates;

# Average Customs Costs and Shipment Counts by Incoterm
select incoterm,
round(avg(customs_amount),2) as avg_customs_cost,
count(*) as shipment_count
from joined_data
group by incoterm
order by avg_customs_cost desc;

# VAT rates for each country
select distinct vat_rate, destination_country from joined_data
order by 1 desc;

# Amount of shipments from each country - change destination_country to see each country
select destination_country, count(*) from joined_data
group by destination_country;

# Total and Average VAT for European vs Non-European Destinations
select
destination_country,
case
when destination_country in ('Germany', 'France', 'United Kingdom', 'Netherlands') THEN 'Europe'
when destination_country in ('India', 'China', 'Japan', 'United States') THEN 'Abroad'
end as region,
sum(vat_amount) as total_vat,
avg(vat_amount) as avg_vat
from joined_data
group by destination_country, region
order by region, avg_vat;

# Most Common Shipment Routes 
select origin_country, destination_country, count(*) as paircount, sum(vat_amount), sum(customs_amount) from joined_data
group by origin_country, destination_country
order by paircount desc;

select origin_country, destination_country, incoterm from joined_data
where origin_country = 'France' and destination_country = 'United Kingdom';

# Missing Tax Flags
select * from joined_data
where tax_flag like 'MISSING_VAT';

select destination_country, count(*) as missing_vat_count from joined_data
where tax_flag like 'MISSING_VAT'
group by destination_country
order by missing_vat_count desc;

select origin_country, count(*) as missing_vat_count from joined_data
where tax_flag like 'MISSING_VAT'
group by origin_country
order by missing_vat_count desc;