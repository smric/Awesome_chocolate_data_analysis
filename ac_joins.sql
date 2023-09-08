-- JOIN
use ac
--1. see the salesperson and their sales from tables sales and people 
select s.Date, s.Amount,p.Sales_person, p.SP_ID, s.Sales_Person
from sales s 
join people p on p.SP_ID = s.Sales_Person;
--2. Left join - product name that we are selling in this shipment 
select s.Date, s.Amount, pr.Product
from sales s
left join products pr on pr.Product_ID = s.Product;
--3. Join multiple tables - product name and person name in one view 
select s.Date, s.Amount,p.Sales_person, pr.Product, p.Team
from sales s 
join people p on p.SP_ID = s.Sales_Person
join products pr on pr.Product_ID = s.Product
--4. Conditions with joins 
select s.Date, s.Amount,p.Sales_person, pr.Product, p.Team
from sales s 
join people p on p.SP_ID = s.Sales_Person
join products pr on pr.Product_ID = s.Product
where s.Amount<500
and p.Team ='Delish';
--5. Conditions with joins where geography is India or New Zeland 
select s.Date, s.Amount,p.Sales_person, pr.Product, p.Team, g.Geo
from sales s 
join people p on p.SP_ID = s.Sales_Person
join products pr on pr.Product_ID = s.Product
join geo g on g.GeoID = s.Geo
where s.Amount<500
and g.Geo in ('India','New Zeland')
order by Date;

