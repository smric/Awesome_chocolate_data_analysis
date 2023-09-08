use ac
-- 1. Selecting all the data from the sales table 
select * from sales
-- 2. Selct only Date, Amount and Customer columns from the sales table 
select Date, Amount, Customers from sales
-- 3. Calculations in queries - Amount per box 
select Date, Amount, Boxes,
case 
When Boxes=0 then null 
else Amount/Boxes 
end as 'Amount per box' 
from sales;
-- 4. Imposing conditions - Amount greater than 10000
select * from sales 
where Amount>10000
--5. Order clause for amount greater than 10000
select * from sales 
where Amount>10000
order by Amount desc
--6. Order clause 
select * from sales 
where Geo='G1'
order by Product, Amount desc 
--7. Examples for Where clause - value>10000 in year 2022 
select* from sales 
where Amount>10000 and Date>='2022-01-01'
-- 8. alternative way to extract date for the year 2022 using year function 
select Date,Amount from sales 
where Amount>10000 and year(Date)=2022
order by amount desc;
-- 9. Number of boxes where the number is from 0 to 50 
select*from sales
where Boxes >0 and Boxes <=50 
--or 
select*from sales
where Boxes between 0 and 50
-- 10. Using where clause to see the shipments happening on Fridays 
select Date, Amount, Boxes, DATEPART(weekday,Date) as 'Day of week' from sales
where DATEPART(weekday,Date) = 4;

--USING MULTIPLE TABLES 
select*from people
--1. See all the names in Delish or Jucies Team 
select*from people
where Team='Delish' or Team='Jucies'
-- using in clause for multiple conditions for where clause 
select*from people
where Team in('Delish','Jucies');

-- Pattern matching 
-- 1. names starting with B
select*from people
where Sales_person like 'B%' 
--2. Names with B anywhere 
select*from people
where Sales_person like '%B%'

--case operator - used for creating a separate amount category column where 
-- amount upto $1000 having level of under 1000, amount between $1000 to $5000
-- having level of under 5000 and amount between $5000 to $10000 having level of under 10000
select Date, Amount, 
		case when Amount < 1000 then 'Under 1k'
			when Amount < 5000 then 'Under 5K'
			when Amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales


