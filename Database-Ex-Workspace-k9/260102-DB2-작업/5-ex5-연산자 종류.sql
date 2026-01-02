-- 중요함.!!
-- ### ✅ LIKE 연산자  
-- ```sql
SELECT * FROM EMP WHERE ENAME LIKE 'S%';       -- S로 시작  
SELECT * FROM EMP WHERE ENAME LIKE '_L%';      -- 두 번째 글자가 L  
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';     -- AM 포함  
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%'; -- AM 포함하지 않음
-- ```


-- ### ✅ IS NULL / IS NOT NULL  
-- ```sql
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE COMM IS NOT NULL;
-- ```