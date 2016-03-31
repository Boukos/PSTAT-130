proc tabulate data=ia.fltat format=dollar12.;
   where Location in ('CARY', 'FRANKFURT');
   class Location JobCode;
   var Salary;
   table JobCode all, Location*Salary*mean all*Salary*mean;
run;