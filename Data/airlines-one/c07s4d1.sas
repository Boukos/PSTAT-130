proc import out=work.dfwlaxdates 
            datafile='datefields.xls' 
            dbms=excel2000;
   getnames=yes;
run;
options ls=64 nodate nonumber;
proc print data=work.dfwlaxdates;
run;