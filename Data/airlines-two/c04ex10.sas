  /* z/OS: proc fslist fileref='.prog2.rawdata(emptwo)'; */
proc fslist fileref='emptwo.dat';
run;

data empinfo;
  /* z/OS: infile '.prog2.rawdata(emptwo)' dlm=','; */
   infile 'emptwo.dat' dlm=',';
   input #2 IdNumber : $6. 
		    LastName : $15. 
			FirstName : $15. 
         #1 Division :$20. 
			HireDate : mmddyy10. 
			Salary;
run;

title1 'Employee Data';
proc print data=empinfo;
	format HireDate mmddyy10.;
run;
