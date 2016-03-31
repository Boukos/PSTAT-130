options ls=64 ps=15  nodate number;
data work.staff;
   infile 'emplist.dat';
   input LastName $ 1-20 FirstName $ 21-30 
         JobTitle $ 36-43 Salary 54-59;
run;

proc print data=work.staff label noobs;
	label
		FirstName= 'Hello'
		LastName= 'LAST NAME'
		JobTitle= 'Job Title'
		Salary = 'Annual Salary';
run;

proc means data=work.staff;
   class Jobtitle;
   var Salary;
run;
