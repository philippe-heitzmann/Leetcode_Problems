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

#177. Nth Highest Salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N-1;
  RETURN (
      select distinct Salary 
      from Employee 
      order by Salary DESC
      limit N,1
  );
END;r

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

#182. Duplicate Emails - Easy

select distinct Email from Person
group by Email
having count(Email) > 1;


#181. Employees Earning More Than Their Managers - Easy

select x.Name as Employee 
from Employee x join Employee y on x.ManagerId = y.Id
where x.Salary > y.Salary;

#183. Customers Who Never Order - Easy

select Name as Customers
from Customers left join Orders on Customers.Id=Orders.CustomerId
where CustomerId IS NULL;

#596. Classes More Than 5 Students - Easy

select class 
from courses
group by class
having count(distinct student) >= 5;


#197. Rising Temperature - Easy

SELECT
    weather.id AS 'Id'
FROM
    weather
        JOIN
    weather w ON DATEDIFF(weather.recordDate, w.recordDate) = 1
        AND weather.Temperature > w.Temperature;

#196. Delete Duplicate Emails - Easy

delete p1 from Person p1, Person p2
where p1.id > p2.id and p1.Email = p2.Email;

#1112. Highest Grade For Each Student - Medium

select student_id, course_id, grade 
from(
Select *,
    rank() over(partition by student_id order by grade DESC, course_id ASC) as rank1
    from Enrollments)
    as t2
    where rank1 = 1;

#1398. Customers Who Bought Products A and B but Not C - Medium

select Orders.customer_id, customer_name
from Orders join Customers on Orders.customer_id = Customers.customer_id
group by Orders.customer_id
having sum(case when product_name = 'A' then 1 else 0 end) > 0 and sum(case when product_name = 'B' then 1 else 0 end) > 0 and sum(case when product_name = 'C' then 1 else 0 end) = 0;

#570. Managers with at Least 5 Direct Reports - Medium

select name 
from Employee
where Id in(
select ManagerId 
    from Employee
    group by ManagerId
    having count(*) >= 5
);

#1045. Customers Who Bought All Products - Medium

select customer_id
from Customer
group by customer_id  
having count(distinct product_key) >= (select count(distinct product_key) from product);

#1421. NPV Queries - Medium

select q.id, q.year, ifnull(n.npv, 0) as NPV
from Queries q left join NPV n on q.id = n.id and q.year = n.year;


# 1350. Students With Invalid Departments - Easy

select id, name 
from Students
where department_id not in(
select id from Departments);
