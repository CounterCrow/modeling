
-- addperson
select * from addPerson;

-- email
select * from email;

-- 삭제구문
-- DELETE FROM  WHERE seq = ;

-- 업데이트 구문
UPDATE email SET emailAddress = "change@gmail.com" WHERE seq = "7"
; 

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
AND b.defaultNY = "1"
-- AND b.emailAddress like "%naver%"
ORDER BY a.seq
-- asc 는 순차정렬(한글도 가능, 기본으로 적용됨)
-- ORDER BY a.seq asc
-- desc 는 역순정렬(한글도 가능, 역순으로 정렬)
-- ORDER BY a.seq desc
;
-- sub qurry
SELECT
a.seq
,a.nameFamily
,a.nameMiddle
,a.nameFirst
,b.emailAddress
,(SELECT
	COUNT(*)
    FROM email aa
    WHERE 1=1
		AND aa.addPerson_seq = a.seq
) as email_count
from
	addPerson a
	left JOIN email b ON b.addPerson_seq = a.seq
where 1=1
AND b.defaultNY = 1
;

-- 폰 과 addPerson 조인

SELECT
a.seq
,a.nameFamily
,a.nameMiddle
,a.nameFirst
,c.phoneWhere
,c.phoneNum
,b.emailAddress
,(SELECT
	COUNT(*)
    FROM email aa
    WHERE 1=1
		AND aa.addPerson_seq = a.seq
) as email_count
,(SELECT
	COUNT(*)
    FROM phone cc
    WHERE 1=1
    AND cc.addPerson_seq = a.seq
) as phone_count
FROM 
	addPerson a
	LEFT JOIN email b ON b.addPerson_seq = a.seq AND b.defaultNY = 1
    LEFT JOIN phone c ON c.addPerson_seq = a.seq AND c.defaultNY = 1
WHERE 1=1
ORDER BY email_count
    ;
    