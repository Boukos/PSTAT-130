data forecast;
   set prog2.growth(rename=(NumEmps=NewTotal));
   do Year=1 to 3;
      NewTotal=NewTotal*(1+Increase);
      output;
   end;
run;

proc print data=forecast noobs;
run;
