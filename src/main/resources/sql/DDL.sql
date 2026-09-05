USE atguigudb;
# DDL:CREATE ALTER DROP RENAME TRUNCATE
#创建和管理数据库

CREATE DATABASE test1;
CREATE DATABASE IF NOT EXISTS test2 CHARACTER SET 'UTF8';
#CREATE DATABASE test1 CHARACTER SET ''; 显示地指明字符集
#CREATE DATABASE IF NOT EXISTS test1 CHARACTER SET '';(推荐)

SHOW CREATE DATABASE test1;#查看数据库字符集

#查看当前连接的所有数据库
SHOW DATABASES ;

#切换数据库
USE test1;

#查看当前数据库里的表
SHOW TABLES ;

#查看目前使用的数据库
SELECT DATABASE();

#查看指定数据库下保存的数据表
SHOW TABLES FROM atguigudb;

#修改数据库字符集
#ALTER DATABASE test1 CHARACTER SET GBK;
ALTER DATABASE test1 CHARACTER SET UTF8;
SHOW CREATE DATABASE test1;

#删除数据库
DROP DATABASE IF EXISTS test2;
SHOW DATABASES ;

#创建表
#方法一：
CREATE TABLE IF NOT EXISTS my_emp1(
   id INT,
   last_name VARCHAR(15),
   hire_date DATE
);
SHOW TABLES;

#方法二：e2表里的数据跟e里一样
#查询语句中的别名可以作为新表的字段名
USE test1;
CREATE TABLE my_emp2
AS
SELECT employee_id,last_name,salary
FROM atguigudb.employees;
SHOW TABLES;

#方法二复制字段不复制数据
use test1;
CREATE TABLE emp3
AS
SELECT *
FROM atguigudb.employees
WHERE 1 = 2;
SHOW TABLES;

SELECT *
FROM emp3;


#修改表: ALTER TABLE
USE test1;
DESC emp3;

    #添加字段:ADD
        ALTER TABLE emp3
        ADD new varchar(10) AFTER department_id;

    #修改字段(MODIFY): 数据类型、长度、默认值(DEFAULT)
        ALTER TABLE emp3
        MODIFY email VARCHAR(28) DEFAULT "2715@";

    #重命名字段:CHANGE 可以重命名也可以改长度
        ALTER TABLE emp3
        CHANGE salary month_salary double(10,2);

    #删除字段:DROP COLUMN
        ALTER TABLE emp3
        DROP COLUMN new;


#重命名表：RENAME
    RENAME TABLE emp3
    TO emp33;

    #方式二：
        /*
        ALTER TABLE emp33
        RENAME TO emp3;
        */


#删除表:DROP
    DROP TABLE IF EXISTS emp44;


#清空表(TRUNCATE):清空表内数据，不删除表结构
    #TRUNCATE TABLE emp3;


#COMMIT:提交操作。一旦执行后，数据永久保留在库中意味着不可回滚
#ROLLBACK：回滚数据。执行ROLLBACK后数据回滚到最近一次的COMMIT

#DML执行了 "SET autocommit = FALSE;" 则数据能回滚。(DDL不受影响)