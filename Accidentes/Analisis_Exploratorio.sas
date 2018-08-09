/*Listar variables de la tabla ACCIDENTS_2005_TO_2014 y sus caracterizticas,
ordenandolas  por la posicion que ocupan en la  tabla*/
ODS SELECT POSITION;
TITLE 'Lista de variables en la tabla ACCIDENTS_2005_TO_2014';
PROC DATASETS;
	CONTENTS DATA=ACCIDENT.ACCIDENTS_2005_TO_2014 ORDER=varnum;
QUIT;

/*Elegir las variables que ayuden a resolver el problema*/
DATA ACCIDENT.ACCIDENTS_2005_TO_2014 (KEEP=Longitude Latitude Accident_Severity
	Road_Type Light_Conditions 	Weather_Conditions Road_Surface_Conditions
	Urban_or_Rural_Area Year);
	SET ACCIDENT.ACCIDENTS_2005_TO_2014;
RUN;


/*** Analizar variables categóricas ***/

PROC FREQ DATA=ACCIDENT.ACCIDENTS_2005_TO_2014;
	TABLES Road_Type;
RUN;


PROC SGPLOT DATA=ACCIDENT.ACCIDENTS_2005_TO_2014;
	VBAR Road_Type /;
	YAXIS GRID;
RUN;


