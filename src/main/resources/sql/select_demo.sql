
USE atguigudb;

# SELECT 语句练习

    #去重
SELECT DISTINCT department_id
from employees;

#去除department_id、salary 都相同的数据
SELECT DISTINCT employees.department_id,employees.salary
FROM employees;

#null 参与运算，结果也为 null

    #显示表结构:显示表中字段的详细信息
DESCRIBE employees;
DESC departments;

    #过滤数据
SELECT *
FROM employees
#过滤条件,WHERE紧跟着FROM
WHERE department_id = 90;


    #比较运算符
#查询 pct 为null的
SELECT last_name,salary,commission_pct
FROM  employees
WHERE commission_pct IS NULL;

SELECT last_name,salary,commission_pct
FROM  employees
WHERE  ISNULL(commission_pct);

#查询 pct 不为null的
SELECT last_name,salary,commission_pct
FROM  employees
WHERE commission_pct IS NOT NULL;

SELECT last_name,salary,commission_pct
FROM  employees
WHERE NOT commission_pct <=> null;#<=> 安全等于 两个null返回1

#BETWEEN 条件下界 AND 条件上界 ：查询下界和上界范围内的数据，包含边界。
SELECT employees.employee_id,employees.last_name,employees.salary
FROM employees
WHERE salary BETWEEN 6000 AND 8000;

#IN / NOT IN:查找离散值
#查找部门为 10 ，20 ，30 部门员工信息
SELECT employees.last_name ,salary ,department_id
FROM employees
WHERE department_id IN (10 ,20 ,30);

#LIKE : 模糊查询
#查找 lastname 包含 ‘a’的员工信息
# % ：代表不确定个数的不确定字符
# _ :代表一个不确定的字符
# \ :转义字符
# ESCAPE: 后面接自定义转义字符
SELECT employees.last_name
FROM employees
WHERE last_name LIKE '%a%';#前面和后面都有不确定个数的字符

#排序 : ORDER BY
#升序：ASC  降序：DESC （默认升序）
SELECT employees.employee_id, employees.last_name ,employees.salary
FROM employees
ORDER BY salary DESC;

SELECT employee_id , last_name ,salary
FROM employees
WHERE department_id IN (50 ,60 ,70)
ORDER BY department_id DESC;

# 二级排序
SELECT department_id , last_name ,salary
FROM employees
ORDER BY department_id DESC , salary ASC;

#分页 ：LIMIT 每页有pagesize条记录 ，访问第n页
# LIMIT (n-1)*pagesize , pagesize;
#LIMIT 偏移量 , 条目数
#LIMIT 条目数 OFFSET 偏移量
SELECT department_id , last_name ,salary
FROM employees
#LIMIT 0 , 10;#第一页
LIMIT 3 , 10;#第四页

SELECT department_id , last_name ,salary
FROM employees
ORDER BY department_id DESC , salary ASC
LIMIT 10 OFFSET 2;
#LIMIT 2 ,10;


#多表查询：有 n 个表至少需要 n-1 个连接条件
SELECT employees.employee_id , departments.department_name
FROM employees , departments
WHERE employees.department_id = departments.department_id;

#表的别名可以在 SELECT 和 WHERE 中使用

#等值连接

# 非等值连接
SELECT e.last_name , e.salary , j.grade_level
FROM employees e , job_grades j
WHERE e.salary BETWEEN j.lowest_sal AND j.highest_sal;

#非自连接

#自连接: 表自己连接自己（把一张表看成多张表连接起来）
SELECT emp.employee_id ,emp.last_name ,emp.manager_id , mgr.employee_id , mgr.last_name
FROM employees emp , employees mgr
WHERE emp.manager_id = mgr.employee_id;

#内连接:合并具有同一列的两个以上的表的行，结果集中不包含一个表与另一个表不匹配的行
    #（只找符合条件的）(交集）
#SQL99：
SELECT last_name , department_name , city
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;

# 外连接(并集)
#左外连接（左表并集）
SELECT last_name , department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

# 右外连接（右表并集）
SELECT last_name , department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

#满外连接
SELECT last_name , department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
UNION ALL
SELECT last_name , department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;

#UNION：去重
#UNION ALL:不去重，优先选择

#自然连接：NATURAL JOIN 自动连接两张表中所有相同的字段然后进行等值连接
SELECT last_name , department_name
FROM employees NATURAL JOIN departments;

#USING:找两个表中同名的字段进行等值连接
SELECT employees.employee_id , departments.department_name
FROM employees JOIN departments
USING (department_id);