PROC IMPORT DATAFILE='W:\TemporaryStorage\PSTAT 130\data1\DallasLA.xls' 
	OUT=WORK.tdfwlax 
	DBMS=XLS REPLACE; 
	SHEET='DFWLAX'; 
	GETNAMES=YES; 
RUN;

Proc Print data=tdfwlax;
run;
