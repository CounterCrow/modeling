
-- addperson
select * from addPerson;

-- email
select * from email;

-- 삭제구문
-- DELETE FROM  WHERE seq = ;

select 
seq
, nameFamily
, nameMiddle
, nameFirst
from
addPerson
;

select
seq
, emailAddress
from
email
;

-- 검색 연습

SELECT * FROM addPerson
WHERE 1=1
-- nameFamily = '홍'
-- AND nickName like '%crow'
-- AND seq = 7
-- AND memo like '바%'
-- AND seq >= 3
-- AND seq BETWEEN 3 AND 8
-- AND importCheck = 2
-- AND nameMiddle = ''
;
-- join 

SELECT
a.seq
,a.nameFamily
,a.nameMiddle
,a.nameFirst
,b.emailAddress
from
	addPerson a
 --  INNER JOIN email b ON b.addPerson_seq = a.seq
	left JOIN email b ON b.addPerson_seq = a.seq
    -- JOIN email b ON b.addPerson_seq = a.seq AND b.defaultNY = "1"  [도 가능하다.]
where 1=1
-- AND b.defaultNY = "1"
-- AND b.emailAddress like "%naver%"
;