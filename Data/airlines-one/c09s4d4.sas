title 'Counts for Cary and Frankfurt';
proc tabulate data=ia.fltat;
   where Location in ('CARY', 'FRANKFURT');
   class Location JobCode;
   table JobCode, Location;
run;
