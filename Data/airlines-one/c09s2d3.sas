libname ia '.';
options ls=64 nodate nonumber;

proc format;
   value $codefmt
         'FLTAT1'-'FLTAT3'='Flight Attendant'
         'PILOT1'-'PILOT3'='Pilot';
   value money 
         low-<25000 ='Less than 25,000'
         25000-50000='25,000 to 50,000'
         50000<-high='More than 50,000';
run;

proc freq data=ia.crew;
   tables JobCode*Salary;
   format JobCode $codefmt. Salary money.;
   title 'Salary Distribution by Job Codes';
run;