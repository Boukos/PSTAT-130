PROC IMPORT OUT= WORK.DFWLAX 
            DATAFILE= "C:\PROG1\DallasLA.txt" 
            DBMS=TAB REPLACE;
     GETNAMES=YES;
RUN;
