proc print data=ia.empdata noobs;
   var JobCode EmpID Salary;
   sum Salary;
run;