proc print data=prog2.test noobs;
run;

proc contents data=prog2.test;
run;

data fnlgrades;
   length Grade $ 6;
   drop Score;
   set prog2.test;
   if Score>=.7 then Grade='Pass';
   else grade='Failed';
run;

proc print data=fnlgrades noobs;
   var LName Grade;
   title 'List Report of FNLGRADES';
run;