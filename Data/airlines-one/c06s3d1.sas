options ls=72 nodate nonumber;
data work.empdata2;
   infile 'employe2.dat';
   input EmpID $ 1-4 LastName $ 5-17 FirstName $ 18-30
         JobCode $ 31-36 Salary 37-45;
run;
proc print data=work.empdata2;
run;