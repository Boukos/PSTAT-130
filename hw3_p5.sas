libname data1 'X:\PSTAT 130\airlines one';


data work.bonus;
set data1.fltattnd;
BonusAmt = 0.15* Salary;
AnnivMo = Month(HireDate);
keep EmpID Salary BonusAmt HireDate  AnnivMo;
run;

proc print data= work.bonus;
format HireDate date9.
	   Salary dollar10.0
	   BonusAmt dollar10.0;
var EmpID Salary BonusAmt HireDate  AnnivMo;
run;
