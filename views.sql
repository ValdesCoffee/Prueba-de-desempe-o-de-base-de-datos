--Implementar dos vistas SQL que faciliten la consulta de información operativa o
analítica para la empresa.
CREATE VIEW CONSULTAS_view as 
SELECT 
    product_id, 
    ProductName, 
    MovementType, 
    Quantity, 
    UnitPrice,
    (Quantity * UnitPrice) AS TotalPrice,
    PurchaseOrder
FROM Movements_data;
-- Implementar un procedimiento almacenado que permita consultar los proveedores,
-- este podrá recibir como parámetro un id de un proveedor y traer su información, de
-- lo contrario, si se envía un NULL retornar todos los proveedores
CREATE VIEW vw_productos AS
SELECT
    product_id,
    productname,
    category,
    quantity,
    unitprice,
    (quantity * unitprice) AS valor_inventario
FROM products_name;
