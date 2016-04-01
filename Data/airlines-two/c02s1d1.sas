data forecast;
   drop NumEmps;
   set prog2.growth;
   Year=1;
   NewTotal=NumEmps*(1+Increase);
   output;
   Year=2;
   NewTotal=NewTotal*(1+Increase);
   output;
   Year=3;
   NewTotal=NewTotal*(1+Increase);
   output;
run;

proc print data=forecast noobs;
   title 'Explicit output using the OUTPUT statement';
   format NewTotal 6.;
run;
