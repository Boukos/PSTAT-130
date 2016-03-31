options nodate nonumber ls=64;
libname ia '.';
data flightrev;
   set ia.dfwlax;
   Total=sum(FirstClass,Economy);
   if Dest='LAX' then 
      Revenue=sum(2000*FirstClass,1200*Economy); 
   else if Dest='DFW' then 
      Revenue=sum(1500*FirstClass,900*Economy);
run;
proc print data=flightrev;
   format Date date9.;
run;