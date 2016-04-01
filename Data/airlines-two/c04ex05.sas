  /* z/OS: proc fslist fileref='.prog2.rawdata(allergy)'; */
proc fslist fileref='allergy.dat';
run;

data allergies;
   length ID $ 5 
		  LName FName $ 11 
		  Plan $ 1 
		  Blood $ 3 
		  Allergy $ 1
          AlgyType $ 2;
  /* z/OS: infile '.prog2.rawdata(allergy)'; */
   infile 'allergy.dat';
   input ID LName FName Plan Blood Allergy @;
   if Allergy='N' then 
      input Dependents;
   else if Allergy='Y' then 
      input AlgyType Dependents;
run;

title1 'Patients and Allergy Code';
proc print data=allergies;
run;
