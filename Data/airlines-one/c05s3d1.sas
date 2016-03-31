libname ia '.';
proc format;
   value $codefmt 
      'FLTAT'='Flight Attendant'
      'PILOT'='Pilot';
   value money low-<25000 ='Less than 25,000'
               25000-50000='25,000 to 50,000'
               50000<-high='More than 50,000';
run;
ods html file='c05s3d1.html';
proc print data=ia.empdata label noobs;
   label Salary='Annual Salary';
   format Salary money. Jobcode $codefmt.;
   title1 'Salary Report';
run;
ods html close;