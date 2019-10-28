
col nombre format a10
col municipio format a10

-- CONSULTA 5
-- falta formatear un buen de cosas :(
select id,clave,nombre,municipio,codigo_gps, 
codigo_iata, ultima_revision from aeropuerto
where region_iso='MX-CHP';