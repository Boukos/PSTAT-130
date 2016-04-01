proc print data=prog2.test noobs;
   title 'List Report of Prog2.Test Data Set';
run;

data prog2.fltat1;
   infile 'fltat1.dat'; * PC and Unix;
   *infile '.prog2.rawdata(fltat1)'; * z/OS;
   input @1 EmpID $5. @7 HireDate date9. @17 Salary 5.;
   Bonus=salary*.05;
run;

proc print data=prog2.fltat1 noobs;
   format Salary Bonus dollar7. HireDate mmddyy10.;
run;