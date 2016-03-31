options ls=64 nodate nonumber;
libname ia '.';
data work.allemp;
   set ia.miamiemp
       ia.parisemp
       ia.romeemp;
   by ID;
run;
proc print;
run;