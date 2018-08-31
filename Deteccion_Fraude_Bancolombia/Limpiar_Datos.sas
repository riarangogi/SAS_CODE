/*Importar datos*/

FILENAME REFFILE '/folders/myfolders/Deteccion_Fraude_Bancolombia/train.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=FRAU_BCO.IMPORT;
	GETNAMES=YES;
RUN;

/*Borrar rgistros duplicados*/
PROC SORT DATA=FRAU_BCO.import NODUP OUT=FRAU_BCO.IMPORT;
BY id; 
RUN;