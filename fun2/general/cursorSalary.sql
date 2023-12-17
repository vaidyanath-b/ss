CREATE OR REPLACE PROCEDURE fetch_salary_data IS
  CURSOR salary_cursor IS
    SELECT * FROM salary where employee_no = &id;
    
  salary_row salary_cursor%ROWTYPE;
BEGIN
  OPEN salary_cursor;
  
  LOOP
    FETCH salary_cursor INTO salary_row;
    EXIT WHEN salary_cursor%NOTFOUND;
    
    -- Here you can process each row. For example, print employee name:
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || salary_row.employee_name || ', Net Salary: ' || (salary_row.basic_salary + salary_row.AM + salary_row.DM + salary_row.other_allowances - salary_row.deduction_from_salary)); 
    END LOOP;
  
  CLOSE salary_cursor;
END fetch_salary_data;
/