data work.dfwlax;
   set work.dfwlaxdates(rename=(Date=OldDate));
   drop OldDate;
   Date=datepart(OldDate); 
   format Date date9.; 
run;
options ls=64 nodate nonumber;
proc print data=work.dfwlax;
run;