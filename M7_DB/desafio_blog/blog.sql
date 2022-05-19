/*1. Crear base de datos llamada blog.*/
DROP DATABASE IF EXISTS "dbBlog";

CREATE DATABASE "dbBlog"
    WITH
    OWNER = lmunozm1702
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

/*2. Crear las tablas indicadas de acuerdo al modelo de datos.*/
DROP TABLE IF EXISTS "usuario";
CREATE TABLE usuario
(
    id serial NOT NULL,
    email varchar(100) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS "post";
CREATE TABLE post
(
    id serial NOT NULL,
    usuario_id INTEGER NOT NULL,
    titulo varchar(100) NOT NULL,
    fecha date NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (id),
    FOREIGN KEY(usuario_id) REFERENCES usuario(id)
);

DROP TABLE IF EXISTS "comentario";
CREATE TABLE comentario
(
    id serial NOT NULL,
    usuario_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    texto varchar(100) NOT NULL,
    fecha date NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (id),
    FOREIGN KEY(usuario_id) REFERENCES usuario(id),
    FOREIGN KEY(post_id) REFERENCES post(id)
);
/*3. Insertar los siguientes registros.*/
insert into usuario values (1,'usuario01@hotmail.com');
insert into usuario values (2,'usuario02@gmail.com');
insert into usuario values (3,'usuario03@gmail.com');
insert into usuario values (4,'usuario04@hotmail.com');
insert into usuario values (5,'usuario05@yahoo.com');
insert into usuario values (6,'usuario06@hotmail.com');
insert into usuario values (7,'usuario07@yahoo.com');
insert into usuario values (8,'usuario08@yahoo.com');
insert into usuario values (9,'usuario09@yahoo.com');

insert into post values (1,1,'Post 1: Esto es malo','2020-06-29');
insert into post values (2,5,'Post 2: Esto es malo','2020-06-20');
insert into post values (3,1,'Post 3: Esto es excelente','2020-05-30');
insert into post values (4,9,'Post 4: Esto es bueno','2020-05-09');
insert into post values (5,7,'Post 5: Esto es bueno','2020-07-10');
insert into post values (6,5,'Post 6: Esto es excelente','2020-07-18');
insert into post values (7,8,'Post 7: Esto es excelente','2020-07-07');
insert into post values (8,5,'Post 8: Esto es excelente','2020-05-14');
insert into post values (9,2,'Post 9: Esto es bueno','2020-05-08');
insert into post values (10,6,'Post 10: Esto es bueno','2020-06-02');
insert into post values (11,4,'Post 11: Esto es bueno','2020-05-05');
insert into post values (12,9,'Post 12: Esto es malo','2020-07-23');
insert into post values (13,5,'Post 13: Esto es excelente','2020-05-30');
insert into post values (14,8,'Post 14: Esto es excelente','2020-05-01');
insert into post values (15,7,'Post 15: Esto es malo','2020-06-17');


insert into comentario values (1,3,6,'Este es el comentario 1','2020-07-08');
insert into comentario values (2,4,2,'Este es el comentario 2','2020-06-07');
insert into comentario values (3,6,4,'Este es el comentario 3','2020-06-16');
insert into comentario values (4,2,13,'Este es el comentario 4','2020-06-15');
insert into comentario values (5,6,6,'Este es el comentario 5','2020-05-14');
insert into comentario values (6,3,3,'Este es el comentario 6','2020-07-08');
insert into comentario values (7,6,1,'Este es el comentario 7','2020-05-22');
insert into comentario values (8,6,7,'Este es el comentario 8','2020-07-09');
insert into comentario values (9,8,13,'Este es el comentario 9','2020-06-30');
insert into comentario values (10,8,6,'Este es el comentario 10','2020-06-19');
insert into comentario values (11,5,1,'Este es el comentario 11','2020-05-09');
insert into comentario values (12,8,15,'Este es el comentario 12','2020-06-17');
insert into comentario values (13,1,9,'Este es el comentario 13','2020-05-01');
insert into comentario values (14,2,5,'Este es el comentario 14','2020-05-31');
insert into comentario values (15,4,3,'Este es el comentario 15','2020-06-28');


/* 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5.*/

select usuario.id, usuario.email, post.titulo
from usuario,post
where usuario.id=post.usuario_id and usuario.id=5;

/* 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
      por el usuario con email usuario06@hotmail.com.*/

select usuario.id, usuario.email, comentario.texto
from usuario, comentario
where usuario.id = comentario.usuario_id
and usuario.email <> 'usuario06@hotmail.com';

/* 6. Listar los usuarios que no han publicado ningún post.*/
select * from usuario where id not in (select distinct usuario_id from post)

select * from usuario left join post on usuario.id = post.usuario_id where post.usuario_id IS NULL
/* 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).*/
select post.id as id_post,
       post.usuario_id as usuario,
       post.titulo as titulo,
			 post.fecha as fecha_post,
			 comentario.texto as comentario,
			 comentario.fecha as fecha_comentario
from post left JOIN comentario on post.id = comentario.post_id
order by post.id;

/* 8. Listar todos los usuarios que hayan publicado un post en Junio.*/
select usuario.id, usuario.email, post.fecha
from usuario left join post on usuario.id = post.usuario_id
where post.fecha BETWEEN '2020-06-01' and '2020-06-30'
