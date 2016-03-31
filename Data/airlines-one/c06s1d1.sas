options nodate nonumber ls=64;
data work.dfwlax;
   infile 'dfwlax.dat';
   input Flight $ 1-3 Date $ 4-11 
         Dest $ 12-14 FirstClass 15-17
         Economy 18-20;
run;
proc print data=work.dfwlax;
run;