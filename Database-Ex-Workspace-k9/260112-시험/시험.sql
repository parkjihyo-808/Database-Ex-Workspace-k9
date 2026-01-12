-- 0. 다음의 작업을 system사용자로 접속하여 그림과 같이 emp(사원), dept(부서) 테이블과 데이터를 참고하여 작성한다. 
-- (단 이미 테이블이 생성되어있을 때는 drop 명령어로 테이블을 삭제 후 시작. )
DROP TABLE emp cascade constraints;
DROP TABLE dept cascade constraints;

-- 1) DEPT 테이블 생성
CREATE TABLE DEPT (
    DEPTNO VARCHAR2(6)  CONSTRAINT DEPT_DEPTNO_PK PRIMARY KEY,
    DNAME  VARCHAR2(10) CONSTRAINT DEPT_DNAME_NN NOT NULL 
                        CONSTRAINT DEPT_DNAME_UNQ UNIQUE,
    AREA   VARCHAR2(10)
);
-- 2) EMP 테이블 생성
CREATE TABLE EMP (
    EMPNO    NUMBER       CONSTRAINT EMP_EMPNO_PK PRIMARY KEY, 
    NAME     VARCHAR2(10) CONSTRAINT EMP_NAME_NN NOT NULL
                          CONSTRAINT EMP_NAME_UNQ UNIQUE,    
    DEPTNO   VARCHAR2(6)  CONSTRAINT EMP_DEPTNO_FK REFERENCES DEPT(DEPTNO),
    POSITION VARCHAR2(10) CONSTRAINT EMP_POS_CHK CHECK (POSITION IN ('사원', '대리', '과장', '부장')),
    PAY      NUMBER       CONSTRAINT EMP_PAY_NN NOT NULL,
    PEMPNO   NUMBER
);

-- 3) 데이터 삽입
-- 3-1) 부서 데이터 넣기
INSERT INTO dept VALUES ('101', '영업부', NULL);
INSERT INTO dept VALUES ('102', '총무부', NULL);
INSERT INTO dept VALUES ('103', '기획부', NULL);
INSERT INTO dept VALUES ('104', '홍보부', NULL);

SELECT * FROM DEPT;

-- 3-2) 사원 데이터 넣기
INSERT INTO emp VALUES (1001, '홍길동', '101', '부장', 450, NULL);
INSERT INTO emp VALUES (1002, '김연아', '102', '부장', 400, NULL);
INSERT INTO emp VALUES (1003, '박지성', '101', '과장', 350, 1001);
INSERT INTO emp VALUES (1004, '김태균', '103', '과장', 410, NULL);
INSERT INTO emp VALUES (1005, '서찬수', '101', '대리', 300, 1003);
INSERT INTO emp VALUES (1006, '김수현', '103', '대리', 400, 1004);
INSERT INTO emp VALUES (1007, '정동민', '102', '대리', 320, 1002);
INSERT INTO emp VALUES (1008, '이성규', '102', '사원', 380, 1007);
INSERT INTO emp VALUES (1009, '임진영', '103', '사원', 250, 1006);
INSERT INTO emp VALUES (1010, '서진수', '101', '사원', 200, 1005);

SELECT * FROM EMP;


-- 1. 아래의 값에 맞게 emp테이블에 데이터를 추가하라.
-- 사원번호:1011, 이름:이순신, 부서번호:104, 직책:부장, 급여:500, 직속상사:NULL
INSERT INTO emp (empno, name, deptno, position, pay, pempno)
VALUES (1011, '이순신', '104', '부장', 500, NULL);

SELECT * FROM EMP;


-- 2. dept 테이블에 area 필드의 값을 영업부는 서울, 나머지는 부산으로 값을 업데이트하라.
UPDATE dept SET area = '부산';
UPDATE dept SET area = '서울' WHERE dname = '영업부';

SELECT * FROM DEPT;


-- 3. emp 테이블에서 부서 이름이 홍보부인 데이터를 삭제하라. 
DELETE FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE dname = '홍보부');

SELECT E.NAME, E.DEPTNO, D.DNAME
FROM emp E, dept D
WHERE E.deptno = D.deptno;


-- 4. emp 테이블을 사용하여 이름,  급여, 세금을 출력하라. 단 세금은 급여가 0-200이면 급여의 5%, 201-300이면 
-- 급여의 10%, 301-400 이면 급여의 15%, 나머지는 급여의 20%로 지정한다.(case문, decode문 각각 2가지로 작성.)
-- 4-1) CASE 문
SELECT NAME AS "이름", 
       PAY AS "급여",
       CASE 
            WHEN PAY BETWEEN 0 AND 200   THEN PAY * 0.05
            WHEN PAY BETWEEN 201 AND 300 THEN PAY * 0.10
            WHEN PAY BETWEEN 301 AND 400 THEN PAY * 0.15
            ELSE PAY * 0.20
       END AS "세금"
FROM EMP;

-- 4-2) DECODE문
SELECT NAME AS "이름", 
       PAY AS "급여",
       DECODE(SIGN(PAY - 200), -1, PAY * 0.05, 0, PAY * 0.05, 
              DECODE(SIGN(PAY - 300), -1, PAY * 0.10, 0, PAY * 0.10,
                     DECODE(SIGN(PAY - 400), -1, PAY * 0.15, 0, PAY * 0.15, 
                            PAY * 0.20))) AS "세금"
FROM EMP;


-- 5. 영업부 직원과 총무부 직원의 이름, 부서명, 직급을 이름순으로 오름차순으로 출력하라.
SELECT E.NAME, D.DNAME, E.POSITION
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.DNAME IN ('영업부', '총무부')
ORDER BY E.NAME ASC;


-- 6. emp 테이블을 이용하여 사원의 이름과 직속상관의 이름을 출력하라. 단 직속상관이 없는 경우 null이 표시되도록 하라.
SELECT E.NAME AS "사원명",
       M.NAME AS "직속상관명"
FROM EMP E
LEFT OUTER JOIN EMP M ON E.PEMPNO = M.EMPNO
ORDER BY E.EMPNO;


-- 7. 부서별 급여의 평균이 350 이상인 부서의 부서명, 급여의 평균을 구하라.
SELECT D.DNAME AS "부서명",
       AVG(E.PAY) AS "급여평균"
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME
HAVING AVG(E.PAY) >= 350;


-- 8. emp 테이블에서 각 부서별 급여가 가장 높은 사람의 이름, 부서명, 급여를 출력하라(sub query).
SELECT E.NAME, D.DNAME, E.PAY
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND (E.DEPTNO, E.PAY) IN (
      SELECT DEPTNO, MAX(PAY)
      FROM EMP
      GROUP BY DEPTNO
  );


-- 9. emp 테이블에서 이성규와 같은 부서의 직원의 이름과 부서명을 출력하라.(sub query)
SELECT E.NAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
  AND E.DEPTNO = (
      SELECT DEPTNO 
      FROM EMP 
      WHERE NAME = '이성규'
  );


-- 10. 과장의 최소급여보다 높은 급여를 받는 사람의 이름, 직급, 급여를 출력하라.(sub query)
SELECT NAME, POSITION, PAY
FROM EMP
WHERE PAY > (
    SELECT MIN(PAY)
    FROM EMP
    WHERE POSITION = '과장'
);
