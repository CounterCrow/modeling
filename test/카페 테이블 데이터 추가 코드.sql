-- naver_cafe 내용 삽입
-- 카페 맴버
INSERT INTO member(
naver_id
,nickname
,class
,member_DT_update
,member_DT_created
,member_DT_delete
) VALUES (
-- naver_id
'guest002'
-- nickname
, '호구2'
-- class
, 'Manager'
-- member_DT_update
, now()
-- member_DT_created
, now()
-- member_DT_delete
, null
)
;
SELECT*FROM member;
-- 내용 업데이트
UPDATE member SET class = 'member' WHERE seq = '7';

-- 카페 게시글
INSERT INTO Bulletin(
Bulletin_type
, Bulletin_title
, Bulletin_text
, Bulletin_DT_created
, Bulletin_DT_update
, Bulletin_DT_delete
, member_seq
) VALUES (
-- Bulletin_type
'필독'
-- Bulletin_title
, '개짓거리하지맙시다.'
-- Bulletin_text
, '기술쓰면 손모가지 날라가요?'
-- Bulletin_DT_created
, now()
-- Bulletin_DT_update
, now()
-- Bulletin_DT_delete
, NULL
-- member_seq
, '1'
)
;
SELECT*FROM Bulletin;



