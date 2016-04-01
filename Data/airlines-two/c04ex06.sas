data allergies2;
   length ID $ 5 
		  LName FName $ 11 
		  Plan $ 1 
		  Blood $ 3 
		  Allergy $ 1
          AlgyType $ 2;
  /* z/OS: infile '.prog2.rawdata(allergy)'; */
   infile 'allergy.dat';
   input ID 
		 LName 
		 FName 
		 Plan 
		 Blood 
		 Allergy @;
   if Allergy = 'Y'; 
   input AlgyType 
		 Dependents;
run;

title1 'Patients with Allergies Only';
proc print data=allergies2;
run;
