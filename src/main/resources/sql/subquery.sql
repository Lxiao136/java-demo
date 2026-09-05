USE atguigudb;

#子查询：一个查询嵌套在另一个查询内

#工资高于 Abel 的员工
SELECT employees.last_name , employees.salary
FROM employees
WHERE salary > (
                SELECT salary
                FROM employees
                WHERE last_name = 'Abel'
                );

#单行子查询：
SELECT employees.last_name , employees.salary
FROM employees
WHERE salary > (
                    SELECT salary
                    FROM employees
                    WHERE employee_id = 149
                    );

#多行子查询:内查询返回多行记录
#多行比较操作符:
#IN:等于表中任意一个
#ANY(SOME):需要和单行操作符一起用，和子查询返回的某一个值比较(任一)
#ALL:需要和单行操作符一起用，和子查询返回的所有值比较



#相关子查询：内查询跟外查询具有相关性
SELECT e1.last_name , e1.department_id , e1.salary
FROM employees e1
WHERE salary > (
                SELECT AVG(salary)
                FROM employees e2
                WHERE e2.department_id = e1.department_id
                );

SELECT e.department_id , e.salary
FROM employees e
ORDER BY (
            SELECT d.department_name
            FROM departments d
            WHERE e.department_id = d.department_id
                     ) ASC;

#EXISTS:检查子查询中是否有存在的行，存在返回 true
#NOT EXISTS
SELECT e.last_name ,e.employee_id,e.job_id,e.department_id
FROM employees e
WHERE EXISTS(
                SELECT *
                FROM employees e2
                WHERE e.employee_id = e2.manager_id
            );