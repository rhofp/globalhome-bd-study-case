--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de sinonimos
prompt CREANDO SINONIMOS
-- Sinonimos publicos
create or replace public synonym publ_vivienda for ff_proy_admin.vivienda;
create or replace public synonym publ_vivienda_renta 
	for ff_proy_admin.vivienda_renta;
create or replace public synonym publ_vivienda_vacacional 
	for ff_proy_admin.vivienda_vacacional;
create or replace public synonym publ_vivienda_venta
	for ff_proy_admin.vivienda_venta;

-- Sinonimos de usuario invitado
grant select on vivienda to ff_proy_invitado;
grant select on vivienda_renta to ff_proy_invitado;
grant select on vivienda_vacacional to ff_proy_invitado;
grant select on vivienda_venta to ff_proy_invitado;

--grant create synonym to rfp_p0703_invitado;

connect ff_proy_invitado/proyectof
create or replace synonym vivienda for ff_proy_admin.vivienda;
create or replace synonym vivienda_renta for ff_proy_admin.vivienda_renta;	
create or replace synonym vivienda_vacacional for ff_proy_admin.vivienda_vacacional;		
create or replace synonym vivienda_venta for ff_proy_admin.vivienda_venta;		
connect ff_proy_admin/proyectof	