data emphire(keep=Id Hired Years);
   set prog2.noday;
   Hired=mdy(HiredMonth,15,HiredYear);

   /* The FLOOR function could be used in the following
      assignment statement. */

   Years=int(yrdif(Hired,today(),'act/act'));
   format Hired date9.;
run;

proc print data=emphire;
run;
