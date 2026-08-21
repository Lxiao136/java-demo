#2026/8/21

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