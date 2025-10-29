***BlueHarbor - Data Driven Trade Simulation***

**Overview**
This is a data-driven international trade simulation project surrounding a mock shipping company, 'BlueHarbor Logistics', focused on taxes, specifically VAT and Customs - VAT being an umbrella term for 'sales tax' in this project.

BlueHarbor handles imports and exports between the EU, UK, USA and Asia. The taxes involved were VAT for the intra-EU shipments, and Customs duty for imports and exports.

Synthetic data is generated for shipments, invoices and tax rates. Trends are visualised through various static and one interactive dashboard.

Noteworthy softwares & packages used:
- Python (pandas, matplotlib, seaborn, faker, ipywidgets)
- MySQL
- Jupyter Notebook
- Faker (synthetic data generation)

**Database**
Within the schema, there are four unique tables.
1. Products - This holds the product details including the name and category
2. Shipments - Information regarding each shipment's origin, destination, declared value, and weight
3. Tax rates - VAT and customs duty rates specific to each country
4. Invoices - The taxed invoice values per shipment

**Project Steps**
1. Database Configuration
Created a dedicated schema in MySQL called blueharbor
Defined Product, Shipment, Tax rates and Invoices tables with foreign key relationships.

2. Data Generation
Used Faker to create realistic synthetic data that involved random products and categories, cross-border shipments and dynamic tax rates and invoice calculations.

3. Data Seeding
Ran a Python script to populate every table with 8 tax rates, 8 products, 300 shipments and invoices, and committed the data to MySQL.

4. Querying and Analysis
Used SQL joins within Python to combine shipments, products and tax_rates, forming a complete dataset for visual exploration.

5. Data Visualisation
Created a clean matplotlib and seaborn dashboard with 4 graphs:
- Total VAT by destination country
- Total customs by destination country
- Invoice values by product category
- VAT efficiency (VAT/Declared Value ratio)
An interactive notebook was then created using ipywidgets to filter the destination country and product category.

**Insights**
- France to China and France to the UK were the most popular transport routes. The latter route had the highest combined VAT amount - just under £12,000.

- Japan (4), as a destination country, had the most 'MISSING_VAT' tax flags, with France (3) having the most as the origin country.

- The total VAT collected by the United Kingdom was the highest, followed by Netherlands and India, despite the UK having the joint second VAT rate (20%, tied with France). There were 40 shipments done to the UK, 36 to India and 44 to the Netherlands. VAT collected within Europe was just over £150,000, compared to ~£87,000 from outside the continent. This is relatively in proportion with the average VAT amount for each shipment per country/region.

- There is an interesting trend revealed when analysing the incoterms. Two are used in relation to Sea and Inland Waterway Transport - CIF and FOB. The other two, DDP and EXW are suitable for any mode of transportation. When ranking both average customs cost and average VAT cost, the pattern is, in descending order, FOB, CIF, EXW and finally DDP. DDP has, counterintuitively, the lowest VAT/Customs values. An explanation for this could be that BlueHarbor's DDP shipments are handled through pre-cleared routes, meaning that less tax is paid despite full seller liability.

**Further work**
- Extend the schema to include carriers, ports and tarriff codes.
- Utilise Plotly Dash instead of matplotlib for further interactivity
- Anomaly detection to find suspicious shipments

***Author***
Created by Jeffrey Acquah.

