--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 04/11/2019
--@Descripcion: Consultas SQL with Joins

prompt Conectando como el usuario flfr_p1001_subastas 
connect flfr_p1001_subastas/practica10

-- col nombre format a10
-- col nombre format a10
-- col apellido_paterno format a10
-- col apellido_materno format a10
-- col tipo_tarjeta format a10
-- col email format a10
-- col ocupacion format a10

--CONSULTA 7
--Suponga que se desea retirar del catálogo a 
--todos los artículos que tengan un precio inicial de más de 900,000, 
--siempre y cuando el artículo todavía no inicie el proceso de subasta, 
--es decir, el artículo no debe tener status EN SUBASTA, ENTREGADO O VENDIDO. 
--Empleando operadores del álgebra relacional 
--(operadores SET: union, intersection, minus), 
--determine el id, nombre, clave, precio inicial 
--y e identificador del status de los artículos que se deben retirar.
--R: Se deben obtener 6 artículos, verificar su precio.

