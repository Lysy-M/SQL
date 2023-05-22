#Zadania

# SELECT / WHERE
#1 Wyświetl wszystkie dane o pracownikach, którzy mieszkają w Redmond.
SELECT * FROM employees WHERE city = "Redmond";
#2 Wyświetl kod i nazwę wszystkich produktów, które nie należą do kategorii: Napoje.
SELECT product_code, product_name, category FROM products WHERE category NOT IN  ("Beverages");
#3 Wyświetl wszystkie dane produktów, których koszt zakupu jest większy niż 12.0000.
SELECT * FROM products WHERE list_price > "12.0000";
#4 Wyświetl miasto, adres dostawy i opłatę za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 20.0000 a 78.1223.
SELECT orders FROM ship_address WHERE shipping-fee BETWEEN 20.0000 AND 78.1223;
#5 Wyświetl wszystkie informacje o produktach, które mają określona minimalną liczbę zamówienia.
SELECT products FROM minimum_reorder_quantity;
#6 Wyświetl wszystkie informacje o produktach, które mają określona minimalną liczbę zamówienia i ich koszt jest mniejszy niż 10.0000.

#7 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania kończy się na nd.
SELECT first_name, last_name, city FROM employees WHERE city LIKE "%nd";
#8 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania kończy się na nd i jest nie jest to Redmond.
SELECT first_name, last_name, city FROM employees WHERE city LIKE "%nd" AND city NOT IN ("Redmond");
#9 Wyświetl informacje o klientach, którzy nie są menadżerami.
SELECT * FROM customers WHERE job_title NOT IN ("Purchasing manager");
#10 Wyświetl informacje o klientach, których imię zaczyna się na J lub nazwisko zawiera literę o i są menadżerami.
SELECT * FROM customers WHERE first_name LIKE "J%" OR last_name LIKE "%o%" AND job_title = ("Purchasing manager");
#11 Wyświetl informacje o produktach, których id dostawcy równa się 4 lub 6 lub 7
SELECT * FROM products WHERE supplier_ids LIKE "6";

# ORDER BY
#12 Wyświetl imię, nazwisko i miasto zamieszkania pracowników, których miasto zamieszkania kończy się na nd i nie jest to Redmond. Wyniki posrtuj od Z do A względem imienia.
SELECT first_name, last_name, city FROM employees WHERE city = "Redmond" ORDER BY first_name DESC;
#13 Zaprezentuj wszystkie produkty posortowane od najmniejszej ceny zakupu (standard_cost).
SELECT * FROM products WHERE standard-cost ORDER BY standard_cost ASC;
#14 Zaprezentuj wszystkie produkty posortowane od najmniejszej ceny zakupu (standard_cost) i największej ceny sprzedaży (list_price).
SELECT * FROM products ORDER BY standard_cos ASC, list_price DESC;

# DISTINCT
#15 Podaj listę zawodów (nie mogą się powtarzać), jakie posiadają nasi klienci.
SELECT DISTINCT job_title FROM customers;
#16 Wyświetl listę kategorii produktów, które posiadamy w bazie. Posortuj po nazwie kategorii malejąco.
SELECT DISTINCT category FROM products ORDER BY category DESC;

# AS
#17 Zaprezentuj raport dla dyrekcji, który będzie zawierał następujące kolumny: Imie_Pracownika, Nazwisko_Pracowanika, Miasto. Na raporcie umieść tylko pracowników z Seattle.
SELECT first_name, last_name, city FROM customers WHERE city = "Seattle";
#18 Przedstaw przełożonemu raport, który będzie zawierała miasto, adres dostawy i opłatę za przewóz zamówienia, którego opłata za przewóz mieści się w przedziale 19.1256 a 78.1999.
SELECT ship_city, ship_address, shipping_fee FROM orders WHERE shipping_fee BETWEEN 19.1256 AND 78.1999;

# COUNT()
#19 Zlicz liczbę wszystkich zamówień.
SELECT COUNT(id) FROM orders;
#220 Zlicz liczbę wszystkich zamówień opłaconych kartami kredytowymi.
SELECT COUNT(id) FROM orders WHERE payment_type = "Credit Card";
#21 Zlicz liczbę wszystkich nieopłaconych zamówień.
SELECT COUNT(id) FROM orders WHERE payment_type IS NULL;

# MAX() / MIN() / AVG() / SUM()
#22 Wyświetl maksymalną opłatę za transport zamówienia.
SELECT MAX(shipping_fee) FROM orders;
#23 Jaki jest najtańszy produkt kupiony od dostawcy o id = 10.
SELECT MIN(list_price) FROM products WHERE suppliers_ids = 10;
#24 Ile wynosi średnia opłata za przesyłkę w założonych zamówieniach, uwzględniając tylko opłatę większą niz 0.
SELECT AVG(shipping_fee) FROM orders WHERE shipping_fee > 0;
#25 Ile łącznie zamówiono produktu Northwind Traders Coffee (id=43)
SELECT SUM(quantity_per_unit) FROM products WHERE id = 43;

# GROUP BY()
#26 Wyświetl minimalny koszt produktu w danej kategorii.
SELECT MIN(standard_cost) FROM products;
#27 Wskaż jakie zawody wykonują klienci oraz ile osób zadeklarowało dany zawód.
SELECT COUNT(job_title) FROM customers WHERE job_title NOT IN ("Owner");