create table alumno(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CORREO VARCHAR(40) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    CONTRASEÑA VARCHAR(50) NOT NULL,
    ICONO VARCHAR(2083) NOT NULL
)

create table participar(
    id int PRIMARY key AUTO_INCREMENT,
    id_alumno int not null, 
    FOREIGN key (id_alumno) REFERENCES alumno(ID),
    aceptado int check (aceptado in (1, 2))
)

CREATE TABLE PROFESOR(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CORREO VARCHAR(40) NOT NULL,
    NOMBRE VARCHAR(50) NOT NULL,
    CONTRASEÑA VARCHAR(50) NOT NULL,
    ICONO VARCHAR(2083) NOT NULL DEFAULT "iconoguapo.com"
)

create table clase (
    ID int PRIMARY key AUTO_INCREMENT,
    Nombre varchar(100) not null,
    PERIODO_PAZ int check(PERIODO_PAZ in(1,2)),
    ID_Profesor int,
    FOREIGN KEY (ID_Profesor) REFERENCES PROFESOR(ID)
)

create table aceptar_alumno(
    ID int PRIMARY key AUTO_INCREMENT,
    ID_ALUMNO INT,
    ID_Profesor int,
    CLAVE VARCHAR(30) NOT NULL,
    alumno_aceptado int check(alumno_aceptado in(1, 2, 3)),
    FOREIGN key (ID_ALUMNO) REFERENCES alumno(ID),
    FOREIGN key(ID_Profesor) REFERENCES PROFESOR(ID)
)

CREATE TABLE COFRE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TIPO_COFRE VARCHAR(20) NOT NULL,
    RECOMPENSAS_ORO INT NOT NULL,
    NUM_CHIBIS INT NOT NULL,
    NUM_GEMAS INT NOT NULL, 
    NUM_RUNAS INT NOT NULL
)
-- (FLOOR(RAND() * 20) + 1); (NUMERO RANDOM DE 1 A 20) EJEMPLO


CREATE TABLE ALUMNO_CLASE(
    ID_ALUMNO_CLASE INT PRIMARY KEY AUTO_INCREMENT,
    ID_ALUMNO INT,
    ID_CLASE INT,
    CODICIA INT UNSIGNED DEFAULT 0,
    DEFENSA INT UNSIGNED DEFAULT 0,
    MONEDAS INT UNSIGNED DEFAULT 0,
    ATAQUE INT UNSIGNED DEFAULT 0,
    FOREIGN KEY(ID_ALUMNO) REFERENCES alumno(ID),
    FOREIGN KEY(ID_CLASE) REFERENCES CLASE(ID),
)

create table cofre_alumno(
    ID_cofre_alumno int PRIMARY key AUTO_INCREMENT,
    ID_ALUMNO_CLASE int not null,
    ID_cofre int not null,
    FOREIGN key (ID_ALUMNO_CLASE) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    FOREIGN key (ID_cofre) REFERENCES COFRE(ID) 
)

--relacion con un regalo entre medias->
CREATE TABLE TAREA(
    ID INT PRIMARY KEY,
    ID_PROFESOR INT, 
    nombre_tarea varchar(500),
    id_habilidad int,
    FOREIGN key(id_habilidad) REFERENCES ranking(ID),
    FOREIGN KEY (ID_PROFESOR) REFERENCES PROFESOR(ID)
)

CREATE TABLE TAREA_ALUMNO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_TAREA INT,
    FOREIGN KEY (ID_TAREA) REFERENCES TAREA(ID),
    Nota INT DEFAULT 0,
    ID_ALUMNO_CLASE INT,
    FOREIGN key (ID_ALUMNO_CLASE) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE)
)

CREATE TABLE ATACAR(
    ID_ATAQUE INT PRIMARY KEY AUTO_INCREMENT,
    ID_ATACANTE INT,
    ID_DEFENSOR INT,
    FOREIGN KEY(ID_ATACANTE) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    FOREIGN KEY(ID_DEFENSOR) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE)
)

CREATE TABLE PUNTUAR(
    ID_PUNTUAJE INT PRIMARY KEY AUTO_INCREMENT,
    ID_PUNTUADOR INT,
    ID_PUNTUADO INT,
    SOFTSKILL VARCHAR(40) NOT NULL 
    CHECK(SOFTSKILL="Responsabilidad" or
          SOFTSKILL="Cooperacion" or 
          SOFTSKILL="Autonomia_e_iniciativa" or 
          SOFTSKILL="Gestion_emocional" or 
          SOFTSKILL="Habilidad_de_pensamiento"),
    CANTIDAD INT CHECK(CANTIDAD BETWEEN 1 AND 3),
    FOREIGN KEY(ID_PUNTUADOR) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),  
    FOREIGN KEY(ID_PUNTUADO) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE)
)

create table softskills(
    id_softskill int PRIMARY key AUTO_INCREMENT, 
    nombre varchar(80),
    CHECK(nombre="Responsabilidad" or
          nombre="Cooperacion" or 
          nombre="Autonomia_e_iniciativa" or 
          nombre="Gestion_emocional" or 
          nombre="Habilidad_de_pensamiento"),
    ID_ALUMNO_CLASE int not null, 
    FOREIGN key (ID_ALUMNO_CLASE) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    puntos int not null check(puntos>=0)
)

-- MONIGOTES

CREATE TABLE DRAGON(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_PROPIETARIO INT ,
    FOREIGN KEY(ID_PROPIETARIO) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    NOMBRE VARCHAR(30) NOT NULL,
    ATAQUE INT CHECK(ATAQUE>=0),
    DEFENSA INT CHECK(DEFENSA>=0),
    DESCRIPCION VARCHAR(50),
    NIVEL INT CHECK(NIVEL>=0)
)

CREATE TABLE MASCOTAS(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_PROPIETARIO INT ,
    FOREIGN KEY(ID_PROPIETARIO) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    NOMBRE VARCHAR(30) NOT NULL,
    ATAQUE INT CHECK(ATAQUE>=0),
    DEFENSA INT CHECK(DEFENSA>=0),
    DESCRIPCION VARCHAR(50),
    HABILIDAD_ESPECIAL VARCHAR(100)
)

CREATE TABLE CHIBIS(
    ID INT PRIMARY KEY,
    ID_PROPIETARIO INT ,
    FOREIGN KEY(ID_PROPIETARIO) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    NOMBRE VARCHAR(30) NOT NULL,
    ATAQUE INT CHECK(ATAQUE>=0),
    DEFENSA INT CHECK(DEFENSA>=0),
    DESCRIPCION VARCHAR(50),
    FAMILIA INT CHECK (FAMILIA BETWEEN 1 AND 8)
)

-- FIN MONIGOTES

--EDIFICIOS

--  ORO_DIA NIVEL/GEMAS_DIAS * 14 POR EJEMPLO
--  MAX ORO/ MAX GEMAS SAME
CREATE TABLE EDIFICIOS(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_ALUMNO_PROPIETARIO INT ,
    FOREIGN KEY (ID_ALUMNO_PROPIETARIO) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    TIPO INT CHECK(TIPO in (1,2)),
    NIVEL INT CHECK (NIVEL BETWEEN 1 AND 20)
)

CREATE TABLE OBJETOS_TIENDA(
    ID_objeto INT PRIMARY KEY,
    ID_PROPIETARIO INT, 
    FOREIGN KEY(ID_PROPIETARIO) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    FUNCION VARCHAR(200)
)

CREATE TABLE CASILLAS(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    N_FILA INT CHECK(N_FILA>=0 AND N_FILA<=200),
    N_CASILLA INT CHECK(N_CASILLA>=0 AND N_CASILLA<=200),
    ESTRUCUTURA INT CHECK(ESTRUCUTURA>=1 AND ESTRUCUTURA<=10),
    ID_CLASE INT,
    FOREIGN KEY(ID_CLASE) REFERENCES CLASE(ID),
    ALUMNO_POSEEDOR INT,
    FOREIGN KEY(ALUMNO_POSEEDOR) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE)
)


CREATE TABLE INVADIR(
    ID_IVASION INT PRIMARY KEY AUTO_INCREMENT, 
    ID_INVASOR INT,
    FOREIGN KEY(ID_INVASOR) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    ID_INVADIDO INT,
    FOREIGN KEY(ID_INVADIDO) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    ID_CASILLA INT,
    FOREIGN KEY(ID_CASILLA) REFERENCES CASILLAS(ID)
)


CREATE TABLE NOTIFICACIONES(
    ID_NOTIFICACION INT PRIMARY KEY, 
    ID_Alumno INT not null,
    FOREIGN key (ID_Alumno) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    INVASION_ref INT,
    FOREIGN key(INVASION_ref) REFERENCES INVADIR(ID_IVASION),
    ATAQUE_ref INT,
    FOREIGN key(ATAQUE_ref) REFERENCES ATACAR(ID_ATAQUE),
    PUNTUA_ref INT,
    FOREIGN key(PUNTUA_ref) REFERENCES PUNTUAR(ID_PUNTUAJE),
    TAREA_NOT INT,
    FOREIGN key(TAREA_NOT) REFERENCES TAREA(ID_PUNTUAJE)
);



create table ranking(
    ID int PRIMARY key AUTO_INCREMENT,
    nombre_habilidad varchar(200) not null,
    id_clase int,
    FOREIGN key (id_clase) REFERENCES clase(ID)
)

create table ranking_alumno(
    ID int PRIMARY key AUTO_INCREMENT,
    id_alumno int, 
    FOREIGN key (id_alumno) REFERENCES ALUMNO_CLASE(ID_ALUMNO_CLASE),
    id_habilidad int,
    FOREIGN key (id_habilidad) REFERENCES ranking(ID),
    puntos int check(puntos>=0)
)






CREATE TABLE    (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(30) NOT NULL,
    ID_PROFESOR INT,
    FOREIGN KEY(ID_PROFESOR) REFERENCES PROFESOR(ID),
    ESTADO_PAZ tinyint(1) NOT NULL DEFAULT=0,
    PERIODO_PAZ INTERVAL SECOND; 
    ID_ranking int 
    FOREIGN key (ID_ranking) REFERENCES ranking(ID)   
)