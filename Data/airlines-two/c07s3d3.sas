data compare(drop=Qtr);
   set prog2.donate;
   array Contrib{4} Qtr1-Qtr4;
   array Diff{4};
   array Goal{4} _temporary_ (10,15,5,10);
   do Qtr=1 to 4;
      Diff{Qtr}=Contrib{Qtr}-Goal{Qtr};
   end;
run;

proc print data=compare noobs;
   title1 'Comparison of actual employee contributions';
   title2 'versus expected contributions';
   var Id Diff1 Diff2 Diff3 Diff4;
run;