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

