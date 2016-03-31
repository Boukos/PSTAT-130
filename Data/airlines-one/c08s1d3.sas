options ls=64 nodate nonumber;
data newfa;
   set fa1 fa2(rename=(JCode=JobCode));
run;
proc print;
run;