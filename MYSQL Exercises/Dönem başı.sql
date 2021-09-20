-- before beginning to lab-work
-- connect to schema you have created and
-- run demo.sql script

-- 1. Display all data in emp table
select * from emp;
-- 2. Display all data in dept table
select * from dept;
-- 3. Display all data in salgrade table
select * from salgrade;
-- 4. Display all data in bonus table
select * from bonus;
-- 5. Find names of all employees
select ename from emp;
-- 6. Find names and jobs of all employees
select ename, job from emp;
-- 7. Find all jobs
select job from emp;
-- 8. Find all jobs
select distinct job from emp;
-- 9. Find names of all employees working as clerk
select ename from emp where job="clerk";
-- 10. Find names, salaries of all employees working as clerk
-- and whose salary is higher than 1000
select ename, sal from emp where job='clerk' and sal>1000;
-- 11. Find total amount earned by employees in one month
select sum(sal) from emp;
-- 12. Find average salary of employees
select avg(sal) from emp;
-- 13. Find maximum salary of employees
select max(sal) from emp;
-- 14. Find minimum salary of employees
select min(sal) from emp;
-- 15. Find number of employees
select count(*) from emp;
select count(empno) from emp;
-- 16. Find number of jobs
select count(job) from emp; -- returns 14
-- 17. Find number of jobs
select count(distinct job) from emp; -- returns 5
-- 18. Find annual salary of smith
select sal*12 from emp where ename='smith';
-- 19. Find names and annual salaries of mployees
select sal*12 as annualsal, ename employeename from emp;
-- 20. Find who has no manager
select ename from emp where mgr=NULL; -- returns nothing
-- NULL means no value and be compared
select ename from emp where mgr is NULL; -- returns KING