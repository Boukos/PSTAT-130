option nodate nonumber;
libname ia 'X:\PSTAT 130\airlines one';

data work.raises;
set ia.fltattnd;
if Jobcode = 'FLTAT1' then Increase = 0.12* Salary;
else if JobCode='FLTAT2' then Increase= 0.10 * Salary;
else if JobCode='FLTAT3' then Increase = 0.08 * Salary;
else Increase=0;
NewSal = Salary + increase;
keep EmpID Salary Increase NewSal;
run;

proc print data= work.raises;
format Salary dollar10.2
   	   NewSal dollar10.2
	   Increase dollar10.2;
run;
