data bonuses;
   set prog2.salary1;
   Bonus=.10*GrossPay;
run;

proc print data=bonuses noobs;
   title 'Results from automatic conversion';
run;
