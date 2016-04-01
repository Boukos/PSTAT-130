data bonuses;
   set prog2.salary2;
   Bonus=.10*GrossPay;
run;

proc print data=bonuses noobs;
   title 'Results from automatic conversion';
run;

data bonuses;
   set prog2.salary2;
   Bonus=.10*input(GrossPay,comma6.);
run;

proc print data=bonuses noobs;
   title 'Results from conversion using the INPUT function';
run;

data bonuses(drop=CharGross);
   set prog2.salary2(rename=(GrossPay=CharGross));
   GrossPay=input(CharGross,comma6.);
   Bonus=.10*GrossPay;
run;

proc contents data=bonuses;
   title1 'Descriptor portion of BONUSES';
   title2 'GROSSPAY variable is numeric';
run;

proc print data=bonuses noobs;
   title1 'Data portion of BONUSES';
   title2 'GROSSPAY variable is numeric';
run;
