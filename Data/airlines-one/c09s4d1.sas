options ls=64 nodate nonumber;
libname ia '.';    
title 'Flight Attendant Counts by Location';
proc tabulate data=ia.fltat;
   class Location ;
   table Location;
run;
