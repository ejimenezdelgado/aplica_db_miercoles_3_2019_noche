DROP TABLE IF EXISTS profesor;
CREATE TABLE profesor(
    id_profesor INT IDENTITY NOT NULL,
    apellido_profesor varchar(50) DEFAULT NULL,
    nombre_profesor varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_profesor)
);

DROP TABLE IF EXISTS tema;
CREATE TABLE tema(
    id_tema INT IDENTITY NOT NULL,
    tema varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_tema)
);

DROP TABLE IF EXISTS curso;
CREATE TABLE curso(
    id_curso INT IDENTITY NOT NULL,
    id_profesor int DEFAULT NULL,
    materia varchar(50) DEFAULT NULL,
    ano int DEFAULT NULL,
    division varchar(1) DEFAULT NULL,
    carrera varchar(10) DEFAULT NULL,
    horas_semanales int DEFAULT NULL,
    PRIMARY KEY(id_curso),
    CONSTRAINT FK_curso_profesor FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor)
);

DROP TABLE IF EXISTS practicas;
CREATE TABLE practicas(
    id_practica INT IDENTITY NOT NULL,
    id_tema int DEFAULT NULL,
    descripcion text,
    nombre varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_practica),
    CONSTRAINT FK_practicas_tema FOREIGN KEY(id_tema) REFERENCES tema(id_tema)
);

DROP TABLE IF EXISTS curso_practica;
CREATE TABLE curso_practica(
    id_curso int NOT NULL,
    id_practica int NOT NULL,
    horas int DEFAULT NULL,
    fecha datetime NOT NULL,
    ayudante int DEFAULT NULL,
    grupos int DEFAULT NULL,
    caracter varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_curso, id_practica, fecha),
    CONSTRAINT FK_cursopractica_practicas FOREIGN KEY(id_practica) REFERENCES practicas(id_practica),
    CONSTRAINT FK_cursopractica_curso FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);


/***************************************/
SET IDENTITY_INSERT profesor ON;

INSERT INTO profesor(id_profesor, apellido_profesor, nombre_profesor) VALUES(1, 'Naddeo', 'Juan Manuel'), (2, 'Denami', 'Diego'), (3, 'Vazquez Gil', 'Javier'), (4, 'Fett', 'Jango'), (5, 'Pasina', 'Laura'), (6, 'Rossi', 'Fernando');

SET IDENTITY_INSERT profesor OFF;


SET IDENTITY_INSERT tema ON;

/***************************************/
INSERT INTO tema(id_tema, tema) VALUES(1, 'Mec�nica - Cinem�tica'), (2, 'Mec�nica - Din�mica'), (3, 'Mec�nica - Flu�dos'), (4, 'Mec�nica - Energ�a'), (5, 'Calorimetr�a'), (6, '�ptica'), (7, 'Qu�mica Org�nica'), (8, 'Qu�mica Inorg�nica'), (9, 'Biolog�a'), (10, 'Clase en el laboratorio'), (11, 'Electricidad'), (12, 'Electricidad y Magnetismo');

SET IDENTITY_INSERT tema OFF;


/***************************************/
SET IDENTITY_INSERT curso ON;
INSERT INTO curso(id_curso, id_profesor, materia, Ano, division, carrera, horas_semanales) VALUES(1, 1, 'F�sico-Qu�mica', 5, 'A', 'Com Social', 5), (2, 1, 'F�sico-Qu�mica', 5, 'B', 'Com Social', 5), (3, 1, 'F�sico-Qu�mica', 5, 'A', 'Info', 5), (4, 1, 'F�sico-Qu�mica', 5, 'B', 'Info', 5), (5, 4, 'F�sico-Qu�mica', 4, 'A', 'Com Social', 5), (6, 1, 'F�sico-Qu�mica', 4, 'B', 'Com Social', 5), (7, 2, 'F�sico-Qu�mica', 3, 'A', 'Com Social', 3), (8, 2, 'F�sico-Qu�mica', 3, 'B', 'Com Social', 3), (9, 2, 'F�sico-Qu�mica', 3, 'A', 'Info', 3), (10, 2, 'F�sico-Qu�mica', 3, 'B', 'Info', 3), (11, 2, 'F�sica', 3, 'A', 'Tecnica', 4), (12, 2, 'F�sica', 3, 'B', 'T�cnica', 4), (13, 2, 'F�sica', 3, 'C', 'T�cnica', 4), (14, 3, 'Qu�mica', 3, 'A', 'T�cnica', 3), (15, 3, 'Qu�mica', 3, 'B', 'T�cnica', 3), (16, 3, 'Qu�mica', 3, 'C', 'T�cnica', 3), (17, 3, 'F�sica', 2, 'A', 'T�cnica', 4), (18, 3, 'F�sica', 2, 'B', 'T�cnica', 4), (19, 3, 'F�sica', 2, 'C', 'T�cnica', 4), (20, 1, 'F�sico-Qu�mica', 4, 'A', 'Info', 5), (21, 1, 'F�sico-Qu�mica', 4, 'B', 'Info', 5), (22, 5, 'Biolog�a', 5, 'A', 'Com Social', 3), (23, 5, 'Biolog�a', 5, 'B', 'Com Social', 3), (24, 5, 'Biolog�a', 5, 'A', 'Info', 3), (25, 5, 'Biolog�a', 5, 'B', 'Info', 3), (26, 5, 'Biolog�a', 4, 'A', 'Com Social', 3), (27, 5, 'Biolog�a', 4, 'B', 'Com Social', 3), (28, 5, 'Biolog�a', 4, 'A', 'Info', 3), (29, 5, 'Biolog�a', 4, 'B', 'Info', 3), (30, 5, 'Biolog�a', 3, 'A', 'Com Social', 3), (31, 5, 'Biolog�a', 3, 'B', 'Com Social', 3), (32, 6, 'Biolog�a', 3, 'A', 'Info', 3), (33, 6, 'Biolog�a', 3, 'B', 'Info', 3), (37, 6, 'Biolog�a', 2, 'A', 'Com Social', 3), (38, 6, 'Biolog�a', 2, 'B', 'Com Social', 3), (39, 6, 'Biolog�a', 2, 'A', 'Info', 3), (40, 6, 'Biolog�a', 2, 'B', 'Info', 3), (41, 6, 'Biolog�a', 2, 'A', 'T�cnica', 3), (42, 6, 'Biolog�a', 2, 'B', 'T�cnica', 3), (43, 6, 'Biolog�a', 2, 'C', 'T�cnica', 3), (44, 6, 'Biolog�a', 1, 'A', 'Com Social', 3), (45, 6, 'Biolog�a', 1, 'B', 'Com Social', 3), (46, 6, 'Biolog�a', 1, 'A', 'Info', 3), (47, 6, 'Biolog�a', 1, 'B', 'Info', 3), (48, 6, 'Biolog�a', 1, 'A', 'T�cnica', 2), (49, 6, 'Biolog�a', 1, 'B', 'T�cnica', 2), (50, 6, 'Biolog�a', 1, 'C', 'T�cnica', 2);
SET IDENTITY_INSERT curso OFF;
/***************************************/

SET IDENTITY_INSERT practicas ON;
INSERT INTO practicas(id_practica, id_tema, descripcion, nombre) VALUES(1, 2, 'Determinar el peso de un objeto utilizando resortes, pesas y materiales de medida', 'Ley de Hooke - Peso de un objeto'), (2, 12, 'Pr�ctico constituido por 3 partes. Electr�foro, motor monopolar, e inducci�n electromagn�tica con bobina e imanes.', 'Inducci�n electromagn�tica y electroest�tica'), (3, 2, 'Determinaci�n del coeficiente de rozamiento est�tico y din�mico entre taco de madera y superficie lisa.', 'Determinaci�n del coeficiente de rozamiento'), (4, 1, 'Proyecci�n de simulaci�n y ejercicio interactivo', 'Tiro Oblicuo con simulador'), (6, 7, 'Comportamiento de sustancias org�nicas usuales. Sacarosa, benzeno, naftaleno. Solubilidad', 'Sistemas Materiales Org�nicos'), (7, 2, 'Exposici�n de los grupos ganadores de la expop�o al resto del curso', 'Poleas y Energ�as no convencionales'), (8, 6, 'Armado de un banco �ptico. Ley de Descartes de las lentes. Demostraciones de reflexi�n y refracci�n con un laser y agua.', 'Fen�menos �pticos kitasato + banco �ptico'), (9, 8, 'Formaci�n de compuestos y utilizaci�n de indicadores para determinar su naturaleza. �xidos de azufre y magnesio. Bases asociadas. �cidos n�trico y clorh�drico + metales. Fenoftale�na y Heliantina', '�xidos, �cidos, bases, sales, e indicadores'), (10, 1, 'Demostraci�n de la ca�da de objetos en el vac�o', 'Tubo de Newton y Bomba de vac�o'), (11, 7, 'Experiencia para la expop�o. Formaci�n del ester de banana', 'Formaci�n de Esteres'), (12, 3, 'Experimento cnn el vaso lleno de agua, y una tapa de papel que aguanta el agua por efecto de la presi�n atmosf�rica.', 'Presi�n Atmosf�rica'), (13, 3, 'Dos latas, se sopla en el medio y se observan los efectos. Secador de pelo con pelota de ping pong.', 'Bernoully Cualitativo'), (14, 1, 'Usando un dispositivo que dispara al mismo tiempo un m�vil horizontalmente, y otro en ca�da libre, se puede comprobar que ambos tocan simultaneamente el suelo', 'Tiro Oblicuo - Independencia de movimientos'), (15, 6, 'Caja de rayos, disco de hartl con prismas, pecera con agua para refractar la luz, espejos cil�ndricos, lasers, y lentes.', '�ptica Geom�trica'), (16, 9, 'identificaci�n de CH y gl�cidos. Utilizaci�n de reactivo de Fehling y Lugol.', 'Carbohidratos y gl�cidos'), (17, 3, 'Pesas, vaso de precipitado, din�mometro, y la comprobaci�n del peso equivalente y el empuje.', 'Hidroest�tica - Arqu�medes'), (18, 6, 'Espejos planos y soportes para comprobar la ley reflejando la imagen de alfileres clavados en telgopor', 'Ley de reflexi�n en espejos planos'), (19, 5, 'Pasar vapor de agua por adentro de unas varillas de aluminio, las cuales al dilatarse hacen deflectar un determinado �ngulo medible a un clavo sobre el que se apoyan.', 'Dilataci�n lineal'), (20, 5, 'Calcular la constante del calor�metro', 'Calor�metro de las mezclas'), (21, 4, 'Botella agujereada y comparaci�n de las velocidades del agua con las alturas de los agujeros', 'Energ�a mec�nica mediante fluidos'), (22, 3, 'Ejercicios en clase.', 'Ejercicios en papel'), (24, 1, 'Encuentro entre una burbuja y una bolita de vidrio en un tubo con fluido espeso.', 'Tubo MRU'), (25, 9, 'Estudio del sistema circulatorio a trav�s del an�lisis de un coraz�n de vaca.', 'Sistema circulatorio'), (26, 8, 'Utilizando diferentes solventes, como alcohol et�lico o agua, se separan diferentes tinturas sobre un papel de filtro para ver como mediante el arrastre de la pintura sobre el papel se pueden separar diferentes componentes(colores) de la tintura analizada.', 'Cromatolog�a'), (27, 8, 'Separaci�n de sistemas homogeneos mediante el proceso de destilaci�n simple, y utilizando una columna de destilaci�n.', 'Destilaci�n'), (29, 8, 'Demostraci�n de dos experiencias. La reacci�n aluminio + yodo, utilizando una gota de agua a modo de catalizador y la fuente de amoniaco, que consiste en llenar un erlenmeyer de este gas, y aprovechando la baja presi�n en el frasco, hacer subir agua con fenolftaleina por un tubito de vidrio. Al entrar al frasco la reacci�n genera un medio b�sico que pinta la fenolftale�na del agua la cual entra r�pidamente por la dif de presi�n', 'Reacciones Qu�micas - Introducci�n'), (30, 5, 'Utilizando un dilat�metro de aguja y un bimetal, se le muestra r�pidamente y a modo cualitativo la forma en la que los s�lidos se dilatan al aumentar su temperatura, y los efectos directos que esto puede tener.', 'Dilataci�n lineal + bimetal demo'), (31, 1, 'Utilizando una rampa de madera se deben medir los tiempos de ca�da por la misma de dos bolitas de masas y materiales diferentes. Se debe hacer un tratamiento de las mediciones y de los errores, y confeccionar un informe', 'Ca�da de los cuerpos - rampa'), (32, 10, 'La idea es analizar un caso pr�ctico, con una vela, una lata y agua, y plantear hip�tesis acerca del comportamiento del agua, del fuego, y otros.', 'M�todo cient�fico - hip�tesis'), (33, 8, 'Clasificaci�n de sistemas, fases, soluciones, y m�todos de separaci�n sobre estos sistemas(secado, filtrado, decantaci�n, separaci�n magn�tica)', 'Sistemas Materiales'), (34, 8, 'Reacci�n con ioduro de potasio y agua oxigenada de 100 vol, la cual se deshace r�pidamente del ox�geno llenando de burbujas el detergente. Adem�s, la cl�sica explosi�n con la cocola y las mentos.', 'Pasta de dientes de elefante'), (35, 10, 'Demostraci�n de los elementos del laboratorio, y realizaci�n de un trabajo pr�ctico donde se debe resolver una situaci�n hipot�tica con dichos elementos.', 'Elementos de laboratorio');
SET IDENTITY_INSERT practicas OFF;
/***************************************/
INSERT INTO curso_practica(id_curso, id_practica, horas, fecha, ayudante, grupos, caracter) VALUES(1, 2, 2, '2011-11-10 00:00:00', 1, 0, 'Demostrativa'), (1, 8, 2, '2011-11-04 00:00:00', 1, 0, 'Demostrativa'), (1, 8, 2, '2011-11-09 00:00:00', 1, 0, 'Demostrativa'), (1, 11, 2, '2011-10-12 00:00:00', 1, 0, 'Demostrativa'), (1, 12, 2, '2011-08-12 00:00:00', 0, 0, 'Demostrativa'), (1, 13, 1, '2011-09-14 00:00:00', 1, 0, 'Demostrativa'), (1, 17, 2, '2011-09-02 00:00:00', 1, 1, 'Participativa'), (1, 17, 2, '2011-09-09 00:00:00', 1, 0, 'Demostrativa'), (1, 29, 2, '2012-04-28 00:00:00', 1, 0, 'Demostrativa'), (2, 2, 2, '2011-11-10 00:00:00', 1, 0, 'Demostrativa'), (2, 11, 2, '2011-09-29 00:00:00', 1, 0, 'Demostrativa'), (2, 11, 2, '2011-10-14 00:00:00', 1, 0, 'Demostrativa'), (2, 12, 2, '2011-08-30 00:00:00', 0, 0, 'Demostrativa'), (2, 13, 2, '2011-09-15 00:00:00', 1, 0, 'Demostrativa'), (2, 21, 1, '2011-11-03 00:00:00', 1, 0, 'Demostrativa'), (2, 22, 2, '2011-09-13 00:00:00', 0, 0, 'Demostrativa'), (2, 29, 2, '2012-04-28 00:00:00', 1, 0, 'Demostrativa'), (3, 2, 2, '2011-11-11 00:00:00', 1, 0, 'Demostrativa'), (3, 8, 2, '2011-11-09 00:00:00', 1, 0, 'Demostrativa'), (3, 11, 2, '2011-10-13 00:00:00', 1, 0, 'Demostrativa'), (3, 12, 2, '2011-08-10 00:00:00', 1, 0, 'Demostrativa'), (3, 17, 1, '2011-09-02 00:00:00', 1, 1, 'Participativa'), (3, 17, 1, '2011-09-07 00:00:00', 1, 1, 'Participativa'), (3, 17, 2, '2011-09-09 00:00:00', 1, 0, 'Demostrativa'), (3, 29, 2, '2012-04-28 00:00:00', 1, 0, 'Demostrativa'), (4, 2, 2, '2011-11-09 00:00:00', 1, 0, 'Demostrativa'), (4, 8, 2, '2011-11-08 00:00:00', 0, 0, 'Demostrativa'), (4, 11, 2, '2011-10-12 00:00:00', 1, 0, 'Demostrativa'), (4, 12, 2, '2011-08-10 00:00:00', 1, 0, 'Demostrativa'), (4, 13, 1, '2011-09-14 00:00:00', 1, 0, 'Demostrativa'), (4, 13, 1, '2011-09-15 00:00:00', 1, 0, 'Demostrativa'), (4, 17, 2, '2011-09-07 00:00:00', 1, 0, 'Demostrativa'), (4, 22, 1, '2011-09-14 00:00:00', 0, 0, 'Demostrativa'), (4, 29, 2, '2012-04-28 00:00:00', 1, 0, 'Demostrativa'), (5, 3, 1, '2011-09-30 00:00:00', 1, 1, 'Participativa'), (5, 3, 1, '2011-10-05 00:00:00', 1, 1, 'Participativa'), (5, 3, 1, '2011-10-19 00:00:00', 1, 2, 'Participativa'), (5, 3, 2, '2011-11-04 00:00:00', 1, 4, 'Participativa'), (5, 4, 2, '2011-09-30 00:00:00', 1, 0, 'Demostrativa'), (6, 1, 2, '2011-10-14 00:00:00', 1, 7, 'Participativa'), (6, 4, 2, '2011-09-30 00:00:00', 1, 0, 'Demostrativa'), (6, 10, 2, '2011-08-11 00:00:00', 0, 0, 'Demostrativa'), (6, 10, 2, '2011-08-12 00:00:00', 1, 0, 'Demostrativa'), (6, 14, 2, '2011-09-28 00:00:00', 0, 4, 'Participativa'), (6, 31, 2, '2012-04-28 00:00:00', 0, 8, 'Participativa'), (7, 19, 2, '2011-07-14 00:00:00', 0, 6, 'Demostrativa'), (8, 19, 2, '2011-07-14 00:00:00', 0, 6, 'Participativa'), (9, 19, 2, '2011-07-06 00:00:00', 0, 6, 'Participativa'), (10, 19, 2, '2011-07-15 00:00:00', 1, 6, 'Participativa'), (11, 15, 2, '2011-09-20 00:00:00', 0, 0, 'Demostrativa'), (11, 18, 2, '2011-09-02 00:00:00', 1, 4, 'Participativa'), (11, 20, 2, '2011-07-12 00:00:00', 0, 4, 'Participativa'), (12, 15, 2, '2011-09-20 00:00:00', 0, 0, 'Demostrativa'), (12, 18, 2, '2011-09-01 00:00:00', 0, 4, 'Participativa'), (12, 20, 2, '2011-07-05 00:00:00', 0, 4, 'Participativa'), (13, 15, 2, '2011-09-20 00:00:00', 0, 0, 'Demostrativa'), (13, 18, 2, '2011-09-01 00:00:00', 0, 4, 'Participativa'), (13, 20, 2, '2011-07-05 00:00:00', 0, 4, 'Participativa'), (14, 6, 2, '2011-11-23 00:00:00', 1, 6, 'Participativa'), (14, 9, 2, '2011-08-24 00:00:00', 1, 6, 'Participativa'), (14, 26, 1, '2012-05-23 00:00:00', 1, 0, 'Demostrativa'), (15, 6, 2, '2011-11-23 00:00:00', 1, 6, 'Participativa'), (15, 9, 2, '2011-08-24 00:00:00', 1, 6, 'Participativa'), (15, 26, 1, '2012-05-24 00:00:00', 1, 0, 'Demostrativa'), (16, 6, 2, '2011-11-23 00:00:00', 1, 6, 'Participativa'), (16, 9, 2, '2011-08-24 00:00:00', 1, 6, 'Participativa'), (16, 26, 1, '2012-05-29 00:00:00', 1, 0, 'Demostrativa'), (17, 7, 2, '2011-12-01 00:00:00', 1, 0, 'Demostrativa'), (17, 10, 1, '2011-08-18 00:00:00', 1, 0, 'Demostrativa'), (18, 7, 2, '2011-12-01 00:00:00', 1, 0, 'Demostrativa'), (18, 10, 1, '2011-08-18 00:00:00', 1, 0, 'Demostrativa'), (19, 7, 2, '2011-12-01 00:00:00', 1, 0, 'Demostrativa'), (19, 10, 1, '2011-08-18 00:00:00', 1, 0, 'Demostrativa'), (20, 10, 2, '2011-08-25 00:00:00', 0, 0, 'Demostrativa'), (20, 14, 2, '2011-09-26 00:00:00', 0, 4, 'Participativa'), (20, 24, 2, '2011-09-29 00:00:00', 0, 1, 'Participativa'), (20, 31, 2, '2012-04-28 00:00:00', 1, 8, 'Participativa'), (21, 10, 2, '2011-08-29 00:00:00', 0, 0, 'Demostrativa'), (21, 10, 2, '2011-08-30 00:00:00', 1, 0, 'Demostrativa'), (21, 14, 2, '2011-09-26 00:00:00', 0, 4, 'Participativa'), (21, 31, 2, '2012-04-28 00:00:00', 0, 8, 'Participativa'), (30, 16, 2, '2011-10-03 00:00:00', 0, 7, 'Participativa'), (30, 16, 1, '2011-10-04 00:00:00', 0, 7, 'Participativa'), (30, 25, 2, '2011-11-21 00:00:00', 0, 6, 'Participativa'), (31, 16, 2, '2011-10-07 00:00:00', 1, 7, 'Participativa'), (31, 16, 1, '2011-10-08 00:00:00', 1, 7, 'Participativa'), (31, 25, 2, '2011-11-25 00:00:00', 1, 6, 'Participativa');

/***************************************/