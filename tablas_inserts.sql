


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

insert into alumno_clase(id_alumno, id_clase, codicia, monedas)
values
    (1, 1, 0, 0 )

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

SELECT ca.ID_cofre
FROM cofre_alumno AS ca
JOIN COFRE AS c ON ca.ID_cofre = c.ID
JOIN ALUMNO_CLASE AS ac ON ca.ID_ALUMNO_CLASE = ac.ID_ALUMNO_CLASE
WHERE ac.ID_ALUMNO = <ID_DEL_ALUMNO>
AND ca.ID_cofre NOT IN (SELECT ID_cofre FROM cofre_alumno)


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


18 profesor crea ranking 

insert into ranking(nombre_habilidad,id_clase)
values 
    ("Base de datos", 1)

    18.1 profesor crea tarea 
        insert into TAREA(ID_PROFESOR, nombre_tarea, id_habilidad)
        values 
        (1, "Modelo relacional provincias", 1)

    18.2 profesor guarda notas a 10 y entrega cofres
        insert into tarea_alumno(ID_TAREA, Nota, ID_ALUMNO_CLASE)
        values 
        (1, 10, 1)
        (1, 10, 2)

        -- asignar cofres
        insert into cofre_alumno(ID_ALUMNO_CLASE, ID_cofre)
        values
        (1, 4)
        (2, 4)

19-alumno mira rankings del curso 

select alumno.NOMBRE, alumno.ICONO, ranking_alumno.puntos from ranking
join ranking_alumno on ranking.ID = ranking_alumno.id_habilidad
join ALUMNO_CLASE on ranking_alumno.id_alumno = ALUMNO_CLASE.ID_ALUMNO_CLASE
join alumno on ALUMNO_CLASE.ID_ALUMNO_CLASE = alumno.ID
join clase on ranking.id_clase = clase.ID
where clase.ID = 1 


    19.1-alumno mira objetos 
-- ver ojetos que no son monigotes
select * from  OBJETOS_TIENDA
join ALUMNO_CLASE on OBJETOS_TIENDA.ID_PROPIETARIO = ALUMNO_CLASE.ID_ALUMNO_CLASE
where ALUMNO_CLASE.ID = 1 
-- ver monigotes
    --dragon
select DRAGON.NOMBRE, DRAGON.ATAQUE, DRAGON.DEFENSA, DRAGON.DESCRIPCION, DRAGON.NIVEL FROM DRAGON 
WHERE DRAGON.ID_PROPIETARIO = 1
    --mascotas
SELECT MASCOTAS.NOMBRE, MASCOTAS.ATAQUE, MASCOTAS.DEFENSA, MASCOTAS.DESCRIPCION, MASCOTAS.HABILIDAD_ESPECIAL FROM MASCOTAS
WHERE MASCOTAS.ID_PROPIETARIO = 1
    -- chibis 
select CHIBIS.NOMBRE, CHIBIS.ATAQUE, CHIBIS.DEFESA, CHIBIS.DESCRIPCION, CHIBIS.FAMILIA from CHIBIS
WHERE CHIBIS.ID_PROPIETARIO = 1


20-Alumno ataca a otro 
INSERT INTO ATAQUE(ID_ALUMNO, ID_DEFENSOR, MONEDAS, CODICIA) VALUES (
    123, 456, 100, 1
)

UPDATE alumno_clase
SET MONEDAS = MONEDAS - (SELECT MONEDAS FROM ATAQUES WHERE ID_DEFENSOR = ID_DEFENSOR_PROGRAMA)
WHERE ID = ID_DEFENSOR_PROGRAMA;

UPDATE alumno_clase 
SET MONEDAS = CASE WHEN ATAQUE_EXITOSO THEN (MONEDAS + (SELECT MONEDAS FROM ATAQUES WHERE ID_ATACANTE = ID_ATACANTE_PROGRAMA))
ELSE MONEDAS,
SET CODICIA = CODICIA + (SELECT MONEDAS FROM ATAQUES WHERE ID_ATACANTE = ID_ATACANTE_PROGRAMA)
WHERE ID = ID_ATACANTE_PROGRAMA;

INSERT INTO NOTIFICACIONES(ID_ALUMNO, ATAQUE_REF) VALUES
(ID_DEFENSOR_PROGRAMA, ID_ATAQUE_PROGRAMA),
(ID_ATACANTE_PROGRAMA, ID_ATAQUE_PROGRAMA);
