
-- Day 1 | Question 1
-- LeetCode #175: Combine Two Tables
-- Difficulty: Easy
-- Topic: LEFT JOIN

SELECT p.firstName,
       p.lastName,
       a.city,
       a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;

-- Day 2 | Question 2
-- LeetCode #181: Employees Earning More Than Their Managers
-- Difficulty: Easy
-- Topic: SELF JOIN
-- Find employees whose salary is greater than their manager's salary

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;

-- Day 3 | Question 3
-- LeetCode #182: Duplicate Emails
-- Difficulty: Easy
-- Topic: GROUP BY, HAVING
-- Find emails that appear more than once

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- Day 4 | Question 4
-- LeetCode #183: Customers Who Never Order
-- Difficulty: Easy
-- Topic: LEFT JOIN / SUBQUERY
-- Find customers who never placed any order

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;

-- Day 5 | Question 5
-- LeetCode #196: Delete Duplicate Emails
-- Difficulty: Easy
-- Topic: SELF JOIN 
-- Delete duplicate emails, keep smallest id 

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;

-- Day 6 | Question 6
-- LeetCode #197: Rising Temperature
-- Difficulty: Easy
-- Topic: SELF JOIN / WINDOW FUNCTION
-- Find ids where today's temperature is higher than yesterday

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
AND w1.temperature > w2.temperature;

-- Day 7 | Question 7
-- LeetCode #511: Game Play Analysis I
-- Difficulty: Easy
-- Topic: Aggregation/Window Function (ROW_NUMBER)
-- Find first login date for each player

SELECT player_id,min(event_date) as first_login
FROM Activity
GROUP BY player_id;

-- Day 8 | Question 8
-- LeetCode #577: Employee Bonus
-- Difficulty: Easy
-- Topic: LEFT JOIN + NULL Filtering
-- Find employees with bonus < 1000 or no bonus

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;

-- Day 9 | Question 9
-- LeetCode #584: Find Customer Referee
-- Difficulty: Easy
-- Topic: WHERE + NULL Handling
-- Find customers not referred by customer id = 2

SELECT name
FROM Customer
WHERE referee_id <> 2
   OR referee_id IS NULL;

-- Day 9 | Question 10
-- LeetCode #586: Customer Placing the Largest Number of Orders
-- Difficulty: Easy
-- Topic: GROUP BY + ORDER BY
-- Find customer who placed the maximum number of orders

SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Day 10 | Question 11
-- LeetCode #595: Big Countries
-- Difficulty: Easy
-- Topic: WHERE Clause + OR Condition
-- Find countries with large area or population

SELECT name,
       population,
       area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;

-- Day 10 | Question 12
-- LeetCode #596. Classes With at Least 5 Students
-- Difficulty: Easy
-- Topic: GROUP BY + HAVING
-- Find all the classes that have at least five students.

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(*)>=5;

-- Day 11 | Question 13
-- LeetCode #607. Sales Person
-- Difficulty: Easy
-- Topic: SUBQUERY + JOIN 
-- find the names of all the salespersons who did not have any orders related to the company with the name "RED".

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN
(
    SELECT o.sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);

-- Day 11 | Question 14
-- LeetCode #610. Triangle Judgement
-- Difficulty: Easy
-- Topic: CASE WHEN
-- Report for every three line segments whether they can form a triangle.

SELECT *,
CASE 
WHEN x+y>z AND y+z>x AND x+z>y THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle;
