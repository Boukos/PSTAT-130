options linesize=72 nodate nonumber;	


PROC IMPORT DATAFILE='E:\SAS homework station\sfosch.xls'
OUT=work.sfoexcel
DBMS=XLS REPLACE;
SHEET='SFODATA';
GETNAMES=YES;
RUN;

Proc print data = work.sfoexcel;
run;

proc contents data = work.sfoexcel;
run;
