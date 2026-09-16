DimDate =
ADDCOLUMNS(
    CALENDAR(
        MIN('public bi_fact_sales'[purchase_date]),
        MAX('public bi_fact_sales'[purchase_date])
    ),
    "Year", YEAR([Date]),
    "Month No", MONTH([Date]),
    "Month", FORMAT([Date], "MMM"),
    "Year-Month", FORMAT([Date], "YYYY-MM"),
    "Quarter", "Q" & FORMAT([Date], "Q"),
    "Weekday No", WEEKDAY([Date], 2),
    "Weekday", FORMAT([Date], "DDD"),
    "Month Start", DATE(YEAR([Date]), MONTH([Date]), 1)
)