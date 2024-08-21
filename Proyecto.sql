-- Una base de datos de 500 000 filas, con 4 tablas: Clientes, Distribuidor, Principal y Producto

-- Una empresa dedicada a la venta de productos de ferreteria con ventas en varios paices de latinoamerica.

Use Proyecto;

-- Nombre del cliente,pais,ciudad y forma de pago por compra
Select * from Clientes;

-- Fecha de venta con cantidad y devoluciones
select * from Principal;

-- Producto,costo,precio,marca y su categoria
select * from Producto;
-- Distribuidor,pais y ciudad
select * from Distribuidor;

-- Total de devoluciones
select sum(Devoluciones) as 'Total de devoluciones' from Principal;

-- Devoluciones de mayor a menor con el nombre del producto,marca, cliente y distrobuidor
select Descripción, Marca, OrdenID, ClienteKey,Distribuidorkey,Devoluciones from Principal
inner join Producto on Principal.Códigokey = Producto.Códigokey
where Devoluciones >=1 order by Devoluciones desc;

-- La mayor devolucion 
select max(Devoluciones) as 'Mayor devolucion' from Principal;

-- Menor devolucion
select min (Devoluciones) as 'Menor devolucion' from Principal
where Devoluciones != 0;

-- Precio maximo por producto
select max(Precio) as 'Mayor precio' from Producto; 

-- Menor precio por producto
select min(Precio) as 'Menor precio' from Producto; 

-- Costo maximo por producto
select max(Costo) as 'Mayor costo' from Producto; 

-- Costo menor por producto
select min(Costo) as 'Menos costo' from Producto;

-- Productos con el costo, precio, categoria agrupados por marca
select Descripción,Costo,Precio,Categoría, Marca from Producto order by Marca;

-- Clientes con su forma de pago
select * from Clientes order by TipoPago;

-- Las devoluciones con la cantidad vendida, distribuidor y fecha
select * from Principal order by Devoluciones;

-- Cantidades vendidas con sus devoluciones, distribuidor y fechas
select * from Principal order by CantidadVendida;

-- Las 5 marcas con mayor costo
select top 5 Marca as 'Marcas de mayor costo', Categoría, Costo from Producto
order by Costo desc;

-- Las 5 marcas con menor costo
select top 5 Marca as 'Marcas de menor costo', Categoría, Costo from Producto
order by Costo asc;

-- Los 20 productos con el mayor precio
select top 20 Descripción,Costo,Precio, Marca,Categoría from Producto order by Precio desc;

-- Los 20 productos con mayor costo
select top 20 Descripción,Costo,Precio, Marca,Categoría from Producto order by Costo desc;

 -- Los 20 productos con menor precio
select top 20 Descripción,Costo,Precio, Marca,Categoría from Producto order by Precio asc;

-- Los 20 productos con menor costo
select top 20 Descripción,Costo,Precio, Marca,Categoría from Producto order by Costo asc;

-- El total de devoluciones del distribuidor 1
select sum(Devoluciones) as "Devoluciones del distribuidor 1" from Principal where Distribuidorkey = 1; 

-- El total de devoluciones del distribuidor 2
select sum(Devoluciones) as "Devoluciones del distribuidor 2" from Principal where Distribuidorkey = 2;

-- El total de devoluciones del distribuidor 3
select sum(Devoluciones) as "Devoluciones del distribuidor 3"  from Principal where Distribuidorkey = 3;

-- El total de devoluciones del distribuidor 4
select sum(Devoluciones) as "Devoluciones del distribuidor 4" from Principal where Distribuidorkey =4;

-- Total de cantidades vendidas por el distribuidor 1
select sum (CantidadVendida) as "Total de ventas distribuidor 1"  from Principal where Distribuidorkey = 1;

-- Total de cantidades vendidas por el distribuidor 2
select sum (CantidadVendida) as "Total de ventas distribuidor 2" from Principal where Distribuidorkey = 2;

-- Total de cantidades vendidas por el distribuidor 3
select sum (CantidadVendida) as "Total de ventas distribuidor 3" from Principal where Distribuidorkey = 3;

-- Total de cantidades vendidas por el distribuidor 4
select sum (CantidadVendida) as "Total de ventas distribuidor 4" from Principal where Distribuidorkey = 4;

-- Total de productos vendidos
select sum(CantidadVendida) as 'Total productos vendidos' from Principal;

-- Utilidad neta en cada uno de los productos
select Códigokey, Descripción, Marca,Categoría,Precio-(Costo) as 'Utilidad neta por producto' from Producto;

-- Devoluciones de la mayor a la menor con su producto, marca, costo y precio
select Producto.Descripción,Producto.Marca,Producto.Costo,Producto.Precio,Principal.Devoluciones
from Producto
inner join Principal on Producto.Códigokey = Principal.Códigokey
where Devoluciones >= 1
order by Devoluciones desc;

-- Las 25 devoluciones mas grandes con su producto, marca y costo
select top 25 Descripción,Marca, Costo, Devoluciones from Producto inner join Principal on Producto.Códigokey = Principal.Códigokey
order by Devoluciones desc;

-- Las 4 ferreterias con mejores ventas con su pais y ciudad
select top 4 Clientes.NombreCliente,Clientes.Pais,Clientes.Clientekey, Clientes.Ciudad,CantidadVendida
from Clientes inner join Principal 
on Clientes.Clientekey = Principal.Clientekey
order by CantidadVendida desc;

-- La cantidad mas alta vendida por el mejor cliente
select max(CantidadVendida) as 'Cantidad mas alta vendida por el mayor cliente'  from Principal where Clientekey = 8;


select * from Principal;

select * from Producto;

-- Los productos segun su venta del mas vendido al menos vendido
Select Descripción as'Productos segun sus ventas, mayor a menor',Marca, CantidadVendida as "Cantidad vendida" from Producto inner join Principal
on Principal.Códigokey = Producto.Códigokey
order by CantidadVendida desc; 

-- Los productos agrupados segun su venta del menor al mayor
Select Descripción as 'Productos segun sus ventas, menor a mayor', Marca,CantidadVendida as "Cantidad vendida" from Producto inner join Principal
on Principal.Códigokey = Producto.Códigokey 
order by CantidadVendida asc;

-- Las marcas segun sus ventas de forma descendente 
select Marca as 'Marcas mas vendidas', Descripción, CantidadVendida as "Cantidad vendida" from Producto inner join Principal
on Principal.Códigokey = Producto.Códigokey
order by CantidadVendida desc;

-- Las marcas con sus productos agrupados segun sus ventas de forma asendente
Select Marca as'Marcas menos vendidas',Descripción, CantidadVendida as "Cantidad vendida" from Producto inner join Principal
on Principal.Códigokey = Producto.Códigokey
order by CantidadVendida asc;

-- Las 5 marcas mejor vendidas
select top 5 Marca as '5 marcas mas vendidas', Descripción,CantidadVendida as "Cantidad vendida" from Producto
inner join Principal on Producto.Códigokey = Principal.Códigokey
order by CantidadVendida desc;

-- Las 5 marcas menos vendidas
select top 5 Marca as '5 marcas menos vendidas', Descripción,CantidadVendida as "Cantidad vendida" from Producto
inner join Principal on Producto.Códigokey = Principal.Códigokey
order by CantidadVendida asc;

-- Los clientes agrupados segun sus ventas de forma descendente
select NombreCliente as 'Cliente con mas ventas',Ciudad, Pais,CantidadVendida as "Cantidad vendida" from Clientes inner join Principal
on Clientes.Clientekey = Principal.Clientekey
order by CantidadVendida desc;

-- Las 1000 primeras ferreterias segun sus ventas
select top 1000 NombreCliente as 'Cliente mas ventas',Ciudad, Pais,CantidadVendida as "Cantidad vendida" from Clientes inner join Principal
on Clientes.Clientekey = Principal.Clientekey
order by CantidadVendida desc;

-- Las ultimas 100 ferreterias segun sus ventas
select top 100 NombreCliente as 'Cliente con menos ventas', Ciudad, Pais, CantidadVendida as "Cantidad vendida" from Clientes inner join Principal 
on Clientes.Clientekey = Principal.Clientekey
order by CantidadVendida asc;









