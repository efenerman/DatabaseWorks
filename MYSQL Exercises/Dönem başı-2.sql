-- 1. display names and salaries of employees
-- with increasing order of salaries
SELECT ENAME, SAL FROM EMP ORDER BY SAL ASC;
SELECT ENAME, SAL FROM EMP ORDER BY SAL;

-- 2. same with decreasing order
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC;

-- 3. display names of employees beginning with "A"
SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%';

-- 4. display names of employees 
-- with second character "A"
SELECT ENAME FROM EMP WHERE ENAME LIKE '_A%';

-- 5. display jobs ending with "MAN"
SELECT JOB FROM EMP WHERE JOB LIKE '%MAN';

-- 6. Display names, jobs and salaries of employees
-- which have salary between 2000 and 3000 in two ways
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL>=2000 AND SAL<=3000;
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- 7. Display jobs and names of employees concatenated with "-"
-- use alias "EMPLOYEES"
SELECT CONCAT(JOB,'-',ENAME) AS EMPLOYEES FROM EMP;

-- 8. Display names of employees and 
-- the number of charters in their names
SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- 9. Display names of employees with department names
SELECT ENAME, DNAME FROM EMP, DEPT WHERE DEPT.DEPTNO=EMP.DEPTNO;

-- 10.Display names, salaries and salary grades of employees
SELECT ENAME, SAL, GRADE FROM EMP, SALGRADE
WHERE EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;

-- 11.Display names of employees and names of their managers
SELECT WORKER.ENAME, MANAGER.ENAME FROM EMP WORKER, EMP MANAGER 
WHERE WORKER.MGR=MANAGER.EMPNO;

-- 12. Display department names and employee names
-- all departments must be displayed
SELECT DEPT.DNAME, EMP.ENAME FROM DEPT
LEFT OUTER JOIN EMP ON EMP.DEPTNO=DEPT.DEPTNO;

-- 13. Display employee names and department
-- names for all departments 
-- use RIGHT OUTER JOIN
SELECT DEPT.DNAME, EMP.ENAME FROM EMP
RIGHT OUTER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;

-- 14. Display department number and average salary for 
-- each department
SELECT DEPTNO, AVG(SAL) FROM EMP
GROUP BY DEPTNO;

-- 15. Display jobs and minimum salary for each job
SELECT JOB, MIN(SAL) FROM EMP
GROUP BY JOB;

-- 16. Display department numbers and minimum salary for
-- those departments of which minimum salary is lower
-- than 1300
SELECT DEPTNO, MIN(SAL) FROM EMP
GROUP BY DEPTNO 
HAVING MIN(SAL)<1300;

-- 17. Display department names and number of employees
-- working in each department
SELECT DEPT.DNAME, COUNT(EMP.EMPNO) FROM DEPT
LEFT OUTER JOIN EMP ON EMP.DEPTNO=DEPT.DEPTNO
GROUP BY DEPT.DNAME;

-- 18. Display names and salaries of employees who earn more
-- than JONES(7566)
SELECT ENAME, SAL FROM EMP
WHERE SAL>(SELECT SAL FROM EMP WHERE EMPNO=7566);

-- 19. Display name and salary of the employees who earns
-- less than others
SELECT ENAME, SAL FROM EMP
WHERE SAL=(SELECT MIN(SAL) FROM EMP);

-- 20. Display employees names and salaries whose salary is 
-- greater than the average salaries of all departments
-- Hint: Use ALL
SELECT ENAME, SAL FROM EMP 
WHERE SAL>ALL(SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO);

-- 21. Display names and jobs of employees whose salary 
-- is less than any clerk and who are not clerks
-- Hint: Use ANY
SELECT ENAME, JOB FROM EMP
WHERE SAL<ANY(SELECT SAL FROM EMP WHERE JOB='CLERK')
AND JOB<>'CLERK';

-- 22. Display employee number and names for all employees
-- who earn more than average salary
SELECT EMPNO, ENAME FROM EMP
WHERE SAL>(SELECT AVG(SAL) FROM EMP);