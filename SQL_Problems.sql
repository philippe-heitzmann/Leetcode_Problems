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

#1693. Daily Leads and Partners - Easy

select distinct date_id, make_name, count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners
from DailySales
group by date_id, make_name;

#1571. Warehouse Manager - Easy

select name as warehouse_name, sum(Width * Length * Height * units) as volume
from Warehouse left join Products on Warehouse.product_id = Products.product_id
group by name;

#1729. Find Followers Count - Easy

select user_id, count(distinct follower_id) as followers_count
from Followers 
group by user_id;

#1075. Project Employees I - Easy

select project_id, round(avg(experience_years),2) as average_years 
from Project join Employee on Project.employee_id = Employee.employee_id
group by project_id;



#511. Game Play Analysis I - Easy

select player_id, min(event_date) as first_login
from Activity
group by player_id;

#1308. Running Total for Different Genders - Medium

select gender, day, sum(score_points) over(partition by gender order by day) as total 
from Scores;

#1587. Bank Account Summary II - Easy

select name, sum(amount) as balance 
from Users join Transactions on Users.account = Transactions.account
group by name
having balance > 10000;

#1270. All People Report to the Given Manager - Medium

select e1.employee_id 
from Employees e1 
join Employees e2 on e1.manager_id = e2.employee_id
join Employees e3 on e3.employee_id = e2.manager_id
join Employees e4 on e4.employee_id = e3.manager_id
where e4.manager_id = 1 and e1.employee_id <> 1;

#1378. Replace Employee ID With The Unique Identifier - Easy


select EmployeeUNI.unique_id as unique_id, name
from Employees left join EmployeeUNI on Employees.id = EmployeeUNI.id;

#1683. Invalid Tweets - Easy 

select tweet_id from Tweets where length(content) > 15;

#1068. Product Sales Analysis I

select product_name, Sales.year, price
from Sales left join Product on Sales.product_id = Product.product_id;

#1050. Actors and Directors Who Cooperated At Least Three Times - Easy

select actor_id, director_id 
from ActorDirector
group by actor_id, director_id
having count(timestamp) >= 3;

#1148. Article Views I - Easy

select distinct author_id as id
from Views 
where author_id = viewer_id
order by author_id asc;



#1076. Project Employees II - Easy

select project_id 
from Project
group by project_id
having count(*) =
(select max(total_employees)
 from (select count(*) as total_employees
      from Project
      group by project_id) as Temp);


#1069. Product Sales Analysis II - Easy

# Write your MySQL query statement below

select product_id, sum(quantity) as total_quantity
from Sales
group by product_id;

#1407. Top Travellers - Easy

select name, coalesce(sum(distance),0) as travelled_distance
from Users left join Rides on Users.id = Rides.user_id
group by name
order by travelled_distance desc, name asc;

#1741. Find Total Time Spent by Each Employee - Easy

select event_day as day, emp_id, sum(out_time - in_time) as total_time
from Employees
group by emp_id, day;

#1581. Customer Who Visited but Did Not Make Any Transactions - Easy

select customer_id, SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) as count_no_trans
from Visits left join Transactions on Visits.visit_id = Transactions.visit_id
group by customer_id
having count_no_trans > 0; 
