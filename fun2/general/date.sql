create table test (
    id number not null,
    name varchar2(20) not null,
    description varchar2(20) not null,
    created date not null,
    updated date not null,
    constraint test_pk primary key (id)
);

SELECT * FROM test WHERE TRUNC(created) = TRUNC(updated);
SELECT * FROM test WHERE created BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD');