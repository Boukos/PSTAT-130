   /*
libname ia 'SAS-data-library';
   */

libname ia '.';
proc print data=ia.empdata;
run;