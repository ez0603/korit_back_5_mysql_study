use `db_study`; #데이터 베이스 선택

insert into student_tb(student_id, name, age, address) values(0, '김준일', '31', '부산 동래구');
insert into student_tb(address, name, age, student_id) values('부산 동래구', '김준이', '31', 1);
insert into student_tb(name, address) values('김준이', null);
insert into student_tb values (0, '김준상', null, null);
insert into student_tb values (0, '김준상', null, null), (0, '김준상', null, null);

insert into 
	student_tb 
    (student_id, name, age, address)
values 
	(
		0, 
		'김준상', 
		null, 
		null
		), 
	(0, '김준상', null, null);

