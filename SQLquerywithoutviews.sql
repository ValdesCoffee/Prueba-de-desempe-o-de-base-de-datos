CREATE TABLE Movements_data (
     product_id NUMERIC NOT NULL,
     MovementData INT NOT NULL, 
	 SupplierName VARCHAR(100) NOT NULL, 
	 SupplierCity VARCHAR(100) NOT NULL, 
	 ProductName VARCHAR (100) NOT NULL,
	 Quantity INT NOT NULL,
	 UnitPrice INT NOT NULL UNIQUE,
	 MovementType VARCHAR(100) NOT NULL, 
	 PurchaseOrder VARCHAR(100) NOT NULL
);

CREATE TABLE Warehouse_data (
     id_warehouse NUMERIC NOT NULL,
     SupplierName VARCHAR(100) NOT NULL, 
	 SupplierCity VARCHAR(100) NOT NULL, 
	 Warehouse VARCHAR(100) NOT NULL,
	 WarehouseCity VARCHAR(100) NOT NULL
);

CREATE TABLE products_name(
   product_id NUMERIC NOT NULL,
   ProductName VARCHAR(100) NOT NULL,
   Category VARCHAR(100) NOT NULL,
   Quantity INT NOT NULL,
   UnitPrice NUMERIC NOT NULL
);
INSERT INTO products_name (
    product_id,
    productname,
    category,
    quantity,
    unitprice
)
VALUES
    (1, 'Electrodo E6013', 'Consumibles', 87, 123108),
    (1, 'Electrodo E6013', 'Consumibles', 78, 37943),
    (1, 'Electrodo E6013', 'Consumibles', 27, 35506),
    (1, 'Electrodo E6013', 'Consumibles', 40, 139836),
    (2, 'Soldadura E6013', 'Consumibles', 33, 43746),
    (3, 'Guantes de Nitrilo', 'Elementos Protección', 185, 123653),
    (3, 'Guantes de Nitrilo', 'Elementos Protección', 175, 39944),
    (3, 'Guantes de Nitrilo', 'Elementos Protección', 160, 117524),
    (3, 'Guantes de Nitrilo', 'EPP', 70, 14290),
    (3, 'Guantes de Nitrilo', 'EPP', 131, 71980),
    (3, 'Guantes de Nitrilo', 'EPP', 119, 23022),
    (4, 'Casco Industrial', 'EPP', 192, 108802),
    (4, 'Disco de Corte 4.5', 'Herramientas', 134, 89964),
    (4, 'Disco de Corte 4.5', 'Herramientas', 169, 18022),
    (4, 'Disco de Corte 4.5', 'Herramientas', 148, 115388),
    (4, 'Disco de Corte 4.5', 'Herramientas', 199, 118291),
    (4, 'Disco de Corte 4.5', 'Herramientas', 61, 136736),
    (4, 'Disco de Corte 4.5', 'Herramientas', 130, 88512),
    (4, 'Disco de Corte 4.5', 'Herramientas', 124, 52910);
SELECT * FROM products_name
INSERT INTO warehouse_data (
   id_warehouse,
     SupplierName, 
	 SupplierCity, 
	 Warehouse,
	 Warehousecity
)
VALUES
(1,'Aceros del Norte S.A.S', 'Cartagena','Centro Logistico Norte', 'Cartagena'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Central', 'Barranquilla'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Centro Logistico Norte', 'Cartagena'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Central', 'Barranquilla'),
(1,'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Central', 'Barranquilla'),
(2,'Industriales S.A.S', 'Barranquilla', 'Bodega Central', 'Barranquilla'),
(2,'Industriales S.A.S', 'Barranquilla', 'Bodega Costa', 'Santa Marta'),
(2,'Industriales S.A.S', 'Barranquilla', 'Centro Logistico Norte', 'Cartagena'),
(2,'Industriales S.A.S', 'Barranquilla', 'Bodega Costa', 'Santa Marta'),
(2,'Industriales S.A.S', 'Barranquilla', 'Centro Logistico Norte', 'Cartagena'),
(2,'Industriales S.A.S', 'Barranquilla', 'Bodega Central', 'Barranquilla'),
(2,'Industriales S.A.S', 'Barranquilla', 'Bodega Central', 'Barranquilla'),
(3,'Suministros Global SAS', 'Santa Marta', 'Bodega Central', 'Barranquila'),
(3,'Suministros Global SAS', 'Santa Marta', 'Bodega Central', 'Barranquila');

INSERT INTO movements_data (
     product_id,
     MovementData , 
	 SupplierName, 
	 SupplierCity, 
	 ProductName,
	 Quantity,
	 UnitPrice,
	 MovementType, 
	 PurchaseOrder
)
VALUES 
(1,2026-01-01,'Industriales S.A.S','Barranquilla','Guantes de Nitrilo',70,14290,'IN','PO-1022'),
(2,2026-01-20,'Aceros del Norte S.A.S','Cartagena','Soldadura E6013',33,43746,'OUT','PO-1059'),
(3,2026-01-25,'Industriales S.A.S','Barranquilla','Guantes de Nitrilo',131,71980,'OUT','PO-1029'),
(4,2026-02-02,'Suministros Global SAS','Santa Marta','Electrodo E6013',87,123108,'OUT','PO-1009'),
(5,2026-02-14,'Aceros del Norte S.A.S','Cartagena','Electrodo E6013',27,35506,'IN','PO-1041'),
(6,2026-02-16,'Aceros del Norte S.A.S','Cartagena','Guantes de Nitrilo',160,117524,'IN','PO-1075'),
(7,2026-02-28,'Industriales S.A.S','Barranquilla','Electrodo E6013',40,139836,'OUT','PO-1091'),
(8,2026-03-03,'Industriales S.A.S','Barranquilla','Disco de Corte 4.5',169,18022,'OUT','PO-1043'),
(9,2026-03-06,'Aceros del Norte S.A.S','Cartagena','Disco de Corte 4.5',130,88512,'OUT','PO-1041'),
(10,2026-03-11,'Aceros del Norte S.A.S','Cartagena','Electrodo E6013',78,37943,'OUT','PO-1036'),
(11,2026-03-12,'Industriales S.A.S','Barranquilla','Disco de Corte 4.5',124,52910,'IN','PO-1096'),
(12,2026-03-15,'Aceros del Norte S.A.S','Cartagena','Disco de Corte 4.5',134,89964,'OUT','PO-1035'),
(13,2026-03-19,'Aceros del Norte S.A.S','Cartagena','Disco de Corte 4.5',199,118291,'OUT','PO-1023'),
(14,2026-03-21,'Aceros del Norte S.A.S','Cartagena','Casco Industrial',192,108802,'OUT','PO-1083'),
(15,2026-04-01,'Aceros del Norte S.A.S','Cartagena','Disco de Corte 4.5',148,115388,'OUT','PO-1049'),
(16,2026-04-13,'Industriales S.A.S','Barranquilla','Guantes de Nitrilo',119,23022,'OUT','PO-1035'),
(17,2026-04-17,'Suministros Global SAS','Santa Marta','Guantes de Nitrilo',185,123653,'IN','PO-1032'),
(18,2026-04-26,'Industriales S.A.S','Barranquilla','Disco de Corte 4.5',61,136736,'IN','PO-1034'),
(19,2026-05-23,'Aceros del Norte S.A.S','Cartagena','Guantes de Nitrilo',175,39944,'IN','PO-1040');

-- CONSULTA 1
SELECT 
p.products_name,
SUM (
CASE
   WHEN MovementType = 'IN' THEN m.quantity
   WHEN MovementType = 'ON' THEN m.quantity
END 
) AS available_stocl 
FROM movements_data
   JOIN movements_data m
   ON p.product_id = m.product_id
GROUP BY p.product_id, m.product_id
ORDER BY p.product_name; 
-- CONSULTA 2
SELECT * FROM movements_data
SELECT * FROM products_name
--Como supervisor logístico necesito conocer los movimientos
-- realizados en cada bodega y los productos involucrados.
SELECT
    m.product_id,
    m.movementtype,
    p.productname
FROM movements_data m
INNER JOIN products_name p
ON m.product_id = p.product_id;
-- CONSULTA 3
SELECT * FROM movements_data
-- rado por proveedor.
--Necesidad del negocio:
-- Como responsable de compras necesito identificar cuánto se ha
-- comprado a cada proveedor
SELECT SUM(quantity)
FROM movements_data
WHERE suppliername = 'Industriales S.A.S';
--
SELECT SUM(quantity)
FROM movements_data
WHERE suppliername = 'Aceros del Norte S.A.S';
--
SELECT SUM(quantity)
FROM movements_data
WHERE suppliername = 'Suministros Global SAS';
-- OTRA MANERA
SELECT
    suppliername,
    SUM(quantity) AS total_comprado
FROM movements_data
WHERE movementtype = 'IN'
GROUP BY suppliername
ORDER BY total_comprado DESC;
-- CONSULTA 4
-- Como administrador de operaciones necesito conocer cuáles bodegas
-- presentan mayor actividad
SELECT * FROM movements_data
SELECT suppliername, quantity FROM movements_data
WHERE quantity > 160;
-- CONSULTA 5
-- Como analista necesito identificar cuál es el producto que genera la
-- mayor rotación dentro de la organización

SELECT * FROM products_name
-- IDENTIFICO DE MEJOR DE MAYOR A MENOR TODO
SELECT productname,quantity, unitprice FROM products_name
ORDER BY quantity DESC;
-- Bueno es el disco de corte 
SELECT productname,quantity, unitprice FROM products_name
WHERE quantity = 199;

-- CONSULTA 6 
-- Como gerente de operaciones necesito conocer el valor económico
-- del inventario distribuido en cada bodega
SELECT * FROM products_name p
SELECT * FROM movements_data
SELECT 
SUM(quantity)AS total,
FROM movements_data
WHERE suppliername = 'industriales S.A.S'

