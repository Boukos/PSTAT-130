data bonuses;
   set prog2.salary2;
   Bonus=.10*input(GrossPay,comma6.);
run;

proc print data=bonuses noobs;
   title 'Results from conversion using the INPUT function';
run;
