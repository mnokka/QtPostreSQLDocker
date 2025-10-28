-- File: create_db_customers.sql
-- Tämä skripti alustaa tietokannan vain ensimmäisellä käynnistyksellä.
-- Jos tietokanta on jo olemassa, skripti ei tee mitään.

DO $$ 
BEGIN
   -- Tarkista, onko taulu 'customers' olemassa
   IF EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'customers') THEN
      -- Jos taulu on olemassa, älä tee mitään
      RAISE NOTICE 'DB exist. Not Overwriting.';
   ELSE
      -- Jos taulua ei ole, luodaan tietokanta ja taulut
      RAISE NOTICE 'First time booting, creating database';

      -- Luo taulu 'customers'
CREATE TABLE customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Address VARCHAR(150),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50) DEFAULT 'Finland'
);
   

      -- Lisää dataa 'customers'-tauluun
INSERT INTO customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('K-Market Hämeenlinna Keskusta', 'Maija Korhonen', 'Raatihuoneenkatu 10', 'Hämeenlinna', '13100', 'Finland'),
('Rauta-Jokela Oy', 'Sami Jokela', 'Teollisuustie 5', 'Lahti', '15100', 'Finland'),
('Suomen IT-Partneri Oy', 'Pekka Lehtinen', 'Teknologiakatu 2', 'Espoo', '02150', 'Finland'),
('Lapin Safarit Oy', 'Johanna Rautiainen', 'Tunturitie 3', 'Rovaniemi', '96100', 'Finland'),
('Turun Venevuokraus', 'Kari Väisänen', 'Satamakatu 22', 'Turku', '20100', 'Finland'),
('Kahvila Pikkupannu', 'Anna Virtanen', 'Kauppakatu 17', 'Jyväskylä', '40100', 'Finland'),
('Porvoon Puutyöt', 'Jussi Miettinen', 'Puistokadun varsi 11', 'Porvoo', '06100', 'Finland'),
('Espoon Autohuolto Oy', 'Jari Kallio', 'Mekaanikontie 7', 'Espoo', '02650', 'Finland'),
('Salon Sepät Oy', 'Olli Kinnunen', 'Metallikuja 8', 'Salo', '24100', 'Finland'),
('Oulun Tietoturva', 'Katja Niemi', 'Kajaaninkatu 14', 'Oulu', '90100', 'Finland'),
('Kuopion Kalakauppa', 'Paavo Paananen', 'Tullikatu 4', 'Kuopio', '70100', 'Finland'),
('Ahvenanmaan Turistit', 'Erik Karlsson', 'Torget 3', 'Mariehamn', '22100', 'Finland'),
('Seinäjoen Musiikkikoulu', 'Tiina Halme', 'Rytmikuja 6', 'Seinäjoki', '60100', 'Finland'),
('Vantaan Rakennuspalvelu', 'Mikko Saarinen', 'Rakentajantie 9', 'Vantaa', '01390', 'Finland'),
('Tampereen Kirjakauppa', 'Laura Heikkilä', 'Hatanpään valtatie 20', 'Tampere', '33100', 'Finland'),
('Maarianhaminan Majatalo', 'Maria Sjöberg', 'Skärgårdsvägen 1', 'Mariehamn', '22100', 'Finland'),
('Kotkan Meriklubi', 'Antti Laine', 'Ruukinkatu 12', 'Kotka', '48100', 'Finland'),
('Lappeenrannan Pyörähuolto', 'Joonas Aalto', 'Kauppakatu 5', 'Lappeenranta', '53100', 'Finland'),
('Joensuun Puutarha', 'Sara Mäkinen', 'Vehkakuja 9', 'Joensuu', '80100', 'Finland'),
('Hanko Surf Shop', 'Mika Korpela', 'Rantatie 7', 'Hanko', '10900', 'Finland');



CREATE TABLE orders (
  orderid INT PRIMARY KEY,
  customerid INT,
  orderdate DATE,
  product VARCHAR(50),
  quantity INT,
  unitprice DECIMAL(6,2),
  FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

INSERT INTO orders (orderid, customerid, orderdate, product, quantity, unitprice) VALUES
(1, 1, '2025-10-10', 'Kahvipavut 1kg', 5, 12.90),
(2, 2, '2025-10-12', 'Betonipussi 25kg', 30, 6.50),
(3, 3, '2025-09-22', 'Ethernet-kaapeli 5m', 10, 9.90),
(4, 4, '2025-10-01', 'Termospullo', 15, 19.50),
(5, 5, '2025-10-03', 'Pelastusliivit', 6, 49.00),
(6, 6, '2025-10-05', 'Espresso-kapselit', 40, 0.45),
(7, 7, '2025-09-30', 'Puulevy 18mm', 25, 18.00),
(8, 8, '2025-10-08', 'Öljynsuodatin', 12, 8.20),
(9, 9, '2025-09-18', 'Rautaputki 2m', 15, 14.90),
(10, 10, '2025-09-25', 'Palomuuri-ohjelmisto', 2, 299.00),
(11, 11, '2025-10-09', 'Savustuspussi', 20, 1.50),
(12, 12, '2025-10-07', 'Matkamuisto-muki', 50, 5.90),
(13, 13, '2025-09-28', 'Viulun kielet', 10, 15.00),
(14, 14, '2025-10-04', 'Rakennusliima', 30, 4.20),
(15, 15, '2025-10-06', 'Kovakantinen kirja', 12, 24.90),
(16, 16, '2025-10-08', 'Vieraskirja', 5, 19.90),
(17, 17, '2025-10-10', 'Purjehdustakki', 3, 129.00),
(18, 18, '2025-10-02', 'Polkupyörän ketju', 8, 22.00),
(19, 19, '2025-09-29', 'Puistopenkki', 2, 159.00),
(20, 20, '2025-09-27', 'Surffilauta', 1, 699.00);


      RAISE NOTICE 'Database creation complete.';
   END IF;
END $$;

-- Näytä taulun sisältö, jos halutaan varmistaa tulokset
SELECT * FROM customers;

SELECT * FROM orders;
