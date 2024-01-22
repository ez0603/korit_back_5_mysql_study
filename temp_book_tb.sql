insert into author_tb
SELECT 
	0,
	author
FROM 
	temp_book_tb
group by
	author
order by
	author;

insert into publisher_tb
select
	0,
	publisher
from
	temp_book_tb
group by
	publisher
order by
	publisher;


insert into book_tb 
select
	0,
    tbt.book_name,
    at.author_id,
    pt.publisher_id
from
	temp_book_tb as tbt 
    left outer join author_tb at on(at.author_name = tbt.author)
    left outer join publisher_tb pt on(pt.publisher_name = tbt.publisher)
group by
	tbt.book_name,
    at.author_id,
    pt.publisher_id # 3개의 조건이 일치해야 그룹
order by
	book_name,
    author_id,
    publisher_id;
    
insert into book_register_tb
select
	0,
	tbt.book_code,
	bt2.book_id,
    tbt.loans_count
from
	temp_book_tb tbt
    left outer join (select 
						bt.book_id,
						bt.book_name,
                        at.author_name,
                        pt.publisher_name
					from 
						book_tb bt
                        left outer join author_tb at on(at.author_id = bt.author_id)
                        left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)) bt2
	on(bt2.book_name = tbt.book_name and bt2.author_name = tbt.author and bt2.publisher_name = tbt.publisher);

    
    

