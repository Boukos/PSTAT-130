libname ia '.';
proc sort data=ia.empdata out=work.empdata;
   by JobCode;
run;
proc print data=work.empdata;
   by JobCode;
   sum Salary;
run;   
