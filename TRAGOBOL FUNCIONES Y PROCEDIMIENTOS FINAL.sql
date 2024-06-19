--FUNCIONES Y PROCEDIMIENTOS PROYECTO I PARTE 2

--1
create or replace function calcular_pedido_total(pedido_id int)
returns decimal as $$
declare
    total_amount decimal;
begin
    select sum(precioProducto * cantidad)
    into total_amount
    from pedidoProducto
    inner join producto on pedidoProducto.IDProducto = producto.IDProducto
    where IDPedido = pedido_id;

    return total_amount;
end;
$$ language plpgsql;

select calcular_pedido_total(1);

--2
create or replace function obtener_cliente_por_ci(ci_cliente varchar)
returns table (
    id_cliente int,
    codigo_cliente varchar,
    correo_cliente varchar,
    nombre_cliente varchar,
    apellido_paterno varchar,
    apellido_materno varchar,
    edad_cliente int) as $$
begin
    return query
    select
        IDCliente,
        codigoCliente,
        correoCliente,
        nombreCliente,
        apellidoPaterno,
        apellidoMaterno,
        edadCliente
    from
        cliente
    where
        CICliente = ci_cliente;
end;
$$ language plpgsql;

select * from obtener_cliente_por_ci('87542013');

--3
create or replace function ventas_totales_por_vendedor(vendedor_id int)
returns decimal as $$
declare
    total_sales decimal := 0;
begin
    select coalesce(sum(p.montoPedido), 0)
    into total_sales
    from pedido p
    join ubicacion u on p.IDPedido = u.IDPedido
    where u.IDVendedor = vendedor_id;

    return total_sales;
end;
$$ language plpgsql;

select ventas_totales_por_vendedor(2);

--4
create or replace function calcular_total_pagos_por_mes(anio int) 
returns table(mes int, total_pagos numeric) as $$
begin
    return query
    select extract (month from fp.fechaPago)::int as mes, sum(p.montoPago) as total_pagos
    from fechaPago fp
    inner join planpagos pa on fp.IDFechaPago = pa.IDFechaPago
    inner join pago p on p.idpago=pa.idpago
    where extract (year from fp.fechaPago) = anio
    group by extract (month from fp.fechaPago);
end;
$$ language plpgsql;

select  * from calcular_total_pagos_por_mes(2023);

--5
create or replace function ubicacionPedido(IDPed int) 
returns text as $$
declare 
    ubicacionTexto text;
begin
    select (calleUbicacion || ', ' || numeroUbicacion || ', ' || zona) into ubicacionTexto
    from ubicacion where IDPedido = IDPed;
    return ubicacionTexto;
end;
$$ language plpgsql;

select ubicacionPedido(2);

--6
create or replace function  vendedoresCon1Telefono() 
returns table(
    IDVendedor int,
    NombreVendedor varchar(45),
    CantidadTelefonos int
) as $$
begin
    return query
    select 
        tv.IDVendedor,
        v.nombreVendedor,
        cast(count(tv.numeroTelefonoVendedor) as integer) as CantidadTelefonos
    from telefonoVendedor tv
    inner join vendedor v on tv.IDVendedor = v.IDVendedor
    group by tv.IDVendedor, v.nombreVendedor
    having count(tv.numeroTelefonoVendedor) = 1;
end;
$$ language plpgsql;

select * from vendedoresCon1Telefono();

--7
create or replace function calculate_total_sales(product_id int)
returns decimal as $$
declare
    total_sales decimal := 0;
begin
    create temp table temp_sales as
    select cantidad, precioProducto
    from pedidoProducto
    inner join producto on pedidoProducto.IDProducto = producto.IDProducto
    where producto.IDProducto = product_id;

    select sum(cantidad * precioProducto) into total_sales
    from temp_sales;

    drop table temp_sales;

    return total_sales;
end;
$$ language plpgsql;

select  calculate_total_sales(1);

--8
create or replace function obtener_promedio_edad_clientes()
returns table(
    promedio_edad numeric,
    total_clientes int
) as $$
declare
    total_edad int := 0;
begin
    select SUM(edadCliente), COUNT(*)
    into total_edad, total_clientes
    from cliente;
   
    if total_clientes > 0 then
        promedio_edad := total_edad / total_clientes;
    else
        promedio_edad := 0;
    end if;
   	return query select promedio_edad, total_clientes;
end;
$$ language plpgsql;

select * from obtener_promedio_edad_clientes();

--9
select * from cliente c;
create or replace function gestionar_cliente_iud(
	p_operacion varchar(10),
	p_id_cliente int,
	p_codigo_cliente varchar(50),
	p_ci_cliente varchar(50),
	p_correo_cliente varchar(100),
	p_nombre_cliente varchar(50),
	p_apellidopaterno_cliente varchar(50),
	p_apellidomaterno_cliente varchar(50),
	p_edad_cliente int
)
returns varchar as $$
declare 
	p_mensaje varchar;
begin 
	if p_operacion='insert' then
	insert into cliente(
				codigocliente,
				cicliente,
				correocliente,
				nombrecliente,
				apellidopaterno,
				apellidomaterno,
				edadcliente)
	values(
			p_codigo_cliente,
			p_ci_cliente,
			p_correo_cliente,
			p_nombre_cliente,
			p_apellidopaterno_cliente,
			p_apellidomaterno_cliente,
			p_edad_cliente);
		p_mensaje:='Se ha insertado el registro correctamente';
		raise notice 'Agregar';
	elseif p_operacion='update' then
		update cliente set
		codigocliente = p_codigo_cliente,
		cicliente = p_ci_cliente,
		correcocliente = p_correco_cliente,
		nombrecliente=p_nombre_cliente,
		apellidopaterno=p_apellidopaterno_cliente,
		apellidomaterno=p_apellidomaterno_cliente,
		edadcliente=p_edad_cliente
		where idcliente = p_id_cliente;
		p_mensaje:= 'Se ha actualizado el registro correctamente.';	
		raise notice 'Modificar';
	elseif p_operacion='delete' then 
		delete from cliente where idcliente=p_id_cliente;
		p_mensaje:='Se ha eliminado el registro correctamente';
		raise notice 'Eliminar';
	else
		raise exception 'Operación no válida: %',p_operacion;
	end if;

	return (p_operacion|| ' ' ||p_mensaje);
	
end;
$$ language plpgsql;

--10
select * from vendedor;
create or replace function gestionar_vendedor_iud(
	p_operacion varchar(10),
	p_id_vendedor int,
	p_nombre_vendedor varchar(50),
	p_apellidomaterno_vendedor varchar(50),
	p_apellidopaterno_vendedor varchar(50),
	p_codgio_vendedor varchar(50),
	p_ci_vendedor varchar(50),
	p_zona_vendedor varchar(50),
	p_salario_vendedor int
)
returns varchar as $$
declare 
	p_mensaje varchar;
begin 
	if p_operacion='insert' then
	insert into vendedor(
				nombrevendedor,
				apellidomaternovendedor,
				apellidopaternovendedor,
				codigovendedor,
				civendedor,
				zonavendedor,
				salario)
	values(
			p_nombre_vendedor,
			p_apellidomaterno_vendedor,
			p_apellidopaterno_vendedor,
			p_codgio_vendedor,
			p_ci_vendedor,
			p_zona_vendedor,
			p_salario_vendedor);
		p_mensaje:='Se ha insertado el registro correctamente';
		raise notice 'Agregar';
	elseif p_operacion='update' then
		update vendedor set
		nombrevendedor=p_nombre_vendedor,
		apellidomaternovendedor=p_apellidomaterno_vendedor,
		apellidopaternovendedor=p_apellidopaterno_vendedor,
		codigovendedor=p_codgio_vendedor,
		civendedor=p_ci_vendedor,
		zonavendedor=p_zona_vendedor,
		salario=p_salario_vendedor
		where idvendedor = p_id_vendedor;
		p_mensaje:= 'Se ha actualizado el registro correctamente.';	
		raise notice 'Modificar';
	elseif p_operacion='delete' then 
		delete from vendedor where idvendedor=p_id_vendedor;
		p_mensaje:='Se ha eliminado el registro correctamente';
		raise notice 'Eliminar';
	else
		raise exception 'Operación no válida: %',p_operacion;
	end if;

	return (p_operacion|| ' ' ||p_mensaje);
	
end;
$$ language plpgsql;

--11
select * from institucion i;
create or replace function gestionar_institucion_iud(
	p_operacion varchar(10),
	p_id_institucion int,
	p_nombre_institucion varchar(50),
	p_codigo_institucion varchar(50),
	p_numerofiscal int,
	p_correo_institucion varchar(50),
	p_idrepresentantelegal int
)
returns varchar as $$
declare 
	p_mensaje varchar;
begin 
	if p_operacion='insert' then
	insert into institucion(
				nombreinstitucion,
				codigoinstitucion,
				numerofiscal,
				correo,
				idrepresentantelegal)
	values(
			p_nombre_institucion,
			p_codigo_institucion,
			p_numerofiscal,
			p_correo_institucion,
			p_idrepresentantelegal);
		p_mensaje:='Se ha insertado el registro correctamente';
		raise notice 'Agregar';
	elseif p_operacion='update' then
		update institucion set
		nombreinstitucionr=p_nombre_institucion,
		codigoinstitucion=p_codigo_institucion,
		numerofiscal=p_numerofiscal,
		correo=p_correo_institucion,
		idrepresentantelegal=p_idrepresentantelegal
		where idinstitucion = p_id_institucion;
		p_mensaje:= 'Se ha actualizado el registro correctamente.';	
		raise notice 'Modificar';
	elseif p_operacion='delete' then 
		delete from institutcion where idinstitucion=p_id_institucion;
		p_mensaje:='Se ha eliminado el registro correctamente';
		raise notice 'Eliminar';
	else
		raise exception 'Operación no válida: %',p_operacion;
	end if;

	return (p_operacion|| ' ' ||p_mensaje);
	
end;
$$ language plpgsql;