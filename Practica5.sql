USE farmacia

SELECT *
FROM Proveedor

SELECT Tipo
FROM Producto
GROUP BY Tipo

SELECT SUM(Precio) as SumaPrecios, MAX(Precio) as PrecioMaximo, MIN(Precio) as PrecioMinimo
FROM Producto

SELECT COUNT(ID_Producto) as ProductosDiferetes, SUM(Total) as PrecioTotalProdcutos, SUM(Cantidad) as CantidadTotalProductos,  AVG(Precio) as PromedioDePrecios
FROM DetalleCompra


SELECT COUNT(ID_Producto) as CantidadProductos, AVG(Precio) as PrecioPromedio, MAX(Precio) as PrecioMaximo
FROM Producto
WHERE Tipo like 'analgesico'

SELECT COUNT(ID_Detalle) as CantidadProductosDiferentes, SUM(Cantidad) as TotalProdcutos, SUM(Total) as TotalAPagar, MIN(Precio) as PrecioDeProductoMinimo
FROM DetalleCompra 
WHERE Precio > 20

SELECT Tipo, COUNT(*) as CantidadProductos, MAX(Precio) as PrecioMaximo, MIN(Precio) as PrecioMinimo
FROM Producto
GROUP BY Tipo
HAVING COUNT(*) > 2

SELECT Tipo, COUNT(*) as CantidadProdcutos, SUM(Precio) as SumaPrecios, AVG(Precio) as PrecioPromedio
FROM Producto
GROUP BY Tipo
HAVING SUM(Precio) > 150

SELECT TOP 2 Nombre_Sucursal, Direccion, Telefono, Responsable
FROM Sucursal
ORDER BY Responsable