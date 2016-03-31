libname ia '.';
options ls=64 nodate nonumber;

proc report data=ia.crew nowd;
   column JobCode Location Salary;;
   define JobCode / order width=8 'Job Code';
   define Location / 'Home Base';
   define Salary / format=dollar10.;
run;
