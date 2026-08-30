USE atguigudb;

#函数语句

#字符串连接: CONCAT()
#MySQL字符串用'' ,别名用 ""
SELECT CONCAT(emp.last_name , ' worked for ' , mgr.last_name)
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id;

#字符串的索引从 1 开始
#INSERT('原字符串' ，起始位置 ，删除多少字符 ，'要插入的新字符串')
#REPLACE(原字符串 ，要替换的字符串 ，新字符串)
SELECT INSERT('helloworld',2 ,3,'a') ,REPLACE('hello' , 'll' ,'cc')
FROM dual;

#日期操作函数
#EXTRACT(type FROM date):返回日期中特定的部分，type指定返回的值
SELECT EXTRACT(DAY FROM NOW())
FROM dual;

#DATE_ADD(datatime , INTERVAL expr timetype)
SELECT NOW() "now" , DATE_ADD(NOW() , INTERVAL 1 YEAR) "one year after",
       DATE_ADD(NOW() , INTERVAL -1 YEAR) "one year later"
FROM dual

#流程控制
#IF(value ,value1 ,value2):value为  true返回value1否则返回value2
#IFNULL(value1 ， value2)：value1不为空返回value1，否则返回value2

#CASE:
SELECT employees.last_name,employees.salary,
       CASE WHEN employees.salary > 10000 THEN '牛'
            WHEN employees.salary > 6000 THEN '行'
            ELSE '良' END
FROM employees;

#聚合函数
#AVG = SUM / COUNT
SELECT AVG(employees.salary) , SUM(employees.salary) ,MAX(salary) ,MIN(salary),
       MAX(last_name)
FROM employees;

#COUNT:计算指定字段在表结构中出现的次数(不包含 NULL)
SELECT COUNT(employees.salary),COUNT(department_id),COUNT(1) ,COUNT(0),COUNT(commission_pct)
FROM employees;

#GROUP BY:SELECT语句里出现的非组函数字段必须出现在 GROUP BY 中
#GROUP BY 声明在 FROM,WHERE后，ORDER BY , LIMIT前
SELECT employees.department_id , AVG(employees.salary)
FROM employees
GROUP BY department_id;
#“二级分组 ”
SELECT department_id ,job_id, AVG(employees.salary)
FROM employees
GROUP BY department_id , job_id;

SELECT department_id ,job_id, AVG(employees.salary)
FROM employees
GROUP BY  job_id , department_id;

#HAVING:过滤条件中出现组函数必须用 HAVING过滤,跟 GROUP BY一起使用并且声明在 GROUP BY 后
SELECT employees.department_id , MAX(employees.salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

SELECT employees.department_id , MAX(employees.salary)
FROM employees
#WHERE department_id IN (10 ,20 ,30,40) :优先这种写法
GROUP BY department_id
HAVING MAX(salary) > 10000 AND department_id IN (10 ,20 ,30 ,40);

