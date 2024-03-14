insert into category_tb
select
   0,
   카테고리,
    now(),
    now()
from 
   book_sample_tb
group by 
   카테고리;