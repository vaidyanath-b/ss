Create table sailor (sid int primary key , sname varchar2(20) , rating decimal(5,2));
create table boats(bid int primary key , bname varchar2(20),color varchar2(20));
create table reserves(sid int references sailor(sid) , bid int references boats(bid) , day date)

INSERT INTO sailor VALUES (1, 'John', 4.5);
INSERT INTO sailor VALUES (2, 'Bob', 3.7);
INSERT INTO sailor VALUES (3, 'Alice', 5.0);
INSERT INTO sailor VALUES (4, 'Charlie', 4.2);
INSERT INTO sailor VALUES (5, 'Dave', 3.9);
INSERT INTO boats VALUES (1, 'Boat1', 'Red');
INSERT INTO boats VALUES (2, 'Boat2', 'Blue');
INSERT INTO boats VALUES (3, 'Boat3', 'Green');
INSERT INTO boats VALUES (4, 'Boat4', 'Yellow');
INSERT INTO boats VALUES (5, 'Boat5', 'Black');

INSERT INTO reserves VALUES (1, 5, TO_DATE('2022-01-01', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (2, 2, TO_DATE('2022-01-02', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (3, 3, TO_DATE('2022-01-03', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (4, 4, TO_DATE('2022-01-04', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (5, 5, TO_DATE('2022-01-05', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (1, 1, TO_DATE('2022-01-01', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (1, 2, TO_DATE('2022-01-04', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (1, 3, TO_DATE('2022-01-05', 'YYYY-MM-DD'));
INSERT INTO reserves VALUES (1, 4, TO_DATE('2022-01-06', 'YYYY-MM-DD'));

Select all sid,trunc(day)  from reserves group by sid,trunc(day) HAVING count(*) > 2;
update reserves set day = TO_DATE('2022-01-01','YYYY-MM-DD') where sid = 1 and bid =1

SELECT sid,day,count(*) from reserves group by sid,day having count(*) > 1;

SELECT sid
FROM reserves
group by sid
HAVING COUNT(DISTINCT bid) = (SELECT COUNT(DISTINCT bid) FROM boats);\

SELECT * from sailor ORDER BY rating DESC;


alter table sailor modify rating decimal(5,2);

alter table sailor add (ratingm decimal(5,2) default 3.0);
UPDATE sailor set ratingm = rating + 0.1;

CREATE TRIGGER increment_rating
AFTER INSERT OR UPDATE ON sailor
FOR EACH ROW
BEGIN
   UPDATE sailor SET rating = rating + 0.5 WHERE sid = :NEW.sid;
END;