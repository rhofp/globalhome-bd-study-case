--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

--col path format a20
col nombre format a15
col municipio format a15

-- CONSULTA 3
select 
nombre,
to_char(abs(latitud*10002.29/90),'99999D9999') as lat_cartesiana, 
to_char(abs(longitud*10002.29/90),'99999D9999') as long_cartesiana,
latitud,
longitud
from aeropuerto
where region_iso='MX-OAX';