--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Programa que corrije los folios de contrato y alquiler

--connect ff_proy_admin/proyectof

Prompt creando bloque pl/sql para ejecutar Procedimiento p_corrige_folios

-- El programa debe verificar que el folio tenga en formato adecuado, en caso de no tenerlo
-- usar la funcion p_corrige_folio

create or replace procedure p_corrige_folios is

cursor cur_alquileres is
select * from alquiler;

cursor cur_contrato is 
select * from contrato;

--variables
v_folio_gen varchar2(100);

begin

	for p in cur_alquileres loop
		v_folio_gen := f_genera_folio(p.vivienda_id,p.usuario_id);
		-- comparar v_folio_gen con el folio que de p,
		-- en caso de ser distinot hacer update
		update alquiler set folio_alquiler = v_folio_gen 
		where alquiler_id = p.alquiler_id;
	end loop;

	for p in cur_contrato loop
		v_folio_gen := f_genera_folio(p.vivienda_id,p.usuario_id);

		update contrato set folio = v_folio_gen 
		where contrato_id = p.contrato_id;
	end loop;

end;
/
show errors