-- 컬럼 삭제 (schemas를 기본설정 해 놔야 해당 구문이 작동)
ALTER TABLE borad DROP COLUMN boradcol;

-- 데이터 입력
INSERT INTO member (
id
, nickname
, level
)VALUES(
-- id
'user05'
-- nickname
, '호구1'
-- level
, '1'
)
;
select*from member;

DELETE FROM boradMaster where seq=3;

select*from boradMaster;

insert into boradMaster(
seq
, name
)values(
'3'
,'카페 조직도'
)
;
insert into borad(
type
, title
, regSeq
, regDatetime
, boradMaster_seq
)values(
-- type
'3'
-- title
, '어제 배에서 놀다가 손모가지 날라감 ㅠㅠ'
-- regSeq
, '7'
-- regDatetime
, now()
-- boradMaster_seq
, '5'
)
;
select*from boradComment;

-- 코멘트 입력
insert into boradComment(
comment
, regSeq
, borad_seq
)values(
-- comment
'밑장뺴는 소리 다 들린다.'
-- regSeq
, '3'
-- borad_seq
, '5'
)
;
insert into boradCount(
regSeq
, regIp
, regDatetime
, borad_seq
)values(
-- regSeq
'8'
-- regIp
, '광식이 컴퓨터'
-- regDatetime
, now()
-- borad_seq
, '5'
)
;
insert into boardLike(
borad_seq
, member_seq
)values(
-- borad_seq
'5'
-- member_seq
, '7'
)
;
insert into boardAttached(
type
, path
, fileNameOri
, fileName
, size
, extension
, board_seq
)values(
-- type
'1'
-- path
, 'www.asdasdasqweasd.co.kr'
-- fileNameOri
, 'img1'
-- fileName
, '광렬의 울음'
-- size
, '24'
-- extension
, '???'
-- board_seq
, '5'
);


