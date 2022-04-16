SELECT 
    departments.department_id AS id,
    employees.name AS name,
    employees.role AS R
FROM
    capoeira.departments
JOIN 
	capoeira.employees
ON
	departments.department_id = employees.department_id