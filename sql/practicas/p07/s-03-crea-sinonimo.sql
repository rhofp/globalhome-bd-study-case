--@Autor: Francisco Pablo Rodrigo
--@Fecha creación: 13/10/2019
--@Descripcion: Creador de sinonimos

prompt Conectandose al usuario rfp_p0703_admin:
connect rfp_p0703_admin/bases123

grant select on cuenta to rfp_p0703_invitado;
grant crate synonym on rfp_p0703_invitado;

connect rfp_p0703_invitado/invitado
create or replace public synonym cuenta for rfp_p0703_admin.cuenta;

select * from cuenta;	
