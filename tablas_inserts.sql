


1-crear cuenta-> 

INSERT INTO ALUMNO(CORREO, NOMBRE, CONTRASEÑA) VALUES (
    ("pepito@correo.com", "PepitoPiscinas", "hunter2")
)

2-login->
SELECT ID FROM ALUMNO WHERE CORREO = 'pepito@correo.com' AND CONTRASEÑA = "hunter2";

3-cambiar icono

UPDATE TABLE ALUMNO_CLASE SET ICONO = "urlejemplo2";

4 profesor crear cuenta 

INSERT INTO PROFESOR (NOMBRE, EMAIL, CONTRASEÑA) VALUES (
    ("fonsi", "fonsifonsifonsi@fonsi.fonsi", "uwuwuwueOssas");
);

5-login profesor

SELECT ID FROM PROFESOR WHERE EMAIL="fonsifonsifonsi@fonsi.fonsi" AND CONTRASEÑA="uwuwuwueOssas"

6-crear nueva clase/curso
INSERT INTO CLASE(NOMBRE, ID_PROFESOR) VALUES 
("BADAT", (SELECT ID FROM PROFESOR WHERE NOMBRE = 'FONSI'));


INSERT INTO ALUMNO_CLASE()



7-ver informacion del curso 

select alumno.nombre, clase.nombre, clase.id, clase.PERIODO_PAZ  from alumno 
join ALUMNO_CLASE on ALUMNO_CLASE.id = alumno.id
join clase on clase.id_clase = clase.id
where clase.nombre = "BADAT"

INSERT INTO ALUMNO(NOMBRE, CONTRASEÑA, EMAIL) VALUES (
    ("Pito", "loremipsum123", "1234");
    ("Pato", "loremipsum1234", "12345");
    ("Thomas Jefferson", "loremipsum1234532123", "futbol");
)

INSERT INTO ALUMNO_CLASE(ID_ALUMNO, ID_PROFESOR, ID_CLASE) VALUES {
    ((SELECT ID FROM ALUMNO WHERE NOMBRE ="Pito"), 
        (SELECT ID FROM PROFESOR WHERE NOMBRE = 'fonsi'), 
        (SELECT ID FROM CLASE WHERE NOMBRE = "BADAT")
    ),
    ((SELECT ID FROM ALUMNO WHERE NOMBRE ="Pato"), 
        (SELECT ID FROM PROFESOR WHERE NOMBRE = 'fonsi'), 
        (SELECT ID FROM CLASE WHERE NOMBRE = "BADAT")
    ),
    ((SELECT ID FROM ALUMNO WHERE NOMBRE ="Thomas Jefferson"), 
        (SELECT ID FROM PROFESOR WHERE NOMBRE = 'fonsi'), 
        (SELECT ID FROM CLASE WHERE NOMBRE = "BADAT")
    ),
}


8-Alumno inserta codigo curso/solicita curso 

insert into participar(id_alumno, aceptado) 
values 
 (1, 1)
-- id del alumno, aceptado = 1 (no aceptado)

9-profesor acepta alumno 
update table participar
set participar.aceptado = 2 
where id_alumno = 1 

10- ver alumnos_curso 
select * from ALUMNO_CLASE 
join clase on ALUMNO_CLASE.ID_CLASE = clase.id 
where clase.nombre = "BADAT"

11 - ver cursos de un alumno en particular (creado)
SELECT alumno.nombre, clase.nombre from alumno 
join ALUMNO_CLASE on alumno.id = ALUMNO_CLASE.ID_ALUMNO
join clase on ALUMNO_CLASE.ID_CLASE = clase.id 
where alumno.nombre = "Pepito"

12 - se le dan objetos al alumno al aceptarle 
(huevo, oro y cofre)

insert into OBJETOS_TIENDA(ID_objeto, ID_PROPIETARIO,FUNCION)
values 
(1, 1 , "Abrelo o espera a que eclosione")
-- huevo

update ALUMNO_CLASE 
set ALUMNO_CLASE.oro = ALUMNO_CLASE.oro + 20
where ALUMNO_CLASE.id = 1
-- oro 

insert into cofre_alumno(ID_ALUMNO_CLASE, ID_cofre)
(1, 1)
-- cofre de madera (habria que crear el cofre)

13-Abrir cofre

14-Insertar objetos del cofre abierto
(monedas, piedras de fuego, calabaza, hansel)

delete from cofre_alumno 
where ID_ALUMNO_CLASE = 1 and ID_cofre = 1 

update ALUMNO_CLASE
set ALUMNO_CLASE.oro = ALUMNO_CLASE.oro + 20 
where ALUMNO_CLASE.id = 1 

insert into OBJETOS_TIENDA(ID_objeto, ID_PROPIETARIO, funcion)
values 
(4, 1, "gemas para el dragon")
(6, 1, "Piedras de conquista")

insert into CHIBIS(ID_PROPIETARIO, nombre, ataque, defensa, DESCRIPCION, FAMILIA)
values 
    (1,1, "hansel", 0, 2, "", 1)
    (21,1, "anubis", 10, 10, "dios egipcio", 8)

15 - ver pueblo/CHIBIS

select CHIBIS.id from chibis 
where chibis.ID_PROPIETARIO = 1 

16-ver softskills 
-- todas las softskills
select distinct softskills.nombre from softskills

-- de un alumno
select * from softskills where 
softskills.ID_ALUMNO_CLASE = 1


17-evaluar compañeros 
(mostrar username e icono de los alumnos antes de dar puntos)
(le da items al puntuador, puntos de valoracion)

-- mostrar username e iconos de alumnos 
select alumno.nombre, alumno.icono from alumno 
join ALUMNO_CLASE on alumno.id = ALUMNO_CLASE.id_alumno
join clase on clase.id = alumno_clase.id_clase
where clase.nombre = "BADAT"

-- puntuar softskills
insert into PUNTUAR(ID_PUNTUADOR, ID_PUNTUADO, SOFTSKILL, CANTIDAD)
values 
(1, 2, "Responsabilidad", 2)
-- añadir objeto tienda
insert into OBJETOS_TIENDA(ID_objeto, ID_PROPIETARIO, funcion)
values (21, 1, "permite alimnetar al dragon")

-- 18 profesor crea ranking 
insert into ranking(nombre_habilidad, )




