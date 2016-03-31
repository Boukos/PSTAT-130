title 'Total Salary for Cary and Frankfurt';
proc tabulate data=ia.fltat;
   where Location in ('CARY', 'FRANKFURT');
   class Location JobCode;
   var Salary;
   table JobCode, Location*Salary;
run;
