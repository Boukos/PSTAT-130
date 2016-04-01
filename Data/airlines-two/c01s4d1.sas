proc contents data=work.fltat1;
run;

proc print data=work.fltat1;
   title 'Default List Report of WORK.FLTAT1 Data Set';
run;

proc print data=work.fltat1 noobs;
   title 'List Report NOOBS Option';
run;

proc print data=work.fltat1 noobs;
   format Salary Bonus dollar7. HireDate mmddyy10.;
   title 'Add a FORMAT Statement';
run;

proc print data=work.fltat1 noobs;
   var EmpID Bonus Salary;
   format Salary Bonus dollar7. HireDate mmddyy10.;
   title 'Use VAR to Display Only Three Variables';
run;