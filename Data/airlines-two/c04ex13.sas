  /* z/OS: proc fslist fileref='.prog2.rawdata(salaries)'; */
proc fslist fileref='salaries.dat';
run;

data stepone(drop=SalYear Type);
   retain ID LName FName HireDate;
   length ID $ 6;
  /* z/OS: infile '.prog2.rawdata(salaries)'; */
   infile 'salaries.dat';
   input Type $ @;
   if Type = 'E' then
      input ID $ 
			FName $ 
			LName $ 
			HireDate : date9.;
   else if Type = 'S' then 
      input SalYear 
			Salary : comma8.;
   format HireDate date9.;
run;

title1 'Reading a Hierarchical File -- First Phase';
proc print data=stepone;
run;

data twostep;
   set stepone;
   by ID notsorted;
   if Last.ID then 
		output;
run;

title1 'Salaries as of 2001';
proc print data=twostep;
run;
