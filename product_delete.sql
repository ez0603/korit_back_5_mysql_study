delete
from
	product_register_tb prt
    # delete는 join이 안됨
where # delete할때는 where이 제일 중요
	product_color_id = (select # select 결과는 하나만, 2개이상 지우고 싶을땐 = 대신 in 서브커리는 ()으로 묶어줌
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');
select
	*
from
	product_register_view;

	