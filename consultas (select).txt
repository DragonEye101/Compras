/*select concat(primer_apellido, ' ' ,segundo_apellido, ', ', primer_nombre, ' ' , segundo_nombre ) as 'Nombre Completo' from client*/

select concat ('$', (stock * precio)) as total, concat('$', round(stock * precio*0.19,0)) as iva
from producto;  /********EJERCICIO 3*********/

select stock, nombre_fantasia
from producto
where curdate()< fecha_vencimiento; /******EJERCICIO 4 ******/

select count(*) as 'Total ventas'
from compra
where year(fecha_compra) = 2013 and month(fecha_compra)= 4 and day(fecha_compra) between 1 and 15; /****EJERCICIO 5****/

select marca
from producto
group by marca;

select concat('$', round(avg(precio),0)) as promedio
from producto
where marca = 'nestle';

select avg(precio) from producto where marca = 'Nestle';

select count(*) as 'Compras por fecha', fecha_compra
from compra
group by fecha_compra;

select count(*) as 'Compras por fecha', sucursal_codigo_sucursal
from compra
group by sucursal_codigo_sucursal;

select  nombre_fantasia, precio
from producto
where precio =( select max(precio) from producto); /***unir dos select ****/

select producto.nombre_fantasia, proveedor.nombre
from producto, proveedor
where proveedor_codigo_proveedor = codigo_proveedor;

select compra.idcompra, concat(cliente.primer_nombre,' ' , cliente.primer_apellido) as 'nombre cliente', sucursal.nombre_sucursal
from compra,cliente,sucursal
where  rut_cliente = cliente_rut_cliente and sucursal_codigo_sucursal = codigo_sucursal;


select precio , nombre_fantasia
from producto
order by precio desc
limit 3;

select nombre_fantasia from producto, detalle_venta, compra, cliente
where codigo_producto = producto_codigo_producto
and compra_idcompra=idcompra
and cliente_rut_cliente = rut_cliente
and ciudad like 'concep%';/**NOMBRE DE PRODUCTOS COMPRADOS EN CONCEPCION**/

select count(*) as 'total', nombre_sucursal
from compra,sucursal
where codigo_sucursal = sucursal_codigo_sucursal
group by nombre_sucursal; /**CANTIDAD DE COMPRAS POR CADA SUCURSAL.DEBE APARECER EL NOMBRE DE LA SUCURSAL**/

select count(*) as cantidad
from producto,detalle_venta
where codigo_producto =producto_codigo_producto
and nombre_fantasia like 'col%'; /**EN CUANTAS COMPRAS APARECE EL PRODUCTO COLACAO*/

select concat('$', round(sum(precio * cantidad))) as total_compra
from producto,detalle_venta,compra
where idcompra = compra_idcompra
and producto_codigo_producto =codigo_producto
and idcompra=1;  /**TOTAL EN PESOS DE LA COMPRA NUMERO 1**/


select count(*) as total, rut_cliente , concat(primer_nombre, ' ' , primer_apellido) as 'nombre'
from compra,cliente
where rut_cliente = cliente_rut_cliente
group by rut_cliente; /***CUANTAS COMPRAS HA HECHO CADA CLIENTE (DEBE APARECER CON NOMBRE Y APELLIDO CLIEINTE)***/


select count(*) as total, codigo_proveedor , nombre
from producto,proveedor
where codigo_proveedor = proveedor_codigo_proveedor
group by codigo_proveedor;/***CANTIDAD DE PRODUCTOS POR PROVEEDOR, DEBE APARECER CON NOMBRE****/

select nombre_fantasia, precio
from producto,compra,detalle_venta
where codigo_producto=producto_codigo_producto and idcompra=compra_idcompra and month(fecha_compra)= 4 
order by precio desc
limit 3;

select rut_cliente , concat(primer_nombre, ' ', primer_apellido, ' ' ) as nombre
from cliente, compra, sucursal
where codigo_sucursal = sucursal_codigo_sucursal
and rut_cliente = cliente_rut_cliente
and nombre_sucursal like 'mall';

select idcompra,nombre_fantasia,precio,cantidad,cantidad*precio as total , 0.19*(cantidad*precio) as iva, (0.19*(cantidad*precio)+cantidad*precio) as 'precio con iva'
from producto,detalle_venta,compra
where codigo_producto = producto_codigo_producto
and idcompra = compra_idcompra
and idcompra =1;

select sum(idcompra)
from sucursal,compra
where codigo_sucursal = sucursal_codigo_sucursal
group by codigo_sucursal


















