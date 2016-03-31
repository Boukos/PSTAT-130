options ls=64 nodate nonumber;
libname ia '.';
proc print data=ia.empdata noobs;
   var JobCode EmpID Salary;
run;