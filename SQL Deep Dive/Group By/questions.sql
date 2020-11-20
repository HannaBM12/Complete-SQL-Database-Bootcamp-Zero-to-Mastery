/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT hire_date, count(emp_no) AS "No of Employees" 
FROM "public"."employees"
GROUP BY hire_date
ORDER BY "No of Employees" DESC;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT a.emp_no, a.hire_date, count(b.title) AS "No of Titles"
FROM employees AS a INNER JOIN titles AS b using (emp_no)
WHERE extract (YEAR FROM hire_date) > 1991
GROUP BY emp_no
ORDER BY a.emp_no;


/*
*  Show me No of all the employees that work in the department development
*  Database: Employees
*/

SELECT c.dept_name, count(a.emp_no)
from employees as a inner join dept_emp as b using (emp_no)
inner join departments as c using (dept_no)
where c.dept_name = 'Development'
group by dept_name;
