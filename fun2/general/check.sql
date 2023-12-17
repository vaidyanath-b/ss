ALTER TABLE salary
ADD CONSTRAINT check_salary CHECK (basic_salary > 20);