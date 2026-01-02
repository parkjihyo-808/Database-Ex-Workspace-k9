--1) 이름이 'SCOTT'인 사원을 대소문자 구분 없이 찾기
SELECT * FROM EMP
WHERE UPPER(ENAME) = 'SCOTT';

--2) 이름의 길이가 5 이상인 사원만 출력
SELECT * FROM EMP
WHERE LENGTH(ENAME) >= 5;

--3) 직무에서 'S' 문자가 포함된 행만 출력
--힌트) INSTR(JOB, 'S')
SELECT * FROM EMP
WHERE INSTR(JOB, 'S') > 0;