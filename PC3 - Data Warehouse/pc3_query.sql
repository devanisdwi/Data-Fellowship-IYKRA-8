with Flattened as (
  SELECT DISTINCT channelGrouping, date, geoNetwork_country,
  SUM(totals_transactions) as Transactions
  FROM `data-to-insights.ecommerce.rev_transactions`
  GROUP BY 1, 2, 3
  ORDER BY date, geoNetwork_country ASC
)

select channelGrouping as Channel, ARRAY_AGG(date) as Date, ARRAY_AGG(geoNetwork_country) as Country, ARRAY_AGG(Transactions) as Transactions, from Flattened
  GROUP BY channelGrouping;