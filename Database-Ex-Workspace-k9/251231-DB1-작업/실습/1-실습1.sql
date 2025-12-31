--1) 급여가 3000 이상인 직원만 조회
-- 셀렉션 : 급여가 3000 이상
-- 프로젝션 : 언급 없음 -> 모든 컬럼 
SELECT * FROM EMP WHERE SAL >= 3000;

--2) MP 테이블에서 이름(ENAME), 급여(SAL), 부서번호(DEPTNO)만 조회
-- 셀렉션 : 조건 없음
-- 프로젝션 : 이름(ENAME), 급여(SAL), 부서번호(DEPTNO)
SELECT ENAME, SAL, DEPTNO FROM EMP;

--3) 20번 부서의 사원 이름과 급여를 조회
-- 셀렉션: 20번 부서
-- 프로젝션: 사원 이름(ENAME), 급여(SAL)
SELECT ENAME, SAL FROM EMP WHERE DEPTNO = 20;