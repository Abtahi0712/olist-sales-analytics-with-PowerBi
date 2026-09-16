1) Page: Overview (Executive Dashboard)

Visual 1: KPI Cards (7 cards)

Cards

[Revenue]

[Orders]

[Customers]

[AOV]

[On-time %]

[Avg Rating]

[YoY %]


Visual 2: Line chart (Revenue trend)

Axis: DimDate[Year-Month]

Values: [Revenue]

Tooltip: [Orders], [AOV], [YoY %]


Visual 3: Clustered column (Orders by month)

Axis: DimDate[Year-Month]

Values: [Orders]


Visual 4: Bar chart (Top 10 categories by revenue)

Axis: bi_fact_sales[category]

Values: [Revenue]

Filter: Top N = 10 by [Revenue]

Tooltip: [Orders], [AOV], [Avg Rating]


Visual 5: Filled Map (Revenue by state)

Location: bi_fact_sales[customer_state]

Size: [Revenue]

Tooltip: [Orders], [AOV]


Visual 6: Donut (Order status share)

Legend: bi_fact_sales[order_status]

Values: [Orders]



2) Page: Sales Trends

Visual 1: Line chart (Revenue vs Last Year)

Axis: DimDate[Year-Month]

Values: [Revenue], [Revenue LY]


Visual 2: KPI (Rolling 30D Revenue)

Card: [Rolling 30D Revenue]


Visual 3: Area/Line (Revenue YTD)

Axis: DimDate[Date] (or month)

Values: [Revenue YTD]


Visual 4: Matrix (Category × Month)

Rows: category

Columns: DimDate[Year-Month]

Values: [Revenue], [Orders], [AOV]



3) Page: Category & Product

Visual 1: Treemap (Category revenue share)

Group: category

Values: [Revenue]


Visual 2: Scatter (AOV vs Orders by category)

X: [Orders]

Y: [AOV]

Details: category

Size: [Revenue]

Tooltip: [Avg Rating], [On-time %]


Visual 3: Bar chart (Top categories by rating)

Axis: category

Values: [Avg Rating]

Tooltip: [Orders], [Revenue]


Visual 4: Table (Top 20 categories)

Columns: category, [Revenue], [Orders], [AOV], [Avg Rating], [On-time %]



4) Page: Customer Geo

Visual 1: Filled Map (Revenue by state)

Location: customer_state

Size: [Revenue]


Visual 2: Bar chart (Top 10 states by revenue)

Axis: customer_state

Values: [Revenue]

Top N = 10


Visual 3: Bar chart (Top 10 cities by orders) (optional, can be heavy)

Axis: customer_city

Values: [Orders]

Top N = 10


Visual 4: Matrix (State × Category)

Rows: customer_state

Columns: category

Values: [Revenue], [Orders]




5) Page: Delivery & Logistics

Visual 1: KPI Cards

[On-time %]

[Late Orders]


Visual 2: Column (Late orders by month)

Axis: DimDate[Year-Month]

Values: [Late Orders]


Visual 3: Bar (Late % by state)

Axis: customer_state

Values: [Late %]


Visual 4: Bar (Avg delivery days by category)

Axis: category

Values: [Avg Delivery Days]



6) Page: Reviews

Visual 1: KPI Cards

[Avg Rating]

[Positive Reviews %]

[Negative Reviews %]


Visual 2: Donut (Rating distribution)

Legend: Review Bucket

Values: [Orders] (or countrows)


Visual 3: Bar (Avg rating by category)

Axis: category

Values: [Avg Rating]


Visual 4: Bar (Avg rating Late vs On-time)

Axis: is_late

Values: [Avg Rating]



7) Page: Payments

Visual 1: Donut (Payment type share)

Legend: order_payment_type

Values: [Payment Value]


Visual 2: Column (Avg installments by payment type)

Axis: order_payment_type

Values: [Avg Installments]


Visual 3: Line (Payment value trend)

Axis: DimDate[Year-Month]

Values: [Payment Value]

Legend: order_payment_type


Visual 4: Table

Columns: payment_type, [Payment Value], [Orders], [AOV]


8) Page: Sellers

You need seller fields in bi_fact_sales (seller_id and seller_state/city ideally).

Measures
Sellers := DISTINCTCOUNT ( bi_fact_sales[seller_id] )

Revenue per Seller := DIVIDE ( [Revenue], [Sellers] )
Visuals

Cards: [Sellers], [Revenue per Seller]

Bar: Top 10 sellers by [Revenue]

Map: seller_state by [Revenue] (if you have seller_state)

Matrix: seller_state × category → [Revenue], [Orders]


9) Drillthrough Page (Optional, very pro)
Setup

Create new page “Drillthrough”

Add Drillthrough fields: category (or customer_state / seller_id)

Visuals

Cards: [Revenue], [Orders], [AOV], [Avg Rating], [On-time %]

Line: [Revenue] by DimDate[Year-Month]

Table: top products/orders (limit rows)