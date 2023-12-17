CREATE OR REPLACE FUNCTION salary_fetch_fn(id salary.employee_no%TYPE) RETURN VARCHAR2 AS
    cursor salary_fetch_cursor is
        select * from salary where employee_no = id;
    salary_fetch_row salary_fetch_cursor%rowtype;
    v_output VARCHAR2(4000);
BEGIN
    open salary_fetch_cursor;
    loop 
        fetch salary_fetch_cursor into salary_fetch_row;
        EXIT WHEN salary_fetch_cursor%NOTFOUND;
        v_output := v_output || 'Employee Name: ' || salary_fetch_row.employee_name || ', Net Salary: ' || (salary_fetch_row.basic_salary + salary_fetch_row.AM + salary_fetch_row.DM + salary_fetch_row.other_allowances - salary_fetch_row.deduction_from_salary) || CHR(10);
    end loop;
    close salary_fetch_cursor;
    RETURN v_output;
END salary_fetch_fn;
/
---
SELECT salary_fetch_fn(1) from dual;
---
DECLARE
    salary_value varchar(400);
BEGIN
    salary_value := salary_fetch_fn(1);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || salary_value);
END;
/
---