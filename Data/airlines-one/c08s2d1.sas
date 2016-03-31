
data ia.compare;
   merge ia.performance ia.goals;
   by Month;
   Difference=Sales-Goal;
run;

proc print data=ia.compare;
   title 'Sales Performance';
run;
