create view product_register_view as # select와 join을 계속 해주기 귀찮기때문에 view(가상테이블)을 만들어준다. as -> select from
select
	prt.product_register_id, # 어디서 가지고 온지 알기위해 붙여준다.(prt)
    prt.product_id,
    pt.product_name,
    pt.product_price,
    prt.product_size_id,
    pst.product_size_name,
    prt.product_color_id,
    pct.product_color_name
from # left outer joind을 쓸땐 마스터 테이블을 기준으로
	product_register_tb prt # 마스터 테이블 prt로 이름을 바꿔주는데 as는 생략 가능(테이블만)
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id) # on(조건) 결과값이 참일때 붙인다 color_id 가 같이야 붙는다.
	left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id); # on(조건) 결과값이 참일때 붙인다 color_id 가 같이야 붙는다. # 마스터 테이블이 아닌 슬레이브 테이블이 앞에 와야함 (product_register_tb이 앞에 오면 안됨), 비교 대상을 앞에 써주고 고정값을 뒤에 써준다.
    
select
    prt.product_size_id,
    pst.product_size_name,
    count(prt.product_size_id) as count
from 
	product_register_tb prt
    left outer join product_tb pt on(pt.product_id = prt.product_id)
    left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
	left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)
group by
	prt.product_size_id,
    pst.product_size_name
order by
	prt.product_size_id; # SS가 제일 위로 오도록 정렬 
    
select
	product_size_id,
    product_size_name,
    count(product_size_id) as product_size_count
from
	product_register_view
group by
	product_size_id,
    product_size_name;
    
select
	*
from
	product_register_view
where
	 product_size_id >= 4
	
	