--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Funcion para genener folios de acuerdo a los registros de
-- la vivienda y el usuario

connect ff_proy_admin/proyectof

Prompt creando bloque pl/sql para crear funcion f_genera_folio

create or replace function f_genera_folio(
	p_vivienda_id number,
	p_usuario_id number
) return varchar2 is

-- variables 
v_folio_gen varchar2(100);
v_fecha_status date;
v_vivienda_es_renta number(1,0);
v_vivienda_es_vacacional number(1,0);
v_vivienda_es_venta number(1,0);

begin 

	select es_renta, es_vacacional, es_venta, fecha_status 
	into v_vivienda_es_renta, v_vivienda_es_vacacional,v_vivienda_es_venta,
	v_fecha_status	
	from vivienda
	where vivienda_id = p_vivienda_id;

	if v_vivienda_es_renta = 1 and v_vivienda_es_vacacional = 1 then
		v_folio_gen := 'COA-v'||p_vivienda_id||'-u'||p_usuario_id||'-'|| 
		to_char(v_fecha_status,'dd-mm-yyyy') ;
	elsif v_vivienda_es_vacacional = 1 then
		v_folio_gen := 'ALQ-v'||p_vivienda_id||'-u'||p_usuario_id||'-'|| 
		to_char(v_fecha_status,'ddmm-yyyy') ;
	elsif v_vivienda_es_renta = 1 then 
		v_folio_gen := 'CON-v'||p_vivienda_id||'-u'||p_usuario_id||'-'|| 
		to_char(v_fecha_status,'dd-mm-yyyy') ;
	end if;

	return v_folio_gen;

end;
/
show errors