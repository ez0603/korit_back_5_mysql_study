# from 서브쿼리
select
	at.num,
    at.author_name
from
	(select 
		row_number() over(order by author_id desc) as num, # as를 안써주면 쓸 수 없다
		author_id,
        author_name
	from 
		author_tb
    where
		author_name like '글%') at # select의 결과를 가지고 다시 select => from 서브쿼리 / as를 달아줘야 이 결과의 at를 찾아 올 수있음
where
	num > 10;
    
#출판사명(전체카운트)
select # 1번째 방법 select에 서브쿼리 -> 컬럼에는 서브쿼리를 잘 쓰지않음
	*,
    (select # 컬럼 한줄 만들때마다 select 동작 
			count(*) 
		from 
			publisher_tb) as total_count
from
	publisher_tb;

select	# 2번째 방법 from에 서브쿼리 -> join에 서브쿼리를 쓰는게 더 효율적임
	*
from
	publisher_tb pt # 테이블 2개를 비교하여 붙이는 작업 / 데이터 불러올때 = 테이블하나 select한번
    left outer join (select count(*) as total_count from publisher_tb) pt2 on (1 = 1); # 조건이 참이기 때문에 total_count가 다 붙음 
    
# where 조건문이라 캐싱 처리 -> 
select # 1번 걸러서 where
	*
from
	book_tb
where # 결정된 것들과 where 비교만 하면 됨
	publisher_id in (select publisher_id from publisher_tb where publisher_name like '아%'); # book_tb에서 '아'로 시작하는거 찾기

# 데이터 양이 적을때는 join을 하면 데이터를 합쳐야 하기 때문에 걸러서 where 조건문이 더 효율적
select # 2번 합쳐서 where
	*
from
	book_tb
    left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)
where
	pt.publisher_name like '아%';
    
select @@profiling; # 쿼리 실행속도 비교 -> 비교 할 거 실행하고 실행하기
show profiles;
set profiling = 1; # profiling 활성화 