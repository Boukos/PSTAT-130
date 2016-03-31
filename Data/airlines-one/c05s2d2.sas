libname ia '.';
options nodate nonumber ls=64;
proc format;
   value $codefmt 
      'FLTAT'='Flight Attendant'
      'PILOT'='Pilot';
   value money low-<25000 ='Less than 25,000'
               25000-50000='25,000 to 50,000'
               50000<-high='More than 50,000';
run;
proc print data=ia.empdata split=' ' noobs;
   label LastName='Last Name' 
         FirstName='First Name'
         Salary='Annual Salary';
   format Salary money. Jobcode $codefmt.;        
   title1 'Salary Report in Categories';
run;