--@Autor: Francisco Pablo Rodrigo
--@Fecha creación: 13/10/2019
--@Descripcion: Creador de usuarios

prompt Conectandose al usuario rfp_p0703_admin:
connect rfp_p0703_admin/bases123

alter table cuenta add curp varchar2(18);
alter table cuenta_inversion add constraint cta_inversion_porcentaje_interes_chk 
	check( porcentaje_interes <= 20.00 );
alter table cuenta drop constraint cta_es_ahorro_o_es_inv_chk;
alter table cuenta drop constraint cta_num_cuenta_chk;
alter table cuenta drop column es_ahorro;
alter table cuenta drop column es_inversion;
alter table cuenta add tipo_cuenta char not null;
alter table cuenta add constraint cta_tipo_cuenta_chk 
	check( tipo_cuenta in ('I','A'));
alter table cuenta rename column titular to nombre_titular;
alter table movimiento_cuenta rename to operacion_cuenta;

alter table operacion_cuenta drop constraint movimiento_cuenta_pk;
alter table operacion_cuenta add operacion_cuenta_id number(18,0)
	constraint operacion_cuenta_pk primary key;	
-- agregar uk a cuenta_id y a num_movimiento ?
alter table operacion_cuenta add 
	constraint op_cta_cuenta_id_num_mov_uk unique(cuenta_id,num_movimiento);

alter table operacion_cuenta modify importe number(20,2);

prompt Recreando vista v_cuenta_movimiento
create or replace view v_cuenta_movimiento(
	cuentahabiente,num_cuenta, num_movimiento, importe, concepto, 
	tipo_movimiento, fecha_baja
) as select nombre_titular,num_cuenta, num_movimiento, importe, concepto, 
	tipo_movimiento, fecha_baja
from cuenta c, operacion_cuenta oc
where c.cuenta_id = oc.cuenta_id;

alter sequence seq_cuenta cycle minvalue 15 maxvalue 100000000;
alter index cta_rfc_titular_iuk rename to cuenta_cuentahabiente_uk;
