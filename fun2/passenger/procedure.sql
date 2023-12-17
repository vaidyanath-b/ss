CREATE OR REPLACE procedure salary_fetch(id IN salary.employee_no%TYPE ) AS
    cursor salary_fetch_cursor is
        select * from salary where employee_no = id;
    salary_fetch_row salary_fetch_cursor%rowtype;

begin
    open salary_fetch_cursor;
    loop 
        fetch salary_fetch_cursor into salary_fetch_row;
        EXIT WHEN salary_fetch_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || salary_fetch_row.employee_name || ', Net Salary: ' || (salary_fetch_row.basic_salary + salary_fetch_row.AM + salary_fetch_row.DM + salary_fetch_row.other_allowances - salary_fetch_row.deduction_from_salary));
    end loop;
    close salary_fetch_cursor;
end salary_fetch;
/