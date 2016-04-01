data final(drop=OverallTotal);
   set prog2.grade;
   OverallTotal=sum(Test1,Test2,Test3,Final,Final)-
      min(Test1,Test2,Test3);
   Overall=round(OverallTotal/4);
run;

   /* The first assignment statement above
      could be replaced with

      OverallTotal=sum(of Test1-Test3,Final,Final)-
                   min(of Test1-Test3); */

proc print data=final;
run;
