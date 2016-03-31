options nodate nonumber ls=64;
libname ia '.';
data flightrev;
   set ia.dfwlax;
   Total=sum(FirstClass,Economy);
   if upcase(Dest)='DFW' then do;
      Revenue=sum(1500*FirstClass,900*Economy);
      City='Dallas';
   end;
   else if upcase(Dest)='LAX' then do; 
      Revenue=sum(2000*FirstClass,1200*Economy);
      City='Los Angeles';
   end;
run;
proc print data=flightrev;
   var Dest City Flight Date Revenue; 
   format Date date9.;
run;  