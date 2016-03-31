title 'Average Salary for Cary and Frankfurt';
proc tabulate data=ia.fltat format=dollar12.;
   where Location in ('CARY', 'FRANKFURT');
   class Location JobCode;
   var Salary;
   table JobCode, Location*Salary*mean;
run;
