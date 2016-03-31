options ls=64 nodate nonumber;
data fa1;
   length Name $ 6 Gender $ 1 JobCode $ 3;
   input Name $ Gender $ JobCode;
   cards;
KENT F fa1
HELD M fa1
JONES F fa1
run;
data fa2;
   length Name $ 6 JCode $ 3 Gender $ 1; 
   input Name $ JCode $ Gender $;
   cards;
LOPEZ fa2 F
GRANT fa2 F
run;
data newfa;
   set fa1 fa2;
run;
proc print;
run;