data change(drop=i);
   set prog2.donate;
   array Contrib{4} Qtr1-Qtr4;
   array Diff{3};
   do i=1 to 3;
      Diff{i}=Contrib{i+1}-Contrib{i};
   end;
run;

proc print data=change noobs;
   var ID Diff1-Diff3;
run;
