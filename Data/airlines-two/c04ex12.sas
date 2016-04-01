  /* z/OS: proc fslist fileref='.prog2.rawdata(salaries)'; */
proc fslist fileref='salaries.dat';
run;

data current(drop=SalYear Type);
  /* Retain all the variables in the new data set. */
   retain ID LName FName HireDate Salary;
   length ID $ 6;
  /* z/OS: infile '.prog2.rawdata(salaries)'; */
   infile 'salaries.dat';
   input Type $ @;
   if Type = 'E' then do;
      if _n_ ne 1 then 
		output; /* Output when next employee is read. */
      input ID $ 
			FName $ 
			LName $ 
			HireDate : date9.;
   end;
   else if Type = 'S' then do;
      input SalYear 
			Salary : comma8.;
   end;
   if LastRec then
      output;
run;

title1 'Salaries as of 2001';
proc print data=current;
   format HireDate date9.;
run;
