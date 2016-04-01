data salclrks;
  infile 'empfix.dat';  * PC and Unix;
  *infile '.prog2.rawdata(empfix)'; * z/OS;
  input  @1 Division $20. @21 HireDate mmddyy10.
         @31 Salary dollar10.2 @41 LastName $15.
         @56 FirstName $15. @71 Country $15.
         @86 Location $10. @96 IdNumber $6.
         @112 JobCode $6.;
  if jobcode='SALCLK';
run;

proc print data=salclrks noobs;
   title 'Employee Information for Sales Clerks';
run;