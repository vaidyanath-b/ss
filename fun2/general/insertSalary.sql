INSERT INTO salary (employee_no, employee_name, designation, department, basic_salary, AM, DM, other_allowances, deduction_from_salary) VALUES (1, 'John Doe', 'Software Engineer', 'IT', 5000, 200, 300, 500, 100);
INSERT INTO salary (employee_no, employee_name, designation, department, basic_salary, AM, DM, other_allowances, deduction_from_salary) VALUES (2, 'Jane Smith', 'Data Analyst', 'IT', 6000, 300, 400, 600, 200);
INSERT INTO salary (employee_no, employee_name, designation, department, basic_salary, AM, DM, other_allowances, deduction_from_salary) VALUES (3, 'Robert Johnson', 'Project Manager', 'Management', 7000, 400, 500, 700, 300);
INSERT INTO salary (employee_no, employee_name, designation, department, basic_salary, AM, DM, other_allowances, deduction_from_salary) VALUES (4, 'Michael Brown', 'HR Specialist', 'HR', 4000, 100, 200, 400, 50);
INSERT INTO salary (employee_no, employee_name, designation, department, basic_salary, AM, DM, other_allowances, deduction_from_salary) VALUES (5, 'Linda Williams', 'Marketing Specialist', 'Marketing', 4500, 150, 250, 450, 75);


SELECT department, SUM(basic_salary) AS total_basic_salary
FROM salary
GROUP BY department;


