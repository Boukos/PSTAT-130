libname ia '.';
options ls=64 nodate nonumber;

title 'Salary Analysis';
proc report data=ia.crew nowd;
   column JobCode Location Salary;
run;
