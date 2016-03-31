options ls=64 nodate nonumber;
data na1;
   length Name $ 6 Gender $ 1 JobCode $ 3;
   input Name $ Gender $ JobCode;
   cards;
TORRES M NA1
LANG F NA1
SMITH F NA1
run;
data na2;
   length Name $ 6 Gender $ 1 JobCode $ 3;
   input Name $ Gender $ JobCode;
   cards;
LISTER M NA2
TORRES F NA2
run;
data newhires;
   set na1 na2;
run;
proc print;
run;