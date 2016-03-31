options nodate nonumber ls=64;
libname ia '.';
data ia.dfwlax;
   infile 'dfwlax.dat';
   input Flight $ 1-3 Date $ 4-11 
         Dest $ 12-14 FirstClass 15-17
         Economy 18-20;
run;
proc print data=ia.dfwlax;
run;