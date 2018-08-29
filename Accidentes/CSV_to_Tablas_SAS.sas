/*Codigo para convertir los archivos csv en tablas  SAS. Dichas tablas se  guardan en
la libreria ACCIDENT*/

FILENAME REFFILE '/folders/myfolders/Accidentes/accidents_2005_to_2007.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=ACCIDENT.accidents_2005_to_2007;
	GETNAMES=YES;
RUN;

FILENAME REFFILE '/folders/myfolders/Accidentes/accidents_2009_to_2011.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=ACCIDENT.accidents_2009_to_2011;
	GETNAMES=YES;
RUN;

FILENAME REFFILE '/folders/myfolders/Accidentes/accidents_2012_to_2014.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=ACCIDENT.accidents_2012_to_2014;
	GETNAMES=YES;
RUN;

/*Agrupar las 3 tablas,una sobree otra, y se crea una sola tabla*/
DATA ACCIDENT.accidents_2005_to_2014;
	SET ACCIDENT.accidents_2005_to_2007 
		ACCIDENT.accidents_2009_to_2011 
		ACCIDENT.accidents_2012_to_2014;
RUN;

/*Eliminar los registros duplicados*/
PROC SORT DATA=ACCIDENT.accidents_2005_to_2014 NODUP OUT=ACCIDENT.accidents_2005_to_2014;
BY Year;
RUN;