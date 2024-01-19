update product_color_tb # 순서 1번
set product_color_name = 'Green' # 3번
where # 2번 where로 찾아서 바꿔주지않으면 값이 다 바뀜
	product_color_name = 'Navy';
    
    
update product_color_tb # insert = 한줄 추가(새로운 라인) update = 값을 넣어줄때 
set product_color_name_kor = '그린'
where
	product_color_name = 'Green';
    
update product_color_tb # from table
set
	product_color_name_kor = case 
    when producr_color_name = 'Black' then '블랙'
    when producr_color_name = 'White' then '화이트'
    when producr_color_name = 'Green' then '그린'
end; # if문과 동일 (다중조건 when then = else if) when 조건 then 실행될 조건
