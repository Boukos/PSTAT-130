data natural(keep=Name AtomicNum State) 
     synthetic(keep=Name AtomicNum);
   set prog2.elements;
   if State eq 'Synthetic' then
      output synthetic;
   else
      output natural;
run;

proc print data=natural;
run;

proc print data=synthetic;
run;

   /* Alternate Solution */

data natural(keep=Name AtomicNum State)
     synthetic(keep=Name AtomicNum);
   set prog2.elements;
   if State in ('Solid','Liquid','Gas') then
      output natural;
   else
      output synthetic;
run;

proc print data=natural;
run;

proc print data=synthetic;
run;
