#Interesting SQL Leetcode Problems

#627. Swap Salary - Easy

UPDATE
    salary
SET 
  sex = CASE sex WHEN 'm' THEN 'f' ELSE 'm' END; 

#1677. Product's Worth Over Invoices - Easy

# Write your MySQL query statement below

select name, sum(rest) as rest, sum(paid) as paid, sum(canceled) as canceled, sum(refunded) as refunded
from Product join Invoice on Product.product_id = Invoice.product_id
group by name
order by name;

#619. Biggest Single Number

select max(num) as num from 
(select num from my_numbers group by num having count(num) =1) as t;
 

#175. Combine Two Tables


select FirstName, LastName, City, State 
from Person left join Address on Person.PersonId = Address.PersonId;

#176. Second Highest Salary

SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary;


#1322. Ads Performance - Easy

select ad_id, 
coalesce(round(sum(case when Ads.action = "Clicked" then 1 else 0 end)/
        sum(case when Ads.action = "Clicked" or Ads.action = "Viewed" then 1 else 0 end)*100,2),0)
        as ctr
from Ads 
group by ad_id
order by ctr DESC, ad_id ASC;

#595. Big Countries - Easy

select name, population, area 
from World 
where population > 25000000 or area > 3000000
;

#620. Not Boring Movies - easy 

select id, movie, description, rating 
from cinema 
where id % 2 != 0 and description not like '%boring%'
order by rating DESC;

#182. Duplicate Emails

select distinct Email from Person
group by Email
having count(Email) > 1;


#181. Employees Earning More Than Their Managers

select x.Name as Employee 
from Employee x join Employee y on x.ManagerId = y.Id
where x.Salary > y.Salary;

#183. Customers Who Never Order

select Name as Customers
from Customers left join Orders on Customers.Id=Orders.CustomerId
where CustomerId IS NULL;

#596. Classes More Than 5 Students

select class 
from courses
group by class
having count(distinct student) >= 5;


