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

      RAISE NOTICE 'Database creation complete.';
   END IF;
END $$;

-- Näytä taulun sisältö, jos halutaan varmistaa tulokset
SELECT * FROM customers;
