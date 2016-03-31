proc sort data=ia.gersched out=work.gersched;
   by EmpID;
run;
data work.nextweek;
   merge ia.gercrew work.gersched;
   by EmpID;
run;
proc print data=work.nextweek;
run;