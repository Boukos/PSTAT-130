options ls=64 nodate nonumber;
proc print data=ia.empdata;
   id JobCode;
   var EmpID Salary;
run;