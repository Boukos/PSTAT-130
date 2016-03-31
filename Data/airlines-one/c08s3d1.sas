libname ia '.';
data ia.allcompare;
   merge ia.allsales ia.allgoals;
   by Month;
   Difference=Sales-Goal;
run;
