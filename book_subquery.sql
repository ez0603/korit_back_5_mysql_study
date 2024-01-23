select # 하나의 값만 출력할때 서브쿼리 사용(하나의 컬럼) where,on 하나의 컬럼이어야 서브쿼리 사용가능
	*
from
	(select # select는 하나의 테이블
		rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num, #  bt.publisher_id로 정렬 -> sum(brt.loans_count)가 높은순으로 정렬 partition by = 중복체크
		row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num, # row_number - 매칭시킬때 사용
		brt.book_id,
		bt.book_name,
		bt.author_id,
		at.author_name,
		bt.publisher_id,
		pt.publisher_name,
		sum(brt.loans_count) as total_loans_count
	from # from에서의 서브쿼리는 테이블 개념
		book_register_tb brt
		left outer join book_tb bt on(bt.book_id = brt.book_id)
		left outer join author_tb at on(at.author_id = bt.author_id)
		left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
	# id가 있어야만 join 가능
	# left outer join = 왼쪽에 있는게 다 나와야함 -> 확정되지 않은것도 가능
	# inner join = 교집합 (양쪽에 다 있어야 나옴) -> 확정된 것만 
	group by
		brt.book_id,
		bt.author_id,
		bt.publisher_id) temp_book_register_tb
where 
	temp_book_register_tb.row_num = 1; # row_num이 1 인것을 조회 (ex-인기순위)