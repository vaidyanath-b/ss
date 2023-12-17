-- CREATE USER c##vai IDENTIFIED BY mypassword;
-- GRANT CONNECT, RESOURCE TO c##vai;

-- -- Then connect as myuser and run:

CREATE TABLE passengers (
        name varchar2(50),
        age integer,
        sex char,
        address varchar2(100)
);

CREATE OR REPLACE TRIGGER on_insert2
AFTER INSERT ON passengers
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Passenger Inserted');
END;
/

-- grant insert on passengers to c##vai;
GRANT INSERT ON passenger TO c##vai;
INSERT INTO passengers VALUES ('Vai', 20, 'M', 'Kathmandu');