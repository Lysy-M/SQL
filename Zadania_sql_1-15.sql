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

#6 Wyświetl listę pracowników urodzonych po 1960 roku. Posortuj pracowników od najmłodszego do najstarszego.
SELECT * FROM employees WHERE birth_date>'1960-01-01' ORDER BY birth_date DESC;

#7 Policz, jaka jest średnia pensja każdego pracownika.
SELECT AVG(salary), emp_no FROM salaries GROUP BY emp_no;

#8 Wyświetl imię i nazwisko pracowaników zatrudnionych po 1990. 
SELECT first_name, last_name FROM employees WHERE hire_date > '1990-01-01';

#9 Zlicz ile w firmie jest kobiet zatrudnionych po 1 marca 1985 roku.
SELECT count(gender) FROM employees WHERE gender = "F" AND hire_date > '1985-03-01';

#10 Wyświetl listę pracowaników: imię, naziwsko, nazwa stanowiska, których imię zaczyna się na A i nazwisko zawiera literę a.
SELECT first_name, last_name, title FROM employees JOIN titles ON titles.emp_no = employees.emp_no WHERE first_name LIKE "A%" AND last_name LIKE "%a%";

#11 Wyświetl maksymalną pensję dla każdego z pracowników
SELECT max(salary), emp_no FROM salaries GROUP BY emp_no;

#12 Zlicz ile w firmie jest kobiet, których pensa jest pomiędzy 25000 a 50000
SELECT count(gender) FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no WHERE gender = "F" AND salary BETWEEN 25000 AND 50000;

#13 Zlicz ilu jest w firmie mężczyzn zatrudnionych przed 1 lutym 1990 roku, których imię zaczyna się na K.
SELECT count(gender) FROM employees WHERE gender = "M" AND hire_date < '1990-02-01' AND first_name like "K%";

#14 Oblicz jak jest różnica pomiędzy maksymalną a minimalną pensją w firmie (po słowie SELECT możesz dokonywać operacji matematycznych np. Select max(number) + min(number) ...).
SELECT max(salary) - min(salary) FROM salaries;

#15 Oblicz ile wyniosło średnie miesięczne zatrudnienie pracowników w roku 1987.
SELECT count(*)/12 FROM employees WHERE hire_date > '1987-01-01' AND hire_date < '1987-12-31';