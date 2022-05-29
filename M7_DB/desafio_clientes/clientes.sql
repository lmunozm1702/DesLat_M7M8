--##################################################################################################
--##################################################################################################
--1. Cargar el respaldo de la base de datos unidad2.sql. (2 Puntos)

-- validar el path del archivo de entrada para adecuarlo a la ruta local
psql -U postgres postgres < c:\desafio\ROR\UN7\unidad2.sql


--##################################################################################################
--##################################################################################################
-- 2. El cliente usuario01 ha realizado la siguiente compra:
-- ● producto: producto9.
-- ● cantidad: 5.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este
-- requerimiento y luego consulta la tabla producto para validar si fue efectivamente
-- descontado en el stock. (3 Puntos)

CREATE OR REPLACE FUNCTION "public"."nueva_venta"("compra_usuario" varchar, "compra_producto" varchar, "compra_cantidad" numeric)
  RETURNS "pg_catalog"."int4" AS $BODY$
DECLARE
    cmp_id integer;
	prod_id integer;
BEGIN
   -- rebaja stock;
	 update producto set stock = stock - compra_cantidad where descripcion=compra_producto returning id into prod_id;


	 -- inserta la compra
	 insert into compra (cliente_id,fecha) values ((select id from cliente where cliente.nombre = compra_usuario), now())
	 returning id into cmp_id;

	 -- inserta detalle de la compra
	 insert into detalle_compra (compra_id,producto_id, cantidad) values (cmp_id,prod_id,compra_cantidad);

   -- Retorna el numero de orden
    RETURN cmp_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100

execute nueva_venta('usuario01','producto9',5);

select * from producto where id=9;

--##################################################################################################
--##################################################################################################
-- 3. El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8.
-- ● cantidad: 3 de cada producto.
-- ● fecha: fecha del sistema.
-- _ 2
-- www.desafiolatam.com
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este
-- requerimiento y luego consulta la tabla producto para validar que si alguno de ellos
-- se queda sin stock, no se realice la compra. (3 Puntos)

-- Crea la boleta vacía de productos
CREATE OR REPLACE FUNCTION "public"."crea_compra"("compra_usuario" varchar)
  RETURNS "pg_catalog"."int4" AS $BODY$
DECLARE
   cmp_id integer;
BEGIN
	 -- crea la boleta
	 insert into compra (cliente_id,fecha) values ((select id from cliente where cliente.nombre = compra_usuario), now())
	 returning id into cmp_id;

	 return cmp_id;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100


-- Agrega un producto a la boleta creada
  CREATE OR REPLACE FUNCTION "public"."agrega_producto"("id_boleta" numeric, "compra_producto" varchar, "compra_cantidad" numeric)
   RETURNS "pg_catalog"."int4" AS $BODY$
 DECLARE
 	 prod_id integer;
 	 detalle_id integer;
 BEGIN
    -- rebaja stock;
 	 update producto set stock = stock - compra_cantidad where descripcion=compra_producto returning id into prod_id;

 	 -- inserta detalle de la compra
 	 insert into detalle_compra (compra_id,producto_id, cantidad) values (id_boleta,prod_id,compra_cantidad) returning id into detalle_id;

    -- Retorna el numero de orden
     RETURN detalle_id;
 END;
 $BODY$
   LANGUAGE plpgsql VOLATILE
   COST 100

 -- Elimina la boleta completa, podría haber una voilación del CONSTRAINT de stock y el cliente podría
 -- disminuir la cantidad o no llevar el producto y continuar con la compa. O decidir no comprar y se
 -- utilizaría este SP para hacer lla anulación.

 CREATE OR REPLACE FUNCTION "public"."anula_boleta"("id_boleta" numeric)
   RETURNS "pg_catalog"."int4" AS $BODY$
 DECLARE
 	  productos RECORD;
 	  query_producto text;
 BEGIN
 	  query_producto := 'SELECT id, producto_id, cantidad FROM detalle_compra where compra_id=' || id_boleta;
     FOR productos IN EXECUTE query_producto LOOP
 						update producto set stock = stock + productos.cantidad where id = productos.producto_id;
     END LOOP;
 		delete from detalle_compra where compra_id=id_boleta;
 		delete from compra where id = id_boleta;

     RETURN 0;
 END;
 $BODY$
   LANGUAGE plpgsql VOLATILE
   COST 100

-- 4. Realizar las siguientes consultas (2 Puntos):
-- a. Deshabilitar el AUTOCOMMIT .
\set AUTOCOMMIT off

-- b. Insertar un nuevo cliente.
insert into cliente (nombre,email) values ('luis','lmunozm1702@gmail.com')

-- c. Confirmar que fue agregado en la tabla cliente.
select * from cliente where nombre = 'luis';

-- d. Realizar un ROLLBACK.
ROLLBACK;

-- e. Confirmar que se restauró la información, sin considerar la inserción del
-- punto b.
select * from cliente where nombre = 'luis';

-- f. Habilitar de nuevo el AUTOCOMMIT.
\set AUTOCOMMIT on
