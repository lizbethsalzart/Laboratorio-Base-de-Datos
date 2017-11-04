create procedure procedure1
(@valor varchar(255))
as 
begin
	select * from dbo.Sucursal_Proveedor
	where NombreSucursal like @valor
end
exec procedure1 'Sucursal San Nicolás'


create procedure procedure2
(@valor int)
as 
begin
	update Prodcuto_Inventario set cantidad = @valor 
	where nombre like 'Tabcin'
end
exec procedure2 140

create procedure procedure3
(@valor varchar(25))
as
begin
	select * from Detalle_Producto_porTipo
	where tipo like @valor
end
exec procedure3 'antigripal'

create procedure procedure4
(@valor int)
as
begin
	select * from Detalle_Orden_Producto
	where precio < @valor
end

exec procedure4 50

create procedure procedure5
(@valor varchar(255))
as
begin
	update Sucursal_Proveedor set nombresucursal = @valor
	where proveedor like 'ABCLab'
end
exec procedure5 'Sucursal Santiago'


create function funcion(@valor1 int, @valor2 int)
returns int
as
begin
	return @valor1 / @valor2
end
select dbo.funcion(100,10)



create trigger triggeer1 
on Producto
after update 
as
begin
	select *
	from inserted
	select *
	from deleted
end
update Producto set precio = 25 
where Nombre = 'Aspirina' 

select * from DetalleCompra

create trigger trigger2
on DetalleCompra
instead of update
as
begin
update DetalleCompra set cantidad = 140
where cantidad = 150
end

update DetalleCompra set cantidad = 170
where cantidad = 150

select * from DetalleCompra