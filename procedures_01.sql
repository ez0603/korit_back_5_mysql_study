set @count = 0;

call p_sum(10, 20, @result, @count); # Procedures 를 호출할때는 call

select
	@count; # 매개변수로 저장될 변수명
    
