-- ① 단일 열에서 중복 제거
-- sql
SELECT DISTINCT JOB FROM EMP;
-- ALL 생략이 된 상태. 
SELECT JOB FROM EMP;

-- > EMP 테이블에서 **중복 없는 직무 리스트** 출력

-- ② 다중 열에서 중복 제거  
-- sql
SELECT DISTINCT JOB, DEPTNO FROM EMP;
SELECT JOB, DEPTNO FROM EMP;

-- > 직무와 부서번호의 **조합이 중복되지 않는** 행만 출력
