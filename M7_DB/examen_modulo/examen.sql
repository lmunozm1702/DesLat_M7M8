-- Parte 1 - Creación del modelo conceptual, lógico y físico
-- 1. Realizar el modelo conceptual, considerando las entidades y relaciones entre ellas.
-- (1 Punto)

https://github.com/lmunozm1702/ruby-DL/blob/main/M7_DB/examen_modulo/Diagrama%20conceptual.drawio.png

-- 2. Realizar el modelo lógico, considerando todas las entidades y las relaciones entre
-- ellas, los atributos, normalización y creación de tablas intermedias de ser necesario.
-- (2 Puntos)

https://github.com/lmunozm1702/ruby-DL/blob/main/M7_DB/examen_modulo/Modelo%20Logico.drawio.png

-- 3. Realizar el modelo físico, considerando la especificación de tablas y columnas,
-- además de las claves externas. (2 Puntos)

https://github.com/lmunozm1702/ruby-DL/blob/main/M7_DB/examen_modulo/Modelo%20Fisico.drawio.png

-- Parte 2 - Creando el modelo en la base de datos
-- 1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas
-- definidas y sus atributos. (2 puntos).

CREATE DATABASE "dbBiblioteca"
WITH
  OWNER = "lmunozm1702"
  ENCODING = 'UTF8'
;

DROP TABLE IF EXISTS "public"."dbSocios";
CREATE TABLE "public"."dbSocios" (
  "rut" varchar(11) NOT NULL,
  "nombre" varchar(50) NOT NULL,
  "apellido" varchar(50) NOT NULL,
  "direccion" varchar(50) NOT NULL,
  "telefono" varchar(12) NOT NULL,
  PRIMARY KEY ("rut")
)
;

DROP TABLE IF EXISTS "public"."dbLibros";
CREATE TABLE "public"."dbLibros" (
  "isbn" varchar(15) NOT NULL,
  "titulo" varchar(50) NOT NULL,
  "paginas" numeric NOT NULL,
  PRIMARY KEY ("isbn")
)
;

DROP TABLE IF EXISTS "public"."dbPrestamos";
CREATE TABLE "public"."dbPrestamos" (
  "id_prestamos" serial,
  "socios_rut" varchar(11) NOT NULL,
  "libros_ISBN" varchar(15) NOT NULL,
  "fechainicio" date NOT NULL,
  "fechafin" date,
  PRIMARY KEY ("id_prestamos"),
  CONSTRAINT "fk_socios" FOREIGN KEY ("socios_rut") REFERENCES "public"."dbSocios" ("rut"),
  CONSTRAINT "fk_libros" FOREIGN KEY ("libros_ISBN") REFERENCES "public"."dbLibros" ("isbn")
)
;

DROP TABLE IF EXISTS "public"."dbDatosautor";
CREATE TABLE "public"."dbDatosautor" (
  "codigoautor" serial,
  "nombre" varchar(50) NOT NULL,
  "apellido" varchar(50) NOT NULL,
  "anonacimiento" varchar(4) NOT NULL,
  "anomuerte" varchar(4),
  PRIMARY KEY ("codigoautor")
)
;

DROP TABLE IF EXISTS "public"."dbAutores";
CREATE TABLE "public"."dbAutores" (
  "datosautor_codigo" integer NOT NULL,
  "libros_isbn" varchar(15) NOT NULL,
  "rol" varchar(9),
  PRIMARY KEY ("datosautor_codigo", "libros_isbn"),
  CONSTRAINT "fk_dautor" FOREIGN KEY ("datosautor_codigo") REFERENCES "public"."dbDatosautor" ("codigoautor"),
  CONSTRAINT "fk_libros" FOREIGN KEY ("libros_isbn") REFERENCES "public"."dbLibros" ("isbn")
)
;





-- 2. Se deben insertar los registros en las tablas correspondientes (1 punto).
insert into "public"."dbSocios" values('11111111','JUAN','SOTO','AVENIDA 1, SANTIAGO','+56911111111');
insert into "public"."dbSocios" values('22222222','ANA','PÉREZ','PASAJE 2, SANTIAGO','+56922222222');
insert into "public"."dbSocios" values('33333333','SANDRA','AGUILAR','AVENIDA 2, SANTIAGO','+56933333333');
insert into "public"."dbSocios" values('44444444','ESTEBAN','JEREZ','AVENIDA 3, SANTIAGO','+56944444444');
insert into "public"."dbSocios" values('55555555','SILVANA','MUÑOZ','PASAJE 3, SANTIAGO','+56955555555');

insert into "public"."dbLibros" values('1111111111111','CUENTOS DE TERROR',344);
insert into "public"."dbLibros" values('2222222222222','POESÍAS CONTEMPORANEAS',167);
insert into "public"."dbLibros" values('3333333333333','HISTORIA DE ASIA',511);
insert into "public"."dbLibros" values('4444444444444','MANUAL DE MECÁNICA ',298);

insert into "public"."dbPrestamos" values (1,'11111111','1111111111111','2020/01/20','2020/01/27');
insert into "public"."dbPrestamos" values (2,'55555555','2222222222222','2020/01/20','2020/01/30');
insert into "public"."dbPrestamos" values (3,'33333333','3333333333333','2020/01/22','2020/01/30');
insert into "public"."dbPrestamos" values (4,'44444444','4444444444444','2020/01/23','2020/01/30');
insert into "public"."dbPrestamos" values (5,'22222222','1111111111111','2020/01/27','2020/02/04');
insert into "public"."dbPrestamos" values (6,'11111111','4444444444444','2020/01/31','2020/02/12');
insert into "public"."dbPrestamos" values (7,'33333333','2222222222222','2020/01/31','2020/02/12');

insert into "public"."dbDatosautor" values (3,'JOSE','SALGADO','1968','2020');
insert into "public"."dbDatosautor" values (4,'ANA','SALGADO','1972','');
insert into "public"."dbDatosautor" values (1,'ANDRÉS','ULLOA','1982','');
insert into "public"."dbDatosautor" values (2,'SERGIO','MARDONES','1950','2012');
insert into "public"."dbDatosautor" values (5,'MARTIN','PORTA','1976','');

insert into "public"."dbAutores" values (3,'1111111111111','PRINCIPAL');
insert into "public"."dbAutores" values (4,'1111111111111','COAUTOR');
insert into "public"."dbAutores" values (1,'2222222222222','PRINCIPAL');
insert into "public"."dbAutores" values (2,'3333333333333','PRINCIPAL');
insert into "public"."dbAutores" values (5,'4444444444444','PRINCIPAL');

-- 3. Realizar las siguientes consultas:
-- a. Mostrar todos los libros que posean menos de 300 páginas. (0.5 puntos)

select * from "dbLibros" where paginas < 300;

-- b. Mostrar todos los autores que hayan nacido después del 01-01-1970.

select * from "dbDatosautor" where anonacimiento > '1969';

-- (0.5 puntos)
-- c. ¿Cuál es el libro más solicitado? (0.5 puntos).

select "dbPrestamos"."libros_ISBN", "dbLibros"."titulo" ,count("libros_ISBN") as cuenta
from "dbPrestamos" inner join "dbLibros"
on "dbPrestamos"."libros_ISBN" = "dbLibros"."isbn"
group by "dbPrestamos"."libros_ISBN", "dbLibros"."titulo"
order by cuenta desc;

-- d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto
-- debería pagar cada usuario que entregue el préstamo después de 7 días.
-- (0.5 puntos)

select "dbSocios"."nombre", "dbSocios"."apellido", "dbPrestamos"."libros_ISBN",
    ("dbPrestamos"."fechafin" - "dbPrestamos"."fechainicio") * 100 as multa
from "dbPrestamos" inner join "dbSocios" on "dbPrestamos"."socios_rut" = "dbSocios"."rut"
where "dbPrestamos"."fechafin" - "dbPrestamos"."fechainicio" > 7;
