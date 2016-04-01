data rotate(drop=Qtr1-Qtr4);
   set prog2.Donate;
   array Contrib{4} Qtr1-Qtr4;
   do Qtr=1 to 4;
      Amount=Contrib{Qtr};
      output;
   end;
run;

proc print data=rotate noobs;
   title 'Data set rotation using SAS array processing';
run;