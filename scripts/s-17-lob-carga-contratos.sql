--@Autor: Francisco Pablo Rodrigo
--@Autor: Flores Garcia Karina
--@Fecha creación:04/12/2019
--@Descripción: Script encargado de actualizar contratos

--whenever sqlerror exit rollback
set serveroutput on
Prompt Actualizando pdf de contratos

Prompt conectando como usuario ff_proy_admin
connect ff_proy_admin/proyectof

Prompt creando procedimiento para actualizar pdfs.
create or replace procedure p_actualiza_contrato is
	v_bfile bfile;
	v_src_offset number := 1;
	v_dest_offset number := 1;
	v_dest_blob blob;
	v_src_length number;
	v_dest_length number;
	v_contador number := 1;
	v_nombre_archivo varchar2(1000);

cursor cur_contrato is
	select contrato_id,doc_pdf
	from contrato;

begin

	for r in cur_contrato loop
		v_src_offset := 1;
		v_dest_offset := 1;

		v_nombre_archivo := 'contrato'||v_contador||'.pdf';

		dbms_output.put_line('cargando pdf para '|| v_nombre_archivo);
		v_bfile := bfilename('PDF_DIR', v_nombre_archivo);

		if dbms_lob.fileexists(v_bfile) = 1 and not dbms_lob.isopen(v_bfile) = 1 then 
			dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
		else 
			raise_application_error(-20001, 'El archivo '
			|| v_nombre_archivo
			||' no existe en el directorio DATA_DIR'
			|| ' o el archivo esta abierto');
		end if;

		select doc_pdf into v_dest_blob
		from contrato
		where contrato_id = r.contrato_id
		for update;

		dbms_lob.loadblobfromfile(
			dest_lob => v_dest_blob,
			src_bfile => v_bfile,
			amount => dbms_lob.getlength(v_bfile),
			dest_offset => v_dest_offset,
			src_offset => v_src_offset
		);
		dbms_lob.close(v_bfile);

		v_src_length := dbms_lob.getlength(v_bfile);
		v_dest_length := dbms_lob.getlength(v_dest_blob);

		if v_src_length = v_dest_length then
			dbms_output.put_line('Escritura correcta, bytes escritos: '
			|| v_src_length);
		else 
			raise_application_error(-20002, 'Error al escribir datos.\n'
			|| ' Se esperaba escribir '
			|| v_src_length
			|| ' Pero solo se escribio '
			|| v_dest_length);
		end if;
		v_contador := v_contador + 1;
	end loop;
end;
/
show errors