1-crear cuenta-> 

INSERT INTO ALUMNO(CORREO, NOMBRE, CONTRASEÑA) VALUES (
    ("pepito@correo.com", "PepitoPiscinas", "hunter2")
)

2-login->
SELECT ID FROM ALUMNO WHERE CORREO = 'pepito@correo.com' AND CONTRASEÑA = "hunter2";

3-cambiar icono

UPDATE TABLE ALUMNO_CLASE SET ICONO = "urlejemplo2";

4

INSERT INTO PROFESOR (NOMBRE, EMAIL) VALUES (
    ("fonsi", "fonsifonsifonsi@fonsi.fonsi");
);

5-login profesor

SELECT ID FROM PROFESOR WHERE NOMBRE="F"

6-