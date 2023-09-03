#1 Przygotuj listę pracowników, którzy są mężczyznami, a ich imię zaczyna się na G lub nazwisko zawiera literę a.
SELECT * FROM employees WHERE gender = "M" AND (first_name LIKE "G%" OR last_name LIKE "%a%");

#2 Policz, ile w firmie pracuje kobiet, których imię kończy się na a.
SELECT count(*) FROM employees WHERE gender = "F" AND first_name LIKE "%a";

#3 Policz, jaka jest średnia pensja pracownika o id (emp_no) = 36567
SELECT avg(salary) FROM salaries WHERE emp_no = 36567;

#4 Wyświetl listę wszystkich pracowników zawierającą informacje: imię pracownika, nazwisko pracownika, nazwę stanowiska (title).
SELECT first_name, last_name, title FROM employees JOIN titles ON titles.emp_no = employees.emp_no;

#5 Policz, ilu jest pracowników, którzy mają nazwę stanowiska Staff
SELECT count(emp_no) FROM titles WHERE title = 'Staff';