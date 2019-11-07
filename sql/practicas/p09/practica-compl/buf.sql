--@Autor: Flores García Karina
--@Autor: Pablo Rodrigo Francisco
--@Fecha creación: 28/10/2019
--@Descripcion: Consultas SQL

prompt Conectando como el usuario kfrf_p0903_fx 
connect kfrf_p0903_fx/practica9

-- CONSULTA 5
create table consulta_5 as(
select id,clave,nombre,municipio,codigo_gps, codigo_iata, 
trim(to_char(ultima_revision,'day' ))||', '||
trim(to_char(ultima_revision,'month'))||' '|| 
trim(to_char(ultima_revision,'dd'))||' of ' ||
trim(to_char(ultima_revision,'yyyy'))||' at '||
trim(to_char(ultima_revision,'hh24:mi:ss'))
"ULTIMA_REVISION"
from aeropuerto
where region_iso='MX-CHP'
);