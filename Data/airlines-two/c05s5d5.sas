data phonenumbers;   
   set prog2.phones; 
   Phone='(' !! Code !! ') ' !! Telephone;   
run;     
   
proc print data=phonenumbers noobs;    
   title 'Results from automatic conversion';
run;     