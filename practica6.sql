create view Sucursal_Proveerdor as
select s.nombre_sucursal as NombreSucursal, s.direccion as DireccionSucursal, p.nombre as Proveedor, p.telefono as TelefonoProveedor
from Sucursal s
join Proveedor p on s.ID_Sucursal = p.ID_sucursal



create view Prodcuto_Inventario as
select p.* , i.Cantidad_Almacen as cantidad
from Producto p
join Inventario i on p.ID_Producto = i.ID_Producto


create view Detalle_Producto_porTipo as
select p.tipo as Tipo,  SUM(d.precio) as PrecioTotal, SUM(d.cantidad) as CantidadTotal
from DetalleCompra d
join Producto p on d.ID_producto = p.ID_Producto
Group by p.tipo 

Create view  Detalle_Orden_Producto as
select p.nombre as Producto, d.precio as Precio, d.Cantidad as Cantidad, o.fecha as FechaCompra
from DetalleCompra d
join producto p on d.id_producto = p.id_producto
join OrdenCompra o on d.id_compra = d.id_compra


create view Inventario_Sucursal_Proveedor as
select p.nombre as Proveedor, i.Cantidad_Almacen as Cantidad, s.nombre_sucursal as Sucursal
from sucursal s
join Proveedor p on s.id_sucursal = p.id_sucursal
join inventario i on s.id_sucursal = i.id_sucursal


select * 
from (
select Tipo, Count(*) as CantidadProductos
from producto
group by Tipo
) as t
where t.CantidadProductos > 1

select * from Sucursal_Proveedor


with STP as (
select Producto, SUM(Precio) as SumaTotalPrecio
from Detalle_Orden_Producto
group by Producto 
)
select * 
from STP


select NombreSucursal, Proveedor
into #sucursalCONproveedor
from Sucursal_Proveedor

select * from #sucursalCONproveedor