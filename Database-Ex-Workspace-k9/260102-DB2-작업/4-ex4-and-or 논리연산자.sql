--- 기본 문법 및 예시

-- ① AND 연산자 사용
-- 모든 조건을 **동시에 만족**해야 출력
-- sql
SELECT * FROM EMP
WHERE DEPTNO = 30
AND
JOB = 'SALESMAN';
--> 부서가 30번이고 직무가 SALESMAN인 사원만 출력

-- ② OR 연산자 사용
-- **하나라도 만족**하면 출력
-- sql
SELECT * FROM EMP
WHERE JOB = 'CLERK' OR JOB = 'MANAGER';
--> 직무가 CLERK이거나 MANAGER인 사원 모두 출력

-- ③ 괄호 사용 (우선순위 명확히 하기)
-- sql
SELECT * FROM EMP
WHERE (DEPTNO = 10 OR DEPTNO = 20)
AND SAL > 2000;
--> 부서번호가 10 또는 20이고, 급여가 2000 초과인 경우


--- 6. 원리, 구조 (쉬운 비유)

-- **AND**: "내가 부서가 30이면서 동시에 직무도 SALESMAN이어야만 포함돼!"
-- **OR**: "내가 CLERK이거나, MANAGER이기만 하면 포함돼!"
-- 괄호는 수학처럼 조건 묶는 순서를 바꿔서 **논리 우선순위 제어**하는 데 사용


--- 7. 실무 활용 사례

-- AND: "이벤트 참여자 중 나이가 20세 이상이면서, 구매 금액이 10만 원 이상인 사람"
-- OR: "고객 등급이 VIP거나 GOLD인 경우 할인 적용"
-- 괄호 사용: "서울 또는 부산 거주자 중, 1년 이상 된 회원"
