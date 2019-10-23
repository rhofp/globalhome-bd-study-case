--@Autor: Flores García Karina
--@Autor: Francisco Pablo Rodrigo 
--@Fecha creación: 20/10/2019
--@Descripcion: DML modificación (particularmente merge)

prompt Conectando como el usuario flpa_p0802_cuentas
connect flpa_p0802_cuentas/practica8

merge into cliente c using cliente_import ci on 
	(c.cliente_id = ci.cliente_id)
when matched then update
	set c.nombre = ci.nombre, c.ap_paterno=ci.ap_paterno, 
	c.ap_materno = ci.ap_materno, c.curp=ci.curp,
	c.fecha_nacimiento = ci.fecha_nacimiento, c.email = ci.email
when not matched then insert
	(c.cliente_id,c.nombre,c.ap_paterno,c.ap_materno,c.curp,c.fecha_nacimiento,
	c.email) values
	(ci.cliente_id,ci.nombre,ci.ap_paterno,ci.ap_materno,ci.curp,ci.fecha_nacimiento,
	ci.email);

--commit;	