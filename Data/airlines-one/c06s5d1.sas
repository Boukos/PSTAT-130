options nodate nonumber ls=64;
libname ia '.';
proc contents data=ia.dfwlax;
run;
proc datasets library=ia;
   modify dfwlax;
   rename Dest=Destination;
run;
proc contents data=ia.dfwlax;
run;