USE Ventas_tech_DB;

SELECT 
	MONTH(fecha_venta) as mes,
	SUM(cantidad * precio_unitario) as total_facturado,
	count(*) as cantidad_pedidos,
	avg(cantidad * precio_unitario) as ticket_promedio
from Ventas
group by MONTH(fecha_venta)
order by mes;

select TOP 5
	id_producto,
	sum(cantidad) as unidades_vendidas,
	sum(cantidad * precio_unitario) as total_facturado
from Ventas
group by id_producto
order by total_facturado desc;

select 
	id_cliente,
	count(*) as cantidad_pedidos,
	sum(cantidad * precio_unitario) as total_gastado 
from Ventas
group by id_cliente
having count (*)>1
order by total_gastado desc;

with ventas_mensuales as (
select 
month(fecha_venta) as mes,
sum(cantidad * precio_unitario) as total_mes
from Ventas
group by MONTH(fecha_venta)
)
select 
mes,
total_mes,
case 
when total_mes >=(select AVG(total_mes) from ventas_mensuales) then 'por encima del promedio'
else 'por debajo'
end as evaluacion_promedio
from ventas_mensuales
order by mes;

-- El producto 1 es el que más facturo, con $3600, representando aproximadamente el 52% de la facturación total--
--El cliente 1 fue el que más gasto, con un total de $2640 en 2 pedidos--
--En el mes 3 se facturaron $6824 en 11 pedidos, quedando por encima del promedio mensual--