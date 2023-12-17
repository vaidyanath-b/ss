Create or replace function test1 (id salary.employee_no%TYPE )
RETURN VARCHAR2 AS
v_output VARCHAR2(1000);
CURSOR fetch_cursor is 
    SELECT * from salary ;
fetch_row fetch_cursor%rowtype;

begin
open fetch_cursor;
LOOP 
    fetch fetch_cursor into fetch_row;
    EXIT when fetch_cursor%NOTFOUND;
    v_output:= v_output || fetch_row.employee_no || fetch_row.employee_name || CHR(10);
    end loop;
return v_output;
END test1;
/