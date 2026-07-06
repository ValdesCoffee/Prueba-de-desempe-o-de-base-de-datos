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
