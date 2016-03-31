proc sort data=ia.gersched out=work.gersched;
   by EmpID;
run;
data work.nextweek;
   merge ia.gercrew 
         work.gersched(in=InSched);
   by EmpID;
   if InSched=1;
run;
proc print data=work.nextweek;
run;