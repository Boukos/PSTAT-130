libname ia '.';
options ls=64 nodate nonumber;
proc freq data=ia.crew;
   tables JobCode;
   title 'Distribution of Job Code Values';
run;
