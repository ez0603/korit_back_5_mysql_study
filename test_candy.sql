TRUNCATE TABLE candy_tb;
insert into candy_tb
values
(0,
'딸기사탕',50),
(0,
'누룽지사탕',100);
#AUTO COMMIT 끔
SET AUTOCOMMIT = FALSE;

START TRANSACTION;

select 
	*
from
candy_tb;

insert into candy_tb
values
(0,
'오렌지사탕',
20);

select
	*
from
	candy_tb;

SAVEPOINT A;
UPDATE candy_tb 
set candy_num = '200'
where 
	candy_id = '1';
    
COMMIT;

select
	*
from
	candy_tb;
    
ROLLBACK;

