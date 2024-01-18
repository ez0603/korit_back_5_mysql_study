select * from student_tb;
# *의 의미는 전체 컬럼

select  # from = student_tb에 있는 student_id,name을 꺼냄, where = student_id가 1인 것을 선택, (3.select, 1.from ,2.where -> 컴퓨터가 찾아오는 순서)
	student_id, # 컬럼은 한줄에 무조건 하나
	name,
    age
from 
	student_tb 
where 
	not name = '김준일'
    and name = '김준이'; 
    
select
	*
from
	student_tb
where
	name in ('김준일', '김준이'); # or 과 동일함
    
select
	*
from
	student_tb
where
	student_id in (1, 2, 3);
    
truncate table student_tb;

/*
	10명의 학생 정보 추가
    김도균 27 부산 금정구
    김도훈 25 부산 부산진구
    김범수 33 부산 금정구
    김상현 26 부산 남구
    이재영 26 부산 서구
    이정찬 29 부산 부산진구 
    이지언 26 부산 동래구 
    이편원 30 경상남도 양산시 
    전주환 30 부산 부산진구 
    심재원 29 부산 남구
*/

insert into student_tb
    
    values
		(0, '김도균', 27, '부산 금정구'),
		(0, '김도훈', 25, '부산 부산진구'),
		(0, '김범수', 33, '부산 금정구'),
		(0, '김상현', 26, '부산 남구'),
		(0, '이재영', 26, '부산 서구'),
		(0, '이정찬', 29, '부산 부산진구'),
		(0, '이지언', 26, '부산 동래구'),
		(0, '이평원', 30, '경상남도 양산시'),
		(0, '전주환', 30, '부산 부산진구'),
		(0, '심재원', 29, '부산 남구');

select
	*
from
	student_tb
where
	age between 20 and 29; # between = 숫자, 날짜 

select
	*
from
	student_tb
where
	age >= 29
    and age <= 39;
    
select
	*
from
	student_tb
where
	name like '김%'; # name이 김으로 시작하면 뽑아냄 / %, __(언더바2개) -> 글자수를 맞추는 경우는 언더바 사용, 양쪽에 % = 글자만 포함되면 뽑음(ex>%원%)
    
# 원으로 끝나고 중간에 도가 들어가는 사람 뽑기 

select
	*
from
	student_tb
where
	name like '%원'
    or name like '%도%'; # like와 in은 같이 쓰지 못한다.
    
# 집계(그룹화) DB에서 갯수 = 한줄
select # 4번 -> 마지막에 뽑아냄
	address, 
	count(*) as address_count # as(알리아스) = 컬럼 이름 변경
from # 1번
	student_tb
group by # adress가 같은걸로 묶어준다 2번 -> 그룹을 먼저 묶고 뽑아냄
	address 
having # 3번 where과 비슷하지만 having = 그룹화 한 뒤 
	address_count >= 2 # address_count가 2이상인것만 뽑아냄
order by # 5번 -> 뽑아놓고 결과를 정렬하기 때문에 마지막
	address_count, # 오름차순으로 정렬 
    address desc; # 주소를 내림차순
	#address_count desc; # 내림차순으로 정렬
    

	
	

    


