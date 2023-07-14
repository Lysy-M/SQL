# INNNER JOIN
#28 Wyświetl wszystkie dane produktu oraz dane firmy, która go dostarcza.
SELECT p.product_name, p.product_price, c.company_name, c.company_address 
FROM products p 
JOIN companies c 
ON p.company_id = c.company_id
#29 Wyświetl nazwę produktu i nazwę firmy, która go dostarcza. Posortuj po nazwie firmy od A do Z.
SELECT ProductName, CompanyName 
FROM Products 
INNER JOIN Suppliers 
ON Products.SupplierID = Suppliers.SupplierID 
ORDER BY CompanyName

#30 Wyświetl dane klientów (imie, nazwisko, adres, miasto, kraj), którzy nie dokonali jeszcze płatności za zamówienie.
SELECT Customers.CustomerName, Customers.Address, Customers.City, Customers.Country 
FROM Customers 
WHERE Customers.CustomerID 
NOT IN (SELECT Customers.CustomerID 
FROM Customers 
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID 
INNER JOIN Payments 
ON Orders.OrderID = Payments.OrderID)

# LEFT JOIN
#31 Przygotuj raport, który zawiera wszystkie dane o zamówieniach i firmach, które dostarczają dane zamówienie. Raport powinien zawierać wszystkie zamówienia wraz z tymi bez określonego jeszcze dostawcy.
SELECT Orders.OrderID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.ShipVia, Orders.Freight, Orders.ShipName, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipPostalCode, Orders.ShipCountry, Suppliers.CompanyName, Suppliers.Address, Suppliers.City, Suppliers.Region
#32 Zweryfkikuj czy wszyscy klienci złożyli już zamówienie. Wyswietl nazwy wszystkich klientów wraz z datą zamówienia i datą dostawy zamówienia. 
SELECT Customers.CompanyName, Orders.OrderDate, Orders.ShippedDate
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.ShippedDate IS NULL

#33 Zweryfikuj dla księgowości czy wszystkie faktury zostały już opłacone. Przygotuj raport zawierający kolumny 'Data faktury' i 'Data płatności'.
SELECT faktura.data_wystawienia, faktura.data_zaplaty
FROM faktura
WHERE faktura.data_zaplaty IS NOT NULL
ORDER BY faktura.data_wystawienia


# RIGHT JOIN ()
#34 Dyrekcja prosi o przygotowanie raportu, który wykaże, czy wszyscy pracownicy składali zamówienia. Raport powienien zawierać datę zamówienia, nazwisko pracowanik i jego stanowisko pracy. Ilu pracowników nie złożyło zamówienia?
SELECT
    z.data_zamowienia,
    p.nazwisko,
    p.stanowisko
FROM
    Zamowienia z
    JOIN Pracownicy p ON z.id_pracownika = p.id_pracownika
WHERE
    z.data_zamowienia IS NULL

#35 Przygotuj zestawienie, które będzie zawierało dane: nazwa klienta, data zawmówieniam i data dostawy.
SELECT Customers.CompanyName, Orders.OrderDate, Orders.ShippedDate 
FROM Customers 
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID

#36 Zweryfikuj dla księgowości czy wszystkie faktury zostały wystawione. Przygotuj raport zawierający zamówienie bez wystawionej faktury kolumny 'Forma płatności', 'Data płatności' i 'Data faktury'.
SELECT z.id,
    z.data_zamowienia,
    z.data_platnosci,
    z.data_faktury,
    z.forma_platnosci
FROM
    zamowienia z
WHERE
    z.data_faktury IS NULL
ORDER BY
