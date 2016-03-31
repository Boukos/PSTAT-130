options nodate nonumber ls=64;
proc print data=work.dfwlax;
   format Date date9.;
run;