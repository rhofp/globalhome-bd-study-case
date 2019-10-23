update cuenta_inversion set total_portafolios = 1
	where cuenta_id = (select cuenta_id 
	from cuenta_inversion where num_contrato='124884-2');
