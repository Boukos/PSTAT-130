  /* z/OS: proc fslist fileref='.prog2.rawdata(salaries)'; */
proc fslist fileref='salaries.dat';
run;

data salaries (drop=type);
   retain ID LName FName;
   length ID $ 6;
  /* z/OS: infile '.prog2.rawdata(salaries)'; */
   infile 'salaries.dat';
   input Type $ @; 
   if Type = 'E' then  
      input ID  
	    FName $ 
	    LName $;
   else if Type = 'S' then do;
      input SalYear 
	    Salary : comma6.;
      output;
   end;
run;

title1 'Yearly Salaries Through 2001';
proc print data=salaries;
run;
