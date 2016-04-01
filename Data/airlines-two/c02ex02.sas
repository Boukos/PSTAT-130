data buyhistory(keep=ID Method);
   length Method $ 13;
   set prog2.ffmethod;
   if Internet eq 'Y' then
      do;
         Method='Internet';
         output;
      end;
   if Telephone eq 'Y' then
      do;
         Method='Telephone';
         output;
      end;
   if TravelAgency eq 'Y' then
      do;
         Method='Travel Agency';
         output;
      end;
run;

proc print data=buyhistory;
   var ID Method;
run;
