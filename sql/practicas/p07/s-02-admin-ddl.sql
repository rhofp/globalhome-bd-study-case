--@Autor: Francisco Pablo Rodrigo
--@Fecha creación: 13/10/2019
--@Descripcion: Creador de usuarios

prompt Conectandose al :
connect rfp_p0703_admin/bases123

create table cuenta(
	cuenta_id numeric(40,0) constraint cuenta_pk primary key,
	titular varchar2(100) not null,
	rfc varchar2(13) not null,
	num_cuenta varchar2(18) not null constraint cuenta_num_cuenta_uk unique,
	clave_sucursal varchar2(5) not null,
	fecha_registro date not null default sysdate,
	fecha_baja date,
	saldo numeric(18,2) not null,
	es_ahorro numeric(1,0) not null,
	es_inversion numeric(1,0) not null
	cuenta_aval_id constraint cuenta_cuenta_id_fk references cuenta(cuenta_id),

	constraint cuenta_es_ahorro_chk check( es_ahorro > 0 or es_inversion > 0 ),
	constraint cuenta_num_cuenta_chk check(
		(es_ahorro =1 and es_inversion=0 and num_cuenta='AH%')	or
		(es_ahorro =0 and es_inversion=1 and num_cuenta='IN%')	or
		(es_ahorro =1 and es_inversion=1 and num_cuenta='INAH%')
	),
	constraint cuenta_saldo_chk check ( saldo >= 1500 ),
	constraint cuenta_fecha_baja_chk check (fecha_baja > fecha_baja + 30)

);

create unique index cuenta_rfc_titular_iuk on cuenta(rfc,titular);
create index cuenta_titular_ix on cuenta(titular);


create table movimiento_cuenta(
	num_movimiento numeric(18,0) constraint movimiento_cuenta_num_movimiento_pk 
		primary key,
	importe numeric(18,2) not null,
	tipo_movimiento char not null,
	concepto varchar2(50),
	comprobante blob,
	fecha_movimiento date not null

	cuenta_id not null constraint movimiento_cuenta_cuenta_id_fk 
		references cuenta(cuenta_id),
	constraint movimiento_cuenta_cuenta_id_pk primary key(cuenta_id)
);

create table cuenta_ahorro(
	num_tarjeta_debito varchar2(16) not null 
		constraint cuenta_ahorro_num_tarjeta_uk unique,
	retiro_max_cajero numeric(7,2) not null,

	cuenta_id not null constraint cuenta_ahorro_cuenta_id_fk 
		references cuenta(cuenta_id),
	constraint cuenta_ahorro_cuenta_id_pk primary key(cuenta_id),
	constraint cuenta_ahorro_retiro_max_cajero_chk 
		check( retiro_max_cajero <= 12500.00)
);

create table cuenta_inversion(
	porcentaje_interes numeric(5,2) not null,
	dia_retiro char not null,

	cuenta_id not null constraint cuenta_inversion_cuenta_id_fk 
		references cuenta(cuenta_id),
	constraint cuenta_inversion_cuenta_id_pk primary key(cuenta_id),
	constraint cuenta_inversion_dia_retiro_chk 
		check (dia_retiro not in('1','2','3','4','5','26','27','28','29','30','31'))
);

create sequence seq_cuenta
	start with 1001
	increment by 2
	no cycle
	cache 9;

prompt incrementando la secuencia seq_cuenta...
select seq_cuenta.nextval from dual;

prompt Imprimiendo el valor de la secuencia seq_cuenta sin incrementar ...
select seq_cuenta.currval from dual;