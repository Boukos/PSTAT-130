libname ia '.';
options ls=68 nodate nonumber;

proc means data=ia.crew;
   var Salary;
   title 'Salary Analysis';
run;
