  /* z/OS: proc fslist fileref='.prog2.rawdata(empfix)'; */
proc fslist fileref='empfix.dat';
run;

data salclrks;
  /* z/OS: infile '.prog2.rawdata(empfix)'; */
  infile 'empfix.dat';
  input @112 JobCode $6. @;
  if jobcode='SALCLK';
  input @ 1 Division $20. 
		@21 HireDate mmddyy10.  
        @31 Salary dollar10.2 
		@41 LastName $15.  
        @56 FirstName $15. 
		@71 Country $15. 
        @86 Location $10. 
		@96 IdNumber $6.;
run;

title1 'Employee Information for Sales Clerks';
proc print data=salclrks noobs;
run;
