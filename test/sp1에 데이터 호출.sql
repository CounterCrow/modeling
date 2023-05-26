-- 게시판 모양대로 불러오기 (서브쿼리로만 처리)-조인 없이
select
a.type
, a.title
, (select count(*)
from boradComment cc
where 1=1
and cc.borad_seq = a.Seq
)as 댓글
-- 셀렉트로 묶어서 처리
, (select nickname
from member aa
where 1=1
and aa.seq = a.regSeq
)as 작성자
, (select level
from member aa
where 1=1
and aa.seq = a.regSeq
)as level
-- 일반으로
, a.regDatetime
-- 셀렉트로 묶어서 처리
, (select 
	count(*)
    from boradCount bb
    where 1=1
    and bb.borad_seq = a.seq
)as 조회수
from borad a
where 1=1
;
-- 게시판 모양대로 불러오기 (맴버 테이블 서브쿼리 없이)-조인 있이
select
a.type
, a.title
, (select count(*)
from boradComment cc
where 1=1
and cc.borad_seq = a.Seq
)as 댓글
-- 셀렉트로 묶어서 처리
,aa.nickname
,aa.level
-- 일반으로
, a.regDatetime
-- 셀렉트로 묶어서 처리
, (select 
	count(*)
    from boradCount bb
    where 1=1
    and bb.borad_seq = a.seq
)as 조회수
from borad a
	left join member aa on aa.seq = a.regSeq
where 1=1
;