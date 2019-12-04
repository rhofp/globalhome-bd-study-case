--@Autor:Flores Garcia Karina
--@Autor:Francisco Pablo Rodrigo
--@Fecha creación: 30/11/2019
--@Descripción: Creacion de sinonimos

-- Sinonimos publicos
create or replace public synonym publ_vivienda for vivienda;
create or replace public synonym publ_vivienda_renta 
	for vivienda_renta;
create or replace public synonym publ_vivienda_vacacional 
	for vivienda_vacacional;
create or replace public synonym publ_vivienda_venta
	for vivienda_venta;

-- Sinonimos de usuario invitado
connect ff_proy_admin/proyectof

grant select on cuenta to ff_proy_invitado;
grant create synonym to rfp_p0703_invitado;

connect rfp_p0703_invitado/proyectof
create or replace synonym vivienda for ff_proy_admin.vivienda;

select * from s_cuenta_cliente;
