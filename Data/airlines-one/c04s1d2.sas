libname ia '.';
options ls=64 nodate nonumber;
proc print data=ia.empdata;
   var JobCode EmpID Salary;
run;