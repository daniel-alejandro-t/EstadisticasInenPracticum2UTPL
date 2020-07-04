-- Borra la BBDD
DROP DATABASE EstadisticasPracticum;

-- Crea una base de datos nueva con el juego de caracteres en español
CREATE DATABASE EstadisticasPracticum CHARACTER SET utf8 COLLATE utf8_spanish_ci;

-- Borra el usuario
DROP USER analista@localhost;

-- Accede a la nueva BBDD
USE EstadisticasPracticum;

-- Crea un usuario que tenga acceso a la BBDD
CREATE USER 'analista'@'localhost' IDENTIFIED BY "maria";

-- Le Concede permisos de solo lectura
GRANT SELECT ON EstadisticasPracticum.* TO analista IDENTIFIED BY "maria";

-- Recarga todos los privilegios
FLUSH PRIVILEGES;

-- Creación de tablas
CREATE TABLE Etnia(
    idEtnia     SMALLINT(8) UNSIGNED NOT NULL PRIMARY KEY,
    etnia VARCHAR(15) NOT NULL
);

CREATE TABLE Instruccion(
    idInstruccion   SMALLINT(10) UNSIGNED NOT NULL PRIMARY KEY,
    instruccion VARCHAR(45) NOT NULL);


CREATE TABLE RamaActividad(
    idRamaActividad     SMALLINT(21) UNSIGNED NOT NULL PRIMARY KEY,
    ramaActividad VARCHAR(75) NOT NULL
);

CREATE TABLE Condicion(
    idCondicion     SMALLINT(8) UNSIGNED NOT NULL PRIMARY KEY,
    condicion VARCHAR(48) NOT NULL
);

CREATE TABLE Ocupacion(
    idOcupacion SMALLINT(10) UNSIGNED NOT NULL PRIMARY KEY,
    ocupacion VARCHAR(52) NOT NULL
);

CREATE TABLE Provincia(
    idProvincia SMALLINT(2) UNSIGNED NOT NULL PRIMARY KEY,
    provincia VARCHAR(45) NOT NULL

    -- FOREIGN KEY (idProvincia)       REFERENCES Provincia(idProvincia)
);

CREATE TABLE Area(
    idArea  SMALLINT(1) UNSIGNED NOT NULL PRIMARY KEY,
    area    VARCHAR(6) NOT NULL
);

CREATE TABLE Canton(
    idCanton        SMALLINT(4) UNSIGNED NOT NULL PRIMARY KEY,
    canton          VARCHAR(35) NOT NULL,
    idProvincia     SMALLINT(2) UNSIGNED NOT NULL,

    FOREIGN KEY (idProvincia)       REFERENCES Provincia(idProvincia)

);

CREATE TABLE EstadoCivil(
    idEstadoCivil   SMALLINT(6) UNSIGNED NOT NULL PRIMARY KEY,
    estadoCivil VARCHAR(45) NOT NULL);


CREATE TABLE Sectorizacion(
    idSectorizacion SMALLINT(4) UNSIGNED NOT NULL PRIMARY KEY,
    sectorizacion VARCHAR(31) NOT NULL);

CREATE TABLE Genero(
    idGenero SMALLINT(1) UNSIGNED NOT NULL PRIMARY KEY,
    genero VARCHAR(6) NOT NULL
);

CREATE TABLE Persona(
    idPersona   VARCHAR(27) UNIQUE NOT NULL PRIMARY KEY,
    fecha       DATE NOT NULL,
    idProvincia SMALLINT(2)  UNSIGNED NOT NULL, -- Rango: 1-24
    idCanton    SMALLINT(24) UNSIGNED NOT NULL, -- Rango: 101-2403
    idArea      SMALLINT(1)  UNSIGNED NOT NULL, -- Rango: 1-2
    genero      SMALLINT(1)  UNSIGNED NOT NULL, -- Rango: 1-2
    edad        SMALLINT NOT NULL,
    idEstadoCivil SMALLINT(6) UNSIGNED NOT NULL,    -- Rango: 1-6
    idInstruccion SMALLINT(10) UNSIGNED NOT NULL,   -- Rango: 1 - 2, 4 - 10
    idEtnia     SMALLINT(8) UNSIGNED NOT NULL,      -- Rango: 1 - 8
    salario     DECIMAL,
    idCondicion SMALLINT(8) UNSIGNED NULL,          -- Rango: 1 - 4 TODO
    idSectorizacion SMALLINT(4) UNSIGNED NULL,      -- Rango: 1 - 4
    idOcupacion SMALLINT(10) UNSIGNED NULL,         -- Rango: 1 - 10
    idRamaActividad SMALLINT(21) UNSIGNED NULL,     -- Rango: 1 - 21
    factor      FLOAT NOT NULL,

    FOREIGN KEY (idProvincia)       REFERENCES Provincia(idProvincia),
    FOREIGN KEY (idCanton)          REFERENCES Canton(idCanton),
    FOREIGN KEY (idArea)            REFERENCES Area(idArea),
    FOREIGN KEY (idEstadoCivil)     REFERENCES EstadoCivil(idEstadoCivil),
    FOREIGN KEY (idInstruccion)     REFERENCES Instruccion(idInstruccion),
    FOREIGN KEY (idEtnia)           REFERENCES Etnia(idEtnia),
    FOREIGN KEY (idCondicion)       REFERENCES Condicion(idCondicion),
    FOREIGN KEY (idSectorizacion)   REFERENCES Sectorizacion(idSectorizacion) ,
    FOREIGN KEY (idOcupacion)       REFERENCES Ocupacion(idOcupacion),
    FOREIGN KEY (idRamaActividad)   REFERENCES RamaActividad(idRamaActividad)

);

-- Inserta los datos de Provincia
Insert into Provincia (idProvincia, provincia) VALUES (01,'Azuay');
Insert into Provincia (idProvincia, provincia) VALUES (02,'Bolivar');
Insert into Provincia (idProvincia, provincia) VALUES (03,'Cañar');
Insert into Provincia (idProvincia, provincia) VALUES (04,'Carchi');
Insert into Provincia (idProvincia, provincia) VALUES (05,'Cotopaxi');
Insert into Provincia (idProvincia, provincia) VALUES (06,'Chimborazo');
Insert into Provincia (idProvincia, provincia) VALUES (07,'El Oro');
Insert into Provincia (idProvincia, provincia) VALUES (08,'Esmeraldas');
Insert into Provincia (idProvincia, provincia) VALUES (09,'Guayas');
Insert into Provincia (idProvincia, provincia) VALUES (10,'Imbabura');
Insert into Provincia (idProvincia, provincia) VALUES (11,'Loja');
Insert into Provincia (idProvincia, provincia) VALUES (12,'Los Rios');
Insert into Provincia (idProvincia, provincia) VALUES (13,'Manabi');
Insert into Provincia (idProvincia, provincia) VALUES (14,'Morona Santiago');
Insert into Provincia (idProvincia, provincia) VALUES (15,'Napo');
Insert into Provincia (idProvincia, provincia) VALUES (16,'Pastaza');
Insert into Provincia (idProvincia, provincia) VALUES (17,'Pichincha');
Insert into Provincia (idProvincia, provincia) VALUES (18,'Tungurahua');
Insert into Provincia (idProvincia, provincia) VALUES (19,'Zamora Chinchipe');
Insert into Provincia (idProvincia, provincia) VALUES (20,'Galapagos');
Insert into Provincia (idProvincia, provincia) VALUES (21,'Sucumbios');
Insert into Provincia (idProvincia, provincia) VALUES (22,'Orellana');
Insert into Provincia (idProvincia, provincia) VALUES (23,'Santo Domingo de los Tsachilas');
Insert into Provincia (idProvincia, provincia) VALUES (24,'Santa Elena');

-- Inserta los datos de Area
INSERT INTO Area (idArea, area) VALUES (1, 'Urbana');
INSERT INTO Area (idArea, area) VALUES (2, 'Rural');

-- Inserta los datos de Genero
INSERT INTO Genero (idGenero, genero) VALUES (1, 'Hombre');
INSERT INTO Genero (idGenero, genero) VALUES (2, 'Mujer');

-- Inserta los datos de EstadoCivil
INSERT INTO EstadoCivil (idEstadoCivil, estadoCivil) VALUES (1, 'Casado(a)');
INSERT INTO EstadoCivil (idEstadoCivil, estadoCivil) VALUES (2, 'Separado(a)');
INSERT INTO EstadoCivil (idEstadoCivil, estadoCivil) VALUES (3, 'Divorciado(a)');
INSERT INTO EstadoCivil (idEstadoCivil, estadoCivil) VALUES (4, 'Viudo(a)');
INSERT INTO EstadoCivil (idEstadoCivil, estadoCivil) VALUES (5, 'Union Libre');
INSERT INTO EstadoCivil (idEstadoCivil, estadoCivil) VALUES (6, 'Soltero(a)');

-- Inserta los datos de Instrucción
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (1, 'Ninguno');
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (2, 'Centro de alfabetizacion');
-- No hay nivel 3 en los datos
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (4, 'Primaria');
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (5, 'Educacion Basica');
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (6, 'Secundaria');
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (7, 'Educación  Media');
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (8, 'Superior no universitario');
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (9, 'Superior Universitario');
INSERT INTO Instruccion (idInstruccion, instruccion) VALUES (10, 'Post-grado');

-- Inserta los datos de Etnia
INSERT INTO Etnia (idEtnia, etnia) VALUES (1, 'Indigena');
INSERT INTO Etnia (idEtnia, etnia) VALUES (2, 'Afroecuatoriano');
INSERT INTO Etnia (idEtnia, etnia) VALUES (3, 'Negro');
INSERT INTO Etnia (idEtnia, etnia) VALUES (4, 'Mulato');
INSERT INTO Etnia (idEtnia, etnia) VALUES (5, 'Montubio');
INSERT INTO Etnia (idEtnia, etnia) VALUES (6, 'Mestizo');
INSERT INTO Etnia (idEtnia, etnia) VALUES (7, 'Blanco');
INSERT INTO Etnia (idEtnia, etnia) VALUES (8, 'Otro');

-- Inserta los datos de Condición
INSERT INTO Condicion(idCondicion, condicion) VALUES (1, 'Empleo Adecuado/Pleno');
INSERT INTO Condicion(idCondicion, condicion) VALUES (2, 'Subempleo por insuficiencia de tiempo de trabajo');
INSERT INTO Condicion(idCondicion, condicion) VALUES (3, 'Subempleo por insuficiencia de ingresos');
INSERT INTO Condicion(idCondicion, condicion) VALUES (4, 'Otro empleo no pleno');
INSERT INTO Condicion(idCondicion, condicion) VALUES (5, 'Empleo no remunerado');
INSERT INTO Condicion(idCondicion, condicion) VALUES (6, 'Empleo no clasificado');
INSERT INTO Condicion(idCondicion, condicion) VALUES (7, 'Desempleo abierto');
INSERT INTO Condicion(idCondicion, condicion) VALUES (8, 'Desempleo oculto');

-- Inserta los datos de Sectorización
INSERT INTO Sectorizacion(idSectorizacion, sectorizacion) VALUES (1, 'Sector Formal');
INSERT INTO Sectorizacion(idSectorizacion, sectorizacion) VALUES (2, 'Sector Informal');
INSERT INTO Sectorizacion(idSectorizacion, sectorizacion) VALUES (3, 'Empleo Doméstico');
INSERT INTO Sectorizacion(idSectorizacion, sectorizacion) VALUES (4, 'No Clasificados por Sector');

-- Inserta los datos de Ocupación
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (1, 'Personal direct./admin. pUblica y empresas');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (2, 'Profesionales científicos e intelectuales');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (3, 'Tecnicos y profesionales de nivel medio');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (4, 'Empleados de oficina');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (5, 'Trabajad. de los servicios y comerciantes');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (6, 'Trabajad. calificados agropecuarios y pesqueros');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (7, 'Oficiales operarios y artesanos');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (8, 'Operadores de instalac. máquinas y montad.');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (9, 'Trabajadores no calificados, ocupaciones elementales');
INSERT INTO Ocupacion(idOcupacion, ocupacion) VALUES (10, 'Fuerzas Armadas');

-- Inserta los datos de RamaActividad
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (1, 'A. Agricultura, ganadería caza y silvicultura y pesca');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (2, 'B. Explotación de minas y canteras');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (3, 'C. Industrias manufactureras');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (4, 'D. Suministros de electricidad, gas, aire acondicionado');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (5, 'E. Distribución de agua, alcantarillado');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (6, 'F. Construcción');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (7, 'G. Comercio, reparacion vehículos');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (8, 'H. Transporte y almacenamiento');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (9, 'I. Actividades de alojamiento y servicios de comida');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (10, 'J. Información y comunicación');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (11, 'K. Actividades financieras y de seguros');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (12, 'L. Actividades inmobiliarias');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (13, 'M. Actividades profesionales, científicas y tecnicas');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (14, 'N. Actividades y servicios administrativos y de apoyo');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (15, 'O .Administración pública, defensa y seguridad social');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (16, 'P. Enseñanza');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (17, 'Q. Actividades, servicios sociales y de salud');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (18, 'R. Artes, entretenimiento y recreacion');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (19, 'S. Otras actividades de servicios');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (20, 'T  Actividades en hogares privados con servicio domestico');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (21, 'U  Actividades de organizaciones extraterritoriales');
INSERT INTO RamaActividad(idRamaActividad, ramaActividad) VALUES (22, 'V  No especificado');


-- Cantones

Insert into Canton VALUES (0101,'CUENCA',01);
Insert into Canton VALUES (0102,'GIRON',01);
Insert into Canton VALUES (0103,'GUALACEO',01);
Insert into Canton VALUES (0104,'NABON',01);
Insert into Canton VALUES (0105,'PAUTE',01);
Insert into Canton VALUES (0106,'PUCARA',01);
Insert into Canton VALUES (0107,'SAN FERNANDO',01);
Insert into Canton VALUES (0108,'SANTA ISABEL',01);
Insert into Canton VALUES (0109,'SIGSIG',01);
Insert into Canton VALUES (0110,'OÑA',01);
Insert into Canton VALUES (0111,'CHORDELEG',01);
Insert into Canton VALUES (0112,'EL PAN',01);
Insert into Canton VALUES (0113,'SEVILLA DE ORO',01);
Insert into Canton VALUES (0114,'GUACHAPALA',01);
Insert into Canton VALUES (0115,'CAMILO PONCE ENRIQUEZ',01);
Insert into Canton VALUES (0201,'GUARANDA',02);
Insert into Canton VALUES (0202,'CHILLANES',02);
Insert into Canton VALUES (0203,'CHIMBO',02);
Insert into Canton VALUES (0204,'ECHEANDIA',02);
Insert into Canton VALUES (0205,'SAN MIGUEL',02);
Insert into Canton VALUES (0206,'CALUMA',02);
Insert into Canton VALUES (0207,'LAS NAVES',02);
Insert into Canton VALUES (0301,'AZOGUES',03);
Insert into Canton VALUES (0302,'BIBLIAN',03);
Insert into Canton VALUES (0303,'CAÑAR',03);
Insert into Canton VALUES (0304,'LA TRONCAL',03);
Insert into Canton VALUES (0305,'EL TAMBO',03);
Insert into Canton VALUES (0306,'DELEG',03);
Insert into Canton VALUES (0307,'SUSCAL',03);
Insert into Canton VALUES (0401,'TULCAN',04);
Insert into Canton VALUES (0402,'BOLIVAR',04);
Insert into Canton VALUES (0403,'ESPEJO',04);
Insert into Canton VALUES (0404,'MIRA',04);
Insert into Canton VALUES (0405,'MONTUFAR',04);
Insert into Canton VALUES (0406,'SAN PEDRO DE HUACA',04);
Insert into Canton VALUES (0501,'LATACUNGA',05);
Insert into Canton VALUES (0502,'LA MANA',05);
Insert into Canton VALUES (0503,'PANGUA',05);
Insert into Canton VALUES (0504,'PUJILI',05);
Insert into Canton VALUES (0505,'SALCEDO',05);
Insert into Canton VALUES (0506,'SAQUISILI',05);
Insert into Canton VALUES (0507,'SIGCHOS',05);
Insert into Canton VALUES (0601,'RIOBAMBA',06);
Insert into Canton VALUES (0602,'ALAUSI',06);
Insert into Canton VALUES (0603,'COLTA',06);
Insert into Canton VALUES (0604,'CHAMBO',06);
Insert into Canton VALUES (0605,'CHUNCHI',06);
Insert into Canton VALUES (0606,'GUAMOTE',06);
Insert into Canton VALUES (0607,'GUANO',06);
Insert into Canton VALUES (0608,'PALLATANGA',06);
Insert into Canton VALUES (0609,'PENIPE',06);
Insert into Canton VALUES (0610,'CUMANDA',06);
Insert into Canton VALUES (0701,'MACHALA',07);
Insert into Canton VALUES (0702,'ARENILLAS',07);
Insert into Canton VALUES (0703,'ATAHUALPA',07);
Insert into Canton VALUES (0704,'BALSAS',07);
Insert into Canton VALUES (0705,'CHILLA',07);
Insert into Canton VALUES (0706,'EL GUABO',07);
Insert into Canton VALUES (0707,'HUAQUILLAS',07);
Insert into Canton VALUES (0708,'MARCABELI',07);
Insert into Canton VALUES (0709,'PASAJE',07);
Insert into Canton VALUES (0710,'PIÑAS',07);
Insert into Canton VALUES (0711,'PORTOVELO',07);
Insert into Canton VALUES (0712,'SANTA ROSA',07);
Insert into Canton VALUES (0713,'ZARUMA',07);
Insert into Canton VALUES (0714,'LAS LAJAS',07);
Insert into Canton VALUES (0801,'ESMERALDAS',08);
Insert into Canton VALUES (0802,'ELOY ALFARO',08);
Insert into Canton VALUES (0803,'MUISNE',08);
Insert into Canton VALUES (0804,'QUININDE',08);
Insert into Canton VALUES (0805,'SAN LORENZO',08);
Insert into Canton VALUES (0806,'ATACAMES',08);
Insert into Canton VALUES (0807,'RIO VERDE',08);
Insert into Canton VALUES (0901,'GUAYAQUIL',09);
Insert into Canton VALUES (0902,'ALFREDO BAQUERIZO MORENO',09);
Insert into Canton VALUES (0903,'BALAO',09);
Insert into Canton VALUES (0904,'BALZAR',09);
Insert into Canton VALUES (0905,'COLIMES',09);
Insert into Canton VALUES (0906,'DAULE',09);
Insert into Canton VALUES (0907,'DURAN',09);
Insert into Canton VALUES (0908,'EL EMPALME',09);
Insert into Canton VALUES (0909,'EL TRIUNFO',09);
Insert into Canton VALUES (0910,'MILAGRO',09);
Insert into Canton VALUES (0911,'NARANJAL',09);
Insert into Canton VALUES (0912,'NARANJITO',09);
Insert into Canton VALUES (0913,'PALESTINA',09);
Insert into Canton VALUES (0914,'PEDRO CARBO',09);
Insert into Canton VALUES (0916,'SAMBORONDON',09);
Insert into Canton VALUES (0918,'SANTA LUCIA',09);
Insert into Canton VALUES (0919,'SALITRE',09);
Insert into Canton VALUES (0920,'SAN JACINTO DE YAGUACHI',09);
Insert into Canton VALUES (0921,'PLAYAS (GENERAL VILLAMIL)',09);
Insert into Canton VALUES (0922,'SIMON BOLIVAR',09);
Insert into Canton VALUES (0923,'CORONEL MARCELINO MARIDUEÑA',09);
Insert into Canton VALUES (0924,'LOMAS DE SARGENTILLO',09);
Insert into Canton VALUES (0925,'NOBOL (VICENTE PIEDRAHITA)',09);
Insert into Canton VALUES (0927,'GENERAL ANTONIO ELIZALDE',09);
Insert into Canton VALUES (0928,'ISIDRO AYORA',09);
Insert into Canton VALUES (1001,'IBARRA',10);
Insert into Canton VALUES (1002,'ANTONIO ANTE',10);
Insert into Canton VALUES (1003,'COTACACHI',10);
Insert into Canton VALUES (1004,'OTAVALO',10);
Insert into Canton VALUES (1005,'PIMAMPIRO',10);
Insert into Canton VALUES (1006,'SAN MIGUEL DE URCUQUI',10);
Insert into Canton VALUES (1101,'LOJA',11);
Insert into Canton VALUES (1102,'CALVAS',11);
Insert into Canton VALUES (1103,'CATAMAYO',11);
Insert into Canton VALUES (1104,'CELICA',11);
Insert into Canton VALUES (1105,'CHAHUARPAMBA',11);
Insert into Canton VALUES (1106,'ESPINDOLA',11);
Insert into Canton VALUES (1107,'GONZANAMA',11);
Insert into Canton VALUES (1108,'MACARA',11);
Insert into Canton VALUES (1109,'PALTAS',11);
Insert into Canton VALUES (1110,'PUYANGO',11);
Insert into Canton VALUES (1111,'SARAGURO',11);
Insert into Canton VALUES (1112,'SOZORANGA',11);
Insert into Canton VALUES (1113,'ZAPOTILLO',11);
Insert into Canton VALUES (1114,'PINDAL',11);
Insert into Canton VALUES (1115,'QUILANGA',11);
Insert into Canton VALUES (1116,'OLMEDO',11);
Insert into Canton VALUES (1201,'BABAHOYO',12);
Insert into Canton VALUES (1202,'BABA',12);
Insert into Canton VALUES (1203,'MONTALVO',12);
Insert into Canton VALUES (1204,'PUEBLO VIEJO',12);
Insert into Canton VALUES (1205,'QUEVEDO',12);
Insert into Canton VALUES (1206,'URDANETA',12);
Insert into Canton VALUES (1207,'VENTANAS',12);
Insert into Canton VALUES (1208,'VINCES',12);
Insert into Canton VALUES (1209,'PALENQUE',12);
Insert into Canton VALUES (1210,'BUENA FE',12);
Insert into Canton VALUES (1211,'VALENCIA',12);
Insert into Canton VALUES (1212,'MOCACHE',12);
Insert into Canton VALUES (1213,'QUINSALOMA',12);
Insert into Canton VALUES (1301,'PORTOVIEJO',13);
Insert into Canton VALUES (1302,'BOLIVAR',13);
Insert into Canton VALUES (1303,'CHONE',13);
Insert into Canton VALUES (1304,'EL CARMEN',13);
Insert into Canton VALUES (1305,'FLAVIO ALFARO',13);
Insert into Canton VALUES (1306,'JIPIJAPA',13);
Insert into Canton VALUES (1307,'JUNIN',13);
Insert into Canton VALUES (1308,'MANTA',13);
Insert into Canton VALUES (1309,'MONTECRISTI',13);
Insert into Canton VALUES (1310,'PAJAN',13);
Insert into Canton VALUES (1311,'PICHINCHA',13);
Insert into Canton VALUES (1312,'ROCAFUERTE',13);
Insert into Canton VALUES (1313,'SANTA ANA',13);
Insert into Canton VALUES (1314,'SUCRE',13);
Insert into Canton VALUES (1315,'TOSAGUA',13);
Insert into Canton VALUES (1316,'24 DE MAYO',13);
Insert into Canton VALUES (1317,'PEDERNALES',13);
Insert into Canton VALUES (1318,'OLMEDO',13);
Insert into Canton VALUES (1319,'PUERTO LOPEZ',13);
Insert into Canton VALUES (1320,'JAMA',13);
Insert into Canton VALUES (1321,'JARAMIJO',13);
Insert into Canton VALUES (1322,'SAN VICENTE',13);
Insert into Canton VALUES (1401,'MORONA',14);
Insert into Canton VALUES (1402,'GUALAQUIZA',14);
Insert into Canton VALUES (1403,'LIMON - INDANZA',14);
Insert into Canton VALUES (1404,'PALORA',14);
Insert into Canton VALUES (1405,'SANTIAGO',14);
Insert into Canton VALUES (1406,'SUCUA',14);
Insert into Canton VALUES (1407,'HUAMBOYA',14);
Insert into Canton VALUES (1408,'SAN JUAN BOSCO',14);
Insert into Canton VALUES (1409,'TAISHA',14);
Insert into Canton VALUES (1410,'LOGROÑO',14);
Insert into Canton VALUES (1411,'PABLO SEXTO',14);
Insert into Canton VALUES (1412,'TIWINTZA',14);
Insert into Canton VALUES (1501,'TENA',15);
Insert into Canton VALUES (1503,'ARCHIDONA',15);
Insert into Canton VALUES (1504,'EL CHACO',15);
Insert into Canton VALUES (1507,'QUIJOS',15);
Insert into Canton VALUES (1509,'CARLOS JULIO AROSEMENA T.',15);
Insert into Canton VALUES (1601,'PASTAZA',16);
Insert into Canton VALUES (1602,'MERA',16);
Insert into Canton VALUES (1603,'SANTA CLARA',16);
Insert into Canton VALUES (1604,'ARAJUNO',16);
Insert into Canton VALUES (1701,'QUITO',17);
Insert into Canton VALUES (1702,'CAYAMBE',17);
Insert into Canton VALUES (1703,'MEJIA',17);
Insert into Canton VALUES (1704,'PEDRO MONCAYO',17);
Insert into Canton VALUES (1705,'RUMIÑAHUI',17);
Insert into Canton VALUES (1707,'SAN MIGUEL DE LOS BANCOS',17);
Insert into Canton VALUES (1708,'PEDRO VICENTE MALDONADO',17);
Insert into Canton VALUES (1709,'PUERTO QUITO',17);
Insert into Canton VALUES (1801,'AMBATO',18);
Insert into Canton VALUES (1802,'BAÑOS DE AGUA SANTA',18);
Insert into Canton VALUES (1803,'CEVALLOS',18);
Insert into Canton VALUES (1804,'MOCHA',18);
Insert into Canton VALUES (1805,'PATATE',18);
Insert into Canton VALUES (1806,'QUERO',18);
Insert into Canton VALUES (1807,'SAN PEDRO DE PELILEO',18);
Insert into Canton VALUES (1808,'SANTIAGO DE PILLARO',18);
Insert into Canton VALUES (1809,'TISALEO',18);
Insert into Canton VALUES (1901,'ZAMORA',19);
Insert into Canton VALUES (1902,'CHINCHIPE',19);
Insert into Canton VALUES (1903,'NANGARITZA',19);
Insert into Canton VALUES (1904,'YACUAMBI',19);
Insert into Canton VALUES (1905,'YANTZAZA',19);
Insert into Canton VALUES (1906,'EL PANGUI',19);
Insert into Canton VALUES (1907,'CENTINELA DEL CONDOR',19);
Insert into Canton VALUES (1908,'PALANDA',19);
Insert into Canton VALUES (1909,'PAQUISHA',19);
Insert into Canton VALUES (2001,'SAN CRISTOBAL',20);
Insert into Canton VALUES (2002,'ISABELA',20);
Insert into Canton VALUES (2003,'SANTA CRUZ',20);
Insert into Canton VALUES (2101,'LAGO AGRIO',21);
Insert into Canton VALUES (2102,'GONZALO PIZARRO',21);
Insert into Canton VALUES (2103,'PUTUMAYO',21);
Insert into Canton VALUES (2104,'SHUSHUFINDI',21);
Insert into Canton VALUES (2105,'SUCUMBIOS',21);
Insert into Canton VALUES (2106,'CASCALES',21);
Insert into Canton VALUES (2107,'CUYABENO',21);
Insert into Canton VALUES (2201,'FRANCISCO DE ORELLANA',22);
Insert into Canton VALUES (2202,'AGUARICO',22);
Insert into Canton VALUES (2203,'LA JOYA DE LOS SACHAS',22);
Insert into Canton VALUES (2204,'LORETO',22);
Insert into Canton VALUES (2301,'SANTO DOMINGO',23);
Insert into Canton VALUES (2302,'LA CONCORDIA',23);
Insert into Canton VALUES (2401,'SANTA ELENA',24);
Insert into Canton VALUES (2402,'LA LIBERTAD',24);
Insert into Canton VALUES (2403,'SALINAS',24);

