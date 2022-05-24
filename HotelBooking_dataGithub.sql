
--   Exploratory data analysis
 

WITH hotels as
 ( 
SELECT * FROM portfolio_hotelrevenue.`2018`
union
SELECT * FROM portfolio_hotelrevenue.`2019`
union
SELECT * FROM portfolio_hotelrevenue.`2020`
) 

select arrival_date_year, hotel, ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr)) as Revenue
from hotels
group by arrival_date_year, hotel


--      Discount on market_segment and mealcost


WITH hotels as
 ( 
SELECT * FROM portfolio_hotelrevenue.`2018`
union
SELECT * FROM portfolio_hotelrevenue.`2019`
union
SELECT * FROM portfolio_hotelrevenue.`2020`
) 

Select hotel, market_segment.market_segment,market_segment.discount,mealcost.cost,mealcost.meal
 from hotels
left join market_segment
on hotels.market_segment = market_segment.market_segment
left join mealcost
on hotels.meal=mealcost.meal
