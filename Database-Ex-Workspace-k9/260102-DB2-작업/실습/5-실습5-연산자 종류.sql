--1) 'CLERK'인 사원 중 급여가 1000에서 1500 사이인 사원을 조회
SELECT * FROM EMP
WHERE JOB = 'CLERK' 
  AND SAL BETWEEN 1000 AND 1500;

--2) 이름에 ‘AM’을 포함하는 사원 이름과 직무를 출력
SELECT ENAME, JOB FROM EMP
WHERE ENAME LIKE '%AM%';

--3) 부서번호가 10번인 사원 중, 직무가 'MANAGER'가 아닌 사원을 출력. 단, MGR이 NULL인 사람도 포함
--힌트) mgr IS NULL
SELECT * FROM EMP
WHERE DEPTNO = 10 
  AND (JOB != 'MANAGER' OR MGR IS NULL);