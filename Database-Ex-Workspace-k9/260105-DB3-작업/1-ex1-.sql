SELECT empno, ename, sal, deptno
FROM EMP
minus 
SELECT empno, ename, sal, deptno 
FROM EMP
where deptno = 10;
