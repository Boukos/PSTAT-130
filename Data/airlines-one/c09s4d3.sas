title2 'by JobCode';
proc tabulate data=ia.fltat;
   class Location JobCode;
   table JobCode, Location;
run;
