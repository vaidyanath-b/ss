CREATE OR REPLACE PROCEDURE update_salary(
    p_employee_no IN salary.employee_no%TYPE,
    p_new_salary IN salary.basic_salary%TYPE
) AS
BEGIN
    UPDATE salary
    SET basic_salary = p_new_salary
    WHERE employee_no = p_employee_no;
    COMMIT;
END update_salary;
/
exec update_salary(&id , &salary)