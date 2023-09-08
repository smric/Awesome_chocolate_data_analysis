use ac
--1. group by the location to see the total amount, average amount and total boxes for each location
select g.Geo,sum(Amount) as 'Total Amount', AVG(Amount) as 'Average', SUM(Boxes) as 'Total Boxes'
from sales s
join geo g on s.Geo = g.GeoID
group by g.Geo;
--2. Get the data from people and product table - total amount coming in from Team and a category 
select pr.Category, p.Team, sum(Boxes) as 'Total Boxes', sum(Amount) as 'Total Amount'
from sales s
join people p on p.SP_ID = s.Sales_Person
join products pr on pr.Product_ID = s.Product
group by pr.Category, p.Team
order by pr.Category, p.Team

--Total amounts by top 10 products 
select TOP 10 pr.Product, sum(Amount) as 'Total Amount'
from sales s 
join products pr on pr.Product_ID = s.Product
group by pr.Product
order by 'Total Amount' desc
