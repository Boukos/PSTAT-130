data prairie;
   set prog2.people;

   /* Second argument to INDEX function must include
      a leading blank to avoid extraneous results. */

   if index(CityState,' IL') > 0;
run;

proc print data=Prairie;
run;
