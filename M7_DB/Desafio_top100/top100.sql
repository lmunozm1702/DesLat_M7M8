/*1. Crear una base de datos llamada películas.*/

DROP DATABASE IF EXISTS "dbTitles";

CREATE DATABASE "dbTitles"
    WITH
    OWNER = lmunozm1702
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;



/*2. Cargar ambos archivos a su tabla correspondiente. (1 Punto)*/
DROP TABLE IF EXISTS "titles";
CREATE TABLE titles
(
    id integer NOT NULL,
    title varchar(150) NOT NULL,
    release_year numeric(4) NOT NULL,
    director varchar(80) NOT NULL,
    PRIMARY KEY (id)
)
COPY titles FROM 'peliculas.csv' csv header;

DROP TABLE IF EXISTS "actors";

CREATE TABLE actors
(
    id serial NOT NULL,
    id_title integer NOT NULL,
    actor varchar(40) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(id_title) REFERENCES titles(id)
)
COPY actors FROM 'reparto.csv' csv header;

/*  3. Obtener el ID de la película “Titanic”. */
select * from titles where title = 'Titanic';

/*  4. Listar a todos los actores que aparecen en la película "Titanic". */
select * from actors where id_title = (select id from titles where title = 'Titanic');

/*    5. Consultar en cuántas películas del top 100 participa Harrison Ford. */
select count(*) from actors where actor = 'Harrison Ford';


/*    6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
    manera ascendente. (1 punto)
    7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
    nombrado para la consulta como “longitud_titulo”. (1 punto)
    8. Consultar cual es la longitud más grande entre todos los títulos de las películas.*/
