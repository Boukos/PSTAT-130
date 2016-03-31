options nodate nonumber ls=64;
libname ia '.';
data onboard;
   set ia.dfwlax;
   Total=sum(FirstClass,Economy);
run;
proc print data=onboard;
   format Date date9.;
run;

