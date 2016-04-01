data final;
   set prog2.grade;
   Overall=round(mean(Test1,Test2,Test3,Final,Final));
run;

   /* The assignment statement above
      could be replaced with

      Overall=round(mean(of Test1-Test3,Final,Final)); */

proc print data=final;
run;
