data invest(drop=Quarter Year);
   set prog2.Banks;
   Capital=0;
   do Year=1 to 5;
      Capital+5000;
      do Quarter=1 to 4;
         Capital+(Capital*(Rate/4));
      end;
   end;
run;

proc print data=invest noobs;
   title1 'Results of investing 5000 dollars for';
   title2 'five years in three different banks that compound quarterly.';
run;
