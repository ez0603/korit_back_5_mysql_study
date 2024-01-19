select
	st.student_id,
    st.name,
    st.age,
    st.address,
    st.address_sido,
    at.address_name,
    st.address_sigungu,
    at2.address_name
from
	student_tb st
    left outer join address_tb at on(at.address_id = st.address_sido)
    left outer join address_tb at2 on(at2.address_id = st.address_sigungu);
    
update 
	student_tb st
	left outer join address_tb at on(st.address like concat(at.address_name, '%'))
    left outer join address_tb at2 on(st.address like concat('%', at2.address_name))
set
	st.address_sido = at.address_id,
    st.address_sigungu = at2.address_id;