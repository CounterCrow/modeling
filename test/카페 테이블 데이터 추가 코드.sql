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
, Bulletinl_hits
, Bulletinl_like
, Bulletin_DT_created
, Bulletin_DT_update
, Bulletin_DT_delete
, member_seq
) VALUES (
-- Bulletin_type
'일반'
-- Bulletin_title
, '니들은 이런거 하지마라'
-- Bulletin_text
, '어제 똥식이네 놀이터에서 놀다가 장기털릴뻔했네요 ㅎㄷㄷ'
-- Bulletinl_hits
, '187'
-- Bulletinl_like
, '1'
-- Bulletin_DT_created
, now()
-- Bulletin_DT_update
, now()
-- Bulletin_DT_delete
, NULL
-- member_seq
, '7'
)
;
SELECT*FROM Bulletin;
-- 게시글 타입 변경으로 인한 내용 삽입
UPDATE Bulletin SET Bulletin_type = '필독' WHERE seq = '1';

-- 게시글 첫번째 좋아요랑 조회수 초기값 입력(임의)
UPDATE Bulletin SET Bulletinl_like = '72' WHERE seq = '1';

-- Bulletin_comments 데이터 삽입
INSERT INTO Bulletin_comments(
comments_author
, comments_text
, comments_DT_create
, comments_DT_update
, comments_DT_delete
, Bulletin_seq
, member_seq
)VALUES(
-- comments_author
(select comments_author from  LEFT JOIN member aa)
-- comments_text
, '똥식이 요즘 뭐해요?'
-- comments_DT_create
, now()
-- comments_DT_update
, now()
-- comments_DT_delete
, null
-- Bulletin_seq
, '5'
-- member_seq
, '1'
)
;
select*from Bulletin_comments;
