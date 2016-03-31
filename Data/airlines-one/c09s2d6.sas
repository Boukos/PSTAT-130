libname ia '.';
options ls=72 nodate nonumber;

proc means data=ia.crew maxdec=2;
   var Salary;
   class JobCode;
   title 'Salary by Job Code';
run;
