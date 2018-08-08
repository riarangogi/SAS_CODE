/*Listar variables de la tabla ACCIDENTS_2005_TO_2014 y sus caracterizticas,
ordenandolas  por la posicion que ocupan en la  tabla*/
ODS SELECT POSITION;

PROC DATASETS;
	CONTENTS DATA=ACCIDENT.ACCIDENTS_2005_TO_2014 ORDER=varnum;
QUIT;