options nodate nonumber ls=64;
libname ia '.';
data onboard(drop=FirstClass Economy);
   set ia.dfwlax;
   Total=FirstClass+Economy;
run;
proc print data=onboard;
   format Date date9.;
run;

data onboard;
   drop FirstClass Economy;
   set ia.dfwlax;
   Total=FirstClass+Economy;
run;
proc print data=onboard;
   format Date date9.;
run;