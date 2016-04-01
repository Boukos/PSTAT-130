data charity(drop=Qtr);
   set prog2.donate;
   array Contrib{4} Qtr1 Qtr2 Qtr3 Qtr4;
   do Qtr=1 to 4;
      Contrib{Qtr}=Contrib{Qtr}*1.25;
   end;
run;

proc print data=charity noobs;
   title 'Contributions after 25 percent supplement';
run;
