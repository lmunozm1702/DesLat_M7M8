/* Parte 1 */
/*1. Crear una base de datos con nombre “Posts”.*/
DROP DATABASE IF EXISTS "dbPosts";

CREATE DATABASE "dbPosts"
    WITH
    OWNER = lmunozm1702
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


/*2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
contenido y descripción.*/
DROP TABLE IF EXISTS "posts";

CREATE TABLE posts
(
    id serial NOT NULL,
    usr_name varchar(40) NOT NULL,
    creation_date timestamp default now(),
    content varchar(40) NOT NULL,
    description varchar (200) NOT NULL,
    PRIMARY KEY (id)
)

/*3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".*/
INSERT INTO posts(
	usr_name, content, description)
	VALUES ('Pamela','Primer post de Pamela','Esta es la descripcion del primer post de Pamela');

INSERT INTO posts(
	usr_name, content, description)
	VALUES ('Pamela','Segundo post de Pamela','Esta es la descripcion del segundo post de Pamela');

INSERT INTO posts(
	usr_name, content, description)
	VALUES ('Carlos','Primer post de Carlos','Esta es la descripcion del primer post de Carlos');

/*4. Modificar la tabla post, agregando la columna título. (1 Punto)*/
ALTER TABLE IF EXISTS posts
    ADD COLUMN title character varying(40);

/*5. Agregar título a las publicaciones ya ingresadas. (1 Punto)*/
UPDATE Posts
SET title = 'Pamela: 1st. post'
WHERE id=1;

UPDATE Posts
SET title = 'Pamela: 2nd. post'
WHERE id=2;

UPDATE Posts
SET title = 'Carlos: 1st. post'
WHERE id=3;

/*6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)*/
INSERT INTO posts(
	usr_name, title, content, description)
	VALUES ('Pedro','Pedro: 1st. post','Primer post de Pedro','Esta es la descripcion del primer post de Pedro');

INSERT INTO posts(
	usr_name, title, content, description)
	VALUES ('Pedro','Pedro: 2nd. post','Segundo post de Pedro','Esta es la descripcion del segundo post de Pedro');

/*7. Eliminar el post de Carlos. (1 Punto)
8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
Parte 2
1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
creación y contenido, que se relacione con la tabla posts. (1 Punto)
2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
3. Crear un nuevo post para "Margarita". (1 Punto)
4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)*/
