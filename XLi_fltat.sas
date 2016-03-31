libname data1 base "X:\PSTAT 130\airlines one";
run;

proc print data=data1.fltat label;
label HireDate = 'Hire Date'
	  LastName = 'Last Name'
	  FirstName = 'First Name'
	  JobCode = 'Job Code'
	  Salary = 'Salary';
	  title1 "Salary Report";
footnote "My first dataset";
format Salary dollar12.2;
format HireDate mmddyy10.;
run;
