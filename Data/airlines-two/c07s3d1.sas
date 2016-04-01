data percent(drop=Qtr);
   set prog2.donate;
   Total=sum(of Qtr1-Qtr4);
   array Contrib{4} Qtr1-Qtr4;
   array Percent{4};
   do Qtr=1 to 4;
      Percent{Qtr}=Contrib{Qtr}/Total;
   end;
run;

proc print data=percent noobs;
   title1 "Percentage that each quarter's contribution";
   title2 'represents of the total annual contribution';
   var Id Percent1-Percent4;
   format Percent1-Percent4 percent6.;
run;
