data celsius(drop=i);
   set prog2.ski;

   /* You must reset cost to zero every time
      an observation from prog2.ski is read. */

   Cost=0;
   array Temps{24} T1-T24;
   do i=1 to 24;
      Temps{i}=round(5*(Temps{i}-32)/9,.1);
      if Temps{i} lt 2 then
      Cost+125;
   end;
run;

proc print data=celsius;
run;
