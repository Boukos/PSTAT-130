   /* a. */

data future;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   Year=year(today());
   do until(Year=year(today())+10);
      Year+1;

   /* If a DO UNTIL statement is used, you
      must remember to increment the value of
      Year. */

      Wages+(Wages*.06);
      Retire+(Retire*.014);
      Medical+(Medical*.095);
      output;
   end;
run;

proc print data=future;
   var Year Wages Retire Medical;
run;

   /* Alternative solution: */

data future;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   do Year=year(today())+1 to year(today())+10;
      Wages+Wages*.06;
      Retire+Retire*.014;
      Medical+Medical*.095;
      output;
   end;
run;

proc print data=future;
   var Year Wages Retire Medical;
run;

   /* b. */

data future;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   Year=year(today());
   do until(Year=year(today())+10);
      Year+1;

   /* If a DO UNTIL statement is used, you
      must remember to increment the value of
      Year. */

      Wages+(Wages*.06);
      Retire+(Retire*.014);
      Medical+(Medical*.095);
      TotCost=sum(Wages,Retire,Medical);
      output;
   end;
run;

proc print data=future;
   var Year Wages Retire Medical TotCost;
run;

   /* Alternative solution: */

data future;
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   do Year=year(today())+1 to year(today())+10;
      Wages+Wages*.06;
      Retire+Retire*.014;
      Medical+Medical*.095;
      TotCost=sum(Wages,Retire,Medical);
      output;
   end;
run;

proc print data=future;
   var Year Wages Retire Medical TotCost;
run;

   /* c. */

data future;
   Year=year(today());
   Wages=12874000;
   Retire=1765000;
   Medical=649000;
   Income=50000000;
   do until(TotCost gt Income);
      Wages+(Wages*.06);
      Retire+(Retire*.014);
      Medical+(Medical*.095);
      TotCost=sum(Wages,Retire,Medical);
      Income+(Income*.01);
      Year+1;
      output;
   end;
run;

proc print data=future;
   var Year Income TotCost;
run;
