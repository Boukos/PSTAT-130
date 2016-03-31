libname ia '.';
options ls=64 nodate nonumber;

proc format;
   value $codefmt
         'FLTAT1'-'FLTAT3'='Flight Attendant'
         'PILOT1'-'PILOT3'='Pilot';
run;
proc freq data=ia.crew;
   format JobCode $codefmt.;
   tables JobCode;
run;

