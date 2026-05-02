
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
