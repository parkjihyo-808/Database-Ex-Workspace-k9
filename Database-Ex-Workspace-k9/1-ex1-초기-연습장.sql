-- 샘플 emp 테이블 조회 해보기
-- vscode에서 실행하는 방법: ctrl + enter
-- 주의사항: 최초 실행 시, vasode 측에서 서버 선택 메뉴가 나오면 이전에 설치한 연결 설정을 선택
select * from emp;

-- 현재 시간 조회
select sysdate from dual;

-- ① 셀렉션(Selection) – 행 중심 조회
-- 특정 조건을 만족하는 **행(Row)**만 조회
-- sql
-- SELECT *: 해당 테이블의 모든 칼럼을 조회
--FROM EMP: 조회할 테이블 명
-- WHERE 컬럼명 = 값;: 조건을 만족하는 문구
-- 예시) WHERE JOB = 'MANAGER';
-- 해석: emp 테이블에서 조건 job 컬럼의 값이  manager인 사원을 찾음
-- 찾을 때 보고 싶은 열은 모든 컬럼
SELECT * FROM EMP
WHERE JOB = 'MANAGER';

-- ② 프로젝션(Projection) - 열 중심 조회
-- 특정 **열(Column)**만 선택하여 조회
-- sql
-- 보고 싶은 열에 ENAME 사원 이름, SAL 급여
SELECT ENAME, SAL FROM EMP;
-- 보고 싶은 열? 모든 열
SELECT * FROM EMP;

-- ③ 셀렉션 + 프로젝션 함께 사용
-- sql
-- 보고 싶은 열: ENAME 사원 이름, SAL 급여
-- 조건: SAL > 2000 사원만 조회
SELECT ENAME, SAL FROM EMP
WHERE SAL > 2000;

