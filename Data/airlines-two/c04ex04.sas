  /* z/OS: proc fslist fileref='.prog2.rawdata(bloodtyp)'; */
proc fslist fileref='bloodtyp.dat';
run;

data medical (drop=Plan) ;
  /* z/OS: infile '.prog2.rawdata(bloodtyp)'; */
   infile 'bloodtyp.dat';
   length 	ID $ 5 
			LName FName $ 11 
			Plan $ 1 
			Blood $ 3 ;
   input ID 
		 LName 
		 FName /
   		 Plan 
		 Blood; 
 run;

title1 'Patient Names and Blood Types';
proc print data=medical;
run;
