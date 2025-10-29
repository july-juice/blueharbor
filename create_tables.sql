use blueharbor;

set FOREIGN_KEY_CHECKS = 0;

drop table if exists products;
drop table if exists shipments;
drop table if exists tax_rates;
drop table if exists invoices;

set FOREIGN_KEY_CHECKS = 1;

create table if not exists products (
	product_id int auto_increment primary key,
    product_name varchar(100) not null,
    product_category varchar(100) not null
);

create table if not exists shipments (
	shipment_id int auto_increment primary key,
    origin_country varchar(100) not null,
    destination_country varchar(100) not null,
    product_id int not null,
    declared_value decimal(12,2),
    weight_kg decimal(10,2),
    shipment_date date not null,
    incoterm varchar(10),
    foreign key (product_id) references products(product_id)
    
);

create table if not exists tax_rates (
	country varchar(100) primary key,
    vat_rate decimal(5,3) not null,
    customs_duty_rate decimal(5,3) not null
);

create table if not exists invoices (
	invoice_id int auto_increment primary key,
    shipment_id int not null,
    invoice_date date not null,
    invoice_value decimal(12,2) not null,
    vat_amount decimal(12,2),
    customs_amount real,
    tax_flag varchar(30),
    foreign key (shipment_id) references shipments(shipment_id)
);




