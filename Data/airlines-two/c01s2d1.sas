data work.fltat1;
   infile 'fltat1.dat'; * PC and Unix;
   *infile '.prog2.rawdata(fltat1)'; * z/OS;
   input @1 EmpID $5. @7 HireDate date9. @17 Salary 5.;
   Bonus=Salary*.05;
run;