data rotate;
   drop Qtr1 Qtr2 Qtr3 Qtr4;
   set prog2.donate;
   Qtr=1;
   Amount=Qtr1;
   output;
   Qtr=2;
   Amount=Qtr2;
   output;
   Qtr=3;
   Amount=Qtr3;
   output;
   Qtr=4;
   Amount=Qtr4;
   output;
run;

proc print data=rotate;
run;
