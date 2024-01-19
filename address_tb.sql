insert into address_tb

select
	student_id
    name,
    age,
    address,
    address_sido,
    address_name,
    address_sigungu,
    addtrss_name
from
	student_tb as st
    left outer join address_tb at on (at.student_id = st.address_sido)
    left outer join address_tb at2 on (at2.address_id = st.address_sigungu);
truncate table address_tb;
