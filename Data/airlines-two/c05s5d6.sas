data phonenumbers(drop=NumCode Code);  
   set prog2.phones(rename=(Code=NumCode));  
   Code=put(NumCode,3.);   
   Phone='(' !! Code !! ') ' !! Telephone;   
run;     
   
proc contents data=phonenumbers; 
   title 'Descriptor portion of PHONENUMBERS';     
run;     
   
proc print data=phonenumbers noobs;    
   title 'Results from conversion using the PUT function';     
run;
