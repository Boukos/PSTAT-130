libname ia '.';
data ia.allcompare2;
   merge ia.allsales2 ia.allgoals2;
   by Month;
   Difference=Sales-Goal;
run;
