-- 열에 별칭 지정 (AS 사용)
--- sql
SELECT ENAME AS "사원 이름" FROM EMP;
--> ENAME 컬럼을 "사원 이름"이라는 이름으로 출력

-- 연산식에 별칭 지정
-- sql
SELECT ENAME AS "사원 이름", SAL * 12 AS "연봉 상여금 미포함" FROM EMP;
--> 연봉 계산 후 “연봉 상여금 미포함”라는 이름으로 출력

-- AS 없이 별칭 지정 (공백 없는 경우만)
-- sql
SELECT ENAME "직원", JOB "직 무" FROM EMP;
--> 공백 없이 따옴표 없이도 가능하지만, 가독성 위해 AS 권장

