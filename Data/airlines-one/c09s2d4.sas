libname ia '.';
options ls=68 nodate nonumber;
proc means data=ia.crew; 
   title 'Salary Analysis';
run;
