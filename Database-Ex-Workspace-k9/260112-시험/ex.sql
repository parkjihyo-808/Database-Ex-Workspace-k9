-- 1. 테이블 설계
-- 1) OTT 서비스 및 금액 정보를 담는 테이블
CREATE TABLE ott_party (
    party_id    NUMBER PRIMARY KEY,
    service_name VARCHAR2(20),  -- 예: '넷플릭스'
    total_pay   NUMBER,         -- 총 결제금액 (예: 17000)
    per_pay     NUMBER          -- 1인당 분담금 (총액 / 4)
);

-- 2) 웨이팅 멤버 리스트 테이블
CREATE TABLE ott_wait_list (
    wait_no     NUMBER PRIMARY KEY,
    party_id    NUMBER REFERENCES ott_party(party_id),
    user_name   VARCHAR2(20) NOT NULL,
    is_paid     CHAR(1) CHECK (is_paid IN ('Y', 'N')), -- 입금 여부
    join_date   DATE DEFAULT SYSDATE
);

-- 2. 데이터 삽입
-- 파티 정보 추가 (17000원 / 4인 = 4250원)
INSERT INTO ott_party VALUES (1, '넷플릭스', 17000, 4250);

-- 멤버 4명 추가 (방장은 입금 완료, 나머지는 아직)
INSERT INTO ott_wait_list VALUES (1, 1, '박지효(파티장)', 'Y', SYSDATE);
INSERT INTO ott_wait_list VALUES (2, 1, '정윤오', 'N', SYSDATE);
INSERT INTO ott_wait_list VALUES (3, 1, '최지우', 'N', SYSDATE);
INSERT INTO ott_wait_list VALUES (4, 1, '배주현', 'N', SYSDATE);

-- 3. 질의 결과
-- 현재 파티 멤버 현황과 미납자 확인
SELECT P.SERVICE_NAME AS "서비스",
       W.USER_NAME AS "멤버명",
       P.PER_PAY AS "내야할돈",
       W.IS_PAID AS "입금여부"
FROM ott_party P, ott_wait_list W
WHERE P.party_id = W.party_id
ORDER BY W.wait_no;