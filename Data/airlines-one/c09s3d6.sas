libname ia '.';
options ls=64 nodate nonumber;

proc report data=ia.crew nowd headline headskip;
   column JobCode Location Salary;
   define JobCode / group width=8 'Job Code';
   define Location / group 'Home Base';
   define Salary / format=dollar10.;
   rbreak after / summarize dol;
run;
