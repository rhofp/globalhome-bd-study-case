--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

--col path format a20
--col nombre format a10
--col municipio format a10
--col ultima_revision format a40
col CLAVE_TIPO format a10

--CONSULTA 7
select decode(
	tipo,	
	'seaplane_base','B',
	'medium_airport','M',
	'small_airport','S',
	'closed','C',
	'large_airport','L',
	'heliport', 'H'
) "CLAVE_TIPO", upper(tipo) "TIPO"
from aeropuerto;