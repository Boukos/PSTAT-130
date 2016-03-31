proc tabulate data=ia.fltat;
   where Location in ('CARY', 'FRANKFURT');
   class Location JobCode;
   table JobCode all, Location all;
run;
