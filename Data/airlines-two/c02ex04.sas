data lanthanides actinides;
   set prog2.elements;
   if AtomicNum ge 57 and AtomicNum le 70 then
      output lanthanides;
   else if AtomicNum ge 89 and AtomicNum le 102 then
      output actinides;
run;

proc print data=lanthanides;
run;

proc print data=actinides;
run;
