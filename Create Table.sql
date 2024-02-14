CREATE TABLE categories (
    category_id int NOT NULL PRIMARY KEY,
    category_name varchar(50) NOT NULL,
    description varchar(50),
    note varchar(50),
);

CREATE TABLE customer_demographics (
    customer_type_id int NOT NULL PRIMARY KEY,
    customer_desc varchar(50),
);

CREATE TABLE customers (
    customer_id int NOT NULL PRIMARY KEY,
    company_name varchar(50) NOT NULL,
    contact_name varchar(50),
    contact_title varchar(50),
    address varchar(50),
    city varchar(50),
    region varchar(50),
	postal_code varchar(50),
    country varchar(50),
    phone varchar(50),
    fax varchar(50),
);

CREATE TABLE customer_customer_demo (
    customer_id int NOT NULL,
    customer_type_id int NOT NULL,
    PRIMARY KEY (customer_id, customer_type_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_demographics,
    FOREIGN KEY (customer_id) REFERENCES customers
);

CREATE TABLE employees (
    employee_id int NOT NULL PRIMARY KEY,
    last_name varchar(50) NOT NULL,
    first_name varchar(50) NOT NULL,
    title varchar(50),
    title_of_courtesy varchar(50),
    birth_date date,
    hire_date date,
    address varchar(50),
    city varchar(50),
    region varchar(50),
    postal_code varchar(50),
    country varchar(50),
    home_phone varchar(50),
    extension varchar(50),
    image varchar(50),
    notes text,
    reports_to int,
    photo_path varchar(50),
	FOREIGN KEY (reports_to) REFERENCES employees
);

CREATE TABLE suppliers (
    supplier_id int NOT NULL PRIMARY KEY,
    company_name varchar(50) NOT NULL,
    contact_name varchar(50),
    contact_title varchar(50),
    address varchar(50),
    city varchar(50),
    region varchar(50),
    postal_code varchar(50),
    country varchar(50),
    phone varchar(50),
    fax varchar(50),
    homepage varchar(50),
);

CREATE TABLE products (
    product_id int NOT NULL PRIMARY KEY,
    product_name varchar(50) NOT NULL,
    supplier_id int,
    category_id int,
    quantity_per_unit varchar(50),
    unit_price varchar(50),
    units_in_stock int,
    units_on_order int,
    reorder_level int,
    discontinued integer NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories,
	FOREIGN KEY (supplier_id) REFERENCES suppliers,
);

CREATE TABLE region (
    region_id int NOT NULL PRIMARY KEY,
    region_description varchar(50) NOT NULL,
);

CREATE TABLE shippers (
    shipper_id int NOT NULL PRIMARY KEY,
    company_name varchar(50) NOT NULL,
    phone varchar(50),
);

CREATE TABLE orders (
    order_id int NOT NULL PRIMARY KEY,
    customer_id int,
    employee_id int,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via int,
    freight varchar(50),
    ship_name varchar(50),
    ship_address varchar(50),
    ship_city varchar(50),
    ship_region varchar(50),
    ship_postal_code varchar(50),
    ship_country varchar(50),
    FOREIGN KEY (customer_id) REFERENCES customers,
    FOREIGN KEY (employee_id) REFERENCES employees,
    FOREIGN KEY (ship_via) REFERENCES shippers
);

CREATE TABLE territories (
    territory_id int NOT NULL PRIMARY KEY,
    territory_description varchar(50) NOT NULL,
    region_id int NOT NULL,
	FOREIGN KEY (region_id) REFERENCES region
);

CREATE TABLE employee_territories (
    employee_id int NOT NULL,
    territory_id int NOT NULL,
    PRIMARY KEY (employee_id, territory_id),
    FOREIGN KEY (territory_id) REFERENCES territories,
    FOREIGN KEY (employee_id) REFERENCES employees
);

CREATE TABLE order_details (
    order_id int NOT NULL,
    product_id int NOT NULL,
    unit_price real NOT NULL,
    quantity int NOT NULL,
    discount real NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products,
    FOREIGN KEY (order_id) REFERENCES orders
);


INSERT INTO categories VALUES
	(1, 'Beverages', 'Soft drinks, coffees, teas, beers', '\x'),
	(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads', '\x'),
	(3, 'Confections', 'Desserts, candies, and sweet breads', '\x'),
	(4, 'Dairy Products', 'Cheeses', '\x'),
	(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', '\x'),
	(6, 'Meat/Poultry', 'Prepared meats', '\x'),
	(7, 'Produce', 'Dried fruit and bean curd', '\x'),
	(8, 'Seafood', 'Seaweed and fish', '\x');

INSERT INTO customers VALUES
	(1, 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545'),
	(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745'),
	(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL),
	(4, 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750'),
	(5, 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67'),
	(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924'),
	(7, 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32'),
	(8, 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99'),
	(9, 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41'),
	(10, 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL),
	(11, 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199'),
	(12, 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428'),
	(13, 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535'),
	(14, 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561'),
	(15, 'Godos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL),
	(16, 'Gourmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL),
	(17, 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL),
	(18, 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397'),
	(19, 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765'),
	(20, 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948'),
	(21, 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376'),
	(22, 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333'),
	(23, 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL),
	(24, 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874'),
	(25, 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL);

INSERT INTO employees VALUES
	(1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', '\x', 'Education includes a BA in ptate University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp'),
	(2, 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', '\x', 'Andrew received his BTS commercial in 1974 and a Pharketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp'),
	(3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', '\x', 'Janet has a BS degree inege (1984)ificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp'),
	(4, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', '\x', 'Margaret holds a BA in English lit an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp'),
	(5, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', '\x', 'Steven Buchanan graduated from St. AndrewUpon joinentative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp'),
	(6, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', '\x', 'Michael is a graduate of Sussex UniversityCalifornia at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp'),
	(7, 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham Hollow\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', '\x', 'Robert King served in the Peace y of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp'),
	(8, 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', '\x', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');

INSERT INTO region VALUES
	(1, 'Eastern'),
	(2, 'Western'),
	(3, 'Northern'),
	(4, 'Southern');

INSERT INTO territories VALUES
	('01581', 'Westboro', 1),
	('01730', 'Bedford', 1),
	('01833', 'Georgetow', 1),
	('02116', 'Boston', 1),
	('02139', 'Cambridge', 1),
	('02184', 'Braintree', 1),
	('02903', 'Providence', 1),
	('03049', 'Hollis', 3),
	('03801', 'Portsmouth', 3),
	('06897', 'Wilton', 1),
	('07960', 'Morristown', 1),
	('08837', 'Edison', 1),
	('27403', 'Greensboro', 1),
	('32859', 'Orlando', 4),
	('33607', 'Tampa', 4),
	('40222', 'Louisville', 1),
	('44122', 'Beachwood', 3),
	('45839', 'Findlay', 3),
	('48075', 'Southfield', 3),
	('48084', 'Troy', 3),
	('48304', 'Bloomfield Hills', 3),
	('53404', 'Racine', 3);

INSERT INTO employee_territories VALUES
	(1, '06897'),
	(1, '19713'),
	(2, '01581'),
	(2, '01730'),
	(2, '01833'),
	(2, '02116'),
	(2, '02139'),
	(2, '02184'),
	(2, '40222'),
	(3, '30346'),
	(3, '31406'),
	(3, '32859'),
	(3, '33607'),
	(4, '20852'),
	(4, '27403'),
	(4, '27511'),
	(5, '02903');

INSERT INTO shippers VALUES
	(1, 'Speedy Express', '(503) 555-9831'),
	(2, 'United Package', '(503) 555-3199'),
	(3, 'Federal Shipping', '(503) 555-9931'),
	(4, 'Alliance Shippers', '1-800-222-0451'),
	(5, 'UPS', '1-800-782-7892'),
	(6, 'DHL', '1-800-225-5345');

INSERT INTO orders VALUES
	(10248, 1, 5, '1996-07-04', '1996-08-01', '1996-07-16', 3, 32.38, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France'),
	(10249, 2, 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.61, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany'),
	(10250, 3, 4, '1996-07-08', '1996-08-05', '1996-07-12', 2, 65.83, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
	(10251, 4, 3, '1996-07-08', '1996-08-05', '1996-07-15', 1, 41.34, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France'),
	(10252, 5, 4, '1996-07-09', '1996-08-06', '1996-07-11', 2, 51.3, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium'),
	(10253, 6, 3, '1996-07-10', '1996-07-24', '1996-07-16', 2, 58.17, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil'),
	(10254, 7, 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 22.98, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland'),
	(10255, 8, 9, '1996-07-12', '1996-08-09', '1996-07-15', 3, 148.33, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland'),
	(10256, 9, 3, '1996-07-15', '1996-08-12', '1996-07-17', 2, 13.97, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil'),
	(10257, 10, 4, '1996-07-16', '1996-08-13', '1996-07-22', 3, 81.91, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela'),
	(10258, 11, 1, '1996-07-17', '1996-08-14', '1996-07-23', 1, 140.51, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
	(10261, 12, 4, '1996-07-19', '1996-08-16', '1996-07-30', 2, 3.05, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil'),
	(10262, 13, 8, '1996-07-22', '1996-08-19', '1996-07-25', 3, 48.29, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA'),
	(10263, 14, 9, '1996-07-23', '1996-08-20', '1996-07-31', 3, 146.06, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria'),
	(10264, 15, 6, '1996-07-24', '1996-08-21', '1996-08-23', 3, 3.67, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden'),
	(10265, 16, 2, '1996-07-25', '1996-08-22', '1996-08-12', 1, 55.28, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France'),
	(10266, 17, 3, '1996-07-26', '1996-09-06', '1996-07-31', 3, 25.73, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland'),
	(10267, 18, 4, '1996-07-29', '1996-08-26', '1996-08-06', 1, 208.58, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany'),
	(10268, 19, 8, '1996-07-30', '1996-08-27', '1996-08-02', 3, 66.29, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela'),
	(10269, 20, 5, '1996-07-31', '1996-08-14', '1996-08-09', 1, 4.56, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA'),
	(10270, 21, 1, '1996-08-01', '1996-08-29', '1996-08-02', 1, 136.54, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');

INSERT INTO suppliers VALUES
	(1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL),
	(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#'),
	(3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL),
	(4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL),
	(5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL),
	(6, 'Mayumis', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumis on the World Wide Web'),
	(7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL),
	(8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL),
	(9, 'PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL),
	(10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL),
	(11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL);

INSERT INTO products VALUES
	(1, 'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1),
	(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1),
	(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0),
	(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0),
	(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, 1),
	(6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0),
	(7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0),
	(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0),
	(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1),
	(10, 'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0),
	(11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0),
	(12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0),
	(13, 'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0),
	(14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0),
	(15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 13, 39, 0, 5, 0);

INSERT INTO order_details VALUES
	(10248, 11, 14, 12, 0),
	(10248, 42, 9.8, 10, 0),
	(10248, 72, 34.8, 5, 0),
	(10249, 14, 18.6, 9, 0),
	(10249, 51, 42.4, 40, 0),
	(10250, 41, 7.7, 10, 0),
	(10250, 51, 42.4, 35, 0.15),
	(10250, 65, 16.8, 15, 0.15),
	(10251, 22, 16.8, 6, 0.05),
	(10251, 57, 15.6, 15, 0.05),
	(10251, 65, 16.8, 20, 0),
	(10252, 20, 64.8, 40, 0.05),
	(10252, 33, 2, 25, 0.05),
	(10252, 60, 27.2, 40, 0),
	(11070, 16, 17.45, 30, 0.15),
	(11070, 31, 12.5, 20, 0),
	(11071, 7, 30, 15, 0.05),
	(11071, 13, 6, 10, 0.05),
	(10253, 31, 10, 20, 0);

SELECT AVG(TotalPrice) AS AverageOrderValue
FROM (
    SELECT OrderID, SUM(UnitPrice * Quantity) AS TotalPrice
    FROM OrderDetails
    GROUP BY OrderID
) AS OrderTotals;


SELECT TOP 1 [dbo].[Employees].EmployeeID, FirstName, LastName, SUM(UnitPrice * Quantity) AS TotalSales
FROM [dbo].[Employees]
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [dbo].[Order Details] ON Orders.OrderID = [dbo].[Order Details].OrderID
GROUP BY [dbo].[Employees].EmployeeID, FirstName, LastName
ORDER BY TotalSales DESC;

SELECT COUNT(DISTINCT Suppliers_ID) AS total_suppliers
FROM suppliers;

SELECT TOP 1 region, COUNT(CustomerID) AS total_customers
FROM [dbo].[Customers]
GROUP BY region
ORDER BY total_customers DESC;

SELECT COUNT(order_id) AS total_orders
FROM orders
WHERE order_date >= 'start_date' AND order_date <= 'end_date';

SELECT ProductID, ProductName, Discontinued
FROM Products
WHERE Discontinued > 0 -- Lọc các sản phẩm có giảm giá

SELECT TOP 1 c.CustomerID, COUNT(o.OrderID) AS total_orders
FROM customers c
JOIN orders o ON c.customerID = o.customerID
WHERE MONTH(o.OrderDate) = 'Tháng' -- Tháng mong muốn
GROUP BY c.customerID
ORDER BY total_orders DESC;

SELECT COUNT(CASE WHEN Discount > 0 THEN OrderID END) * 100.0 / COUNT(OrderID) AS PercentageWithDiscount
FROM OrderDetails;

WITH ConsecutiveOrders AS (
    SELECT
        CustomerID,
        OrderID,
        OrderDate,
        LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrderDate
    FROM
        Orders
)

SELECT DISTINCT
    c1.CustomerID,
    c1.OrderID AS FirstOrderID,
    c1.OrderDate AS FirstOrderDate,
    c1.NextOrderDate AS SecondOrderDate
FROM
    ConsecutiveOrders c1
WHERE
    DATEDIFF(day, c1.OrderDate, c1.NextOrderDate) < 3;

SELECT
    ProductID,
    ProductName,
    UnitPrice
FROM
    Products
WHERE
    UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

SELECT TOP 1 EmployeeID, FirstName, LastName, Title_Of_Courtesy
FROM Employees
ORDER BY Title_Of_Courtesy DESC;