--@Autor: Francisco Pablo Rodrigo
--@Fecha creación: 13/10/2019
--@Descripcion: Creador de usuarios

prompt Conectandose al usuario rfp_p0703_admin:
connect rfp_p0703_admin/bases123

create table cuenta(
	cuenta_id number(38,0) constraint cuenta_pk primary key,
	titular varchar2(100) not null, 
	rfc varchar2(13) not null,
	num_cuenta varchar2(18) not null constraint cta_num_cuenta_uk unique,
	clave_sucursal varchar2(5) not null,
	fecha_registro date default sysdate not null,
	fecha_baja date,
	saldo number(18,2) not null,
	es_ahorro number(1,0) not null,
	es_inversion number(1,0) not null,
	cuenta_aval_id constraint cta_cuenta_aval_id_fk references cuenta(cuenta_id),
	constraint cta_es_ahorro_o_es_inv_chk check( es_ahorro > 0 or es_inversion > 0 ),
	constraint cta_num_cuenta_chk check(
		(es_ahorro =1 and es_inversion=0 and num_cuenta='AH%')	or
		(es_ahorro =0 and es_inversion=1 and num_cuenta='IN%')	or
		(es_ahorro =1 and es_inversion=1 and num_cuenta='INAH%')
	),
	constraint cta_saldo_chk check ( saldo >= 1500 ),
	constraint cta_fecha_baja_chk check (fecha_baja > fecha_baja + 30)
);
create unique index cta_rfc_titular_iuk on cuenta(rfc,titular);
create index cta_titular_iuk on cuenta(lower(titular));
create index cta_cuenta_aval_id_ix on cuenta(cuenta_aval_id);

create table movimiento_cuenta(
	cuenta_id not null constraint mov_cta_cuenta_id_fk 
		references cuenta(cuenta_id),
	num_movimiento number(18,0) not null,
	importe number(18,2) not null,
	tipo_movimiento char not null,
	concepto varchar2(50),
	comprobante blob, --checar tipo de dato
	fecha_movimiento date not null,
	constraint movimiento_cuenta_pk primary key(cuenta_id,num_movimiento)
);

create index mov_cta_fecha_movimiento_ix on 
	movimiento_cuenta(to_char(fecha_movimiento,'mm-yyyy'));

create table cuenta_ahorro(
	cuenta_id not null constraint cta_ahorro_cuenta_id_fk 
		references cuenta(cuenta_id),
	num_tarjeta_debito varchar2(16) not null 
		constraint cta_ahorro_num_tarjeta_uk unique,
	retiro_max_cajero number(7,2) not null,
	constraint cuenta_ahorro_pk primary key(cuenta_id),
	constraint cta_ahorro_retiro_max_cajero_chk 
		check( retiro_max_cajero <= 12500.00)
);

create table cuenta_inversion(
	cuenta_id not null constraint cta_inversion_cuenta_id_fk 
		references cuenta(cuenta_id),
	porcentaje_interes number(5,2) not null,
	dia_retiro char not null,
	constraint cuenta_inversion_pk primary key(cuenta_id),
	constraint cta_inversion_dia_retiro_chk 
		check (dia_retiro not in('1','2','3','4','26','27','28','29','30','31'))
);

create sequence seq_cuenta
	start with 1001
	increment by 2
	nocycle
	cache 9;

prompt incrementando la secuencia seq_cuenta...
select seq_cuenta.nextval from dual;

prompt Imprimiendo el valor de la secuencia seq_cuenta sin incrementar ...
select seq_cuenta.currval from dual;