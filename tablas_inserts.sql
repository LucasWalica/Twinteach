


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


