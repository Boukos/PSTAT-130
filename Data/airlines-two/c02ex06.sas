data _null_;

   set prog2.visits end=IsLast;

   /* z/OS: file '.prog2.rawdata(visits)' dlm=','; */
   file 'visits.csv' dlm=',';

   if _N_ = 1 then
      put 'SSN,Date,Fee';
   put SSN
       Date : mmddyy10.
       Fee;
   if IsLast = 1 then
      put 'Data: PROG2.VISITS';
run;


/* z/OS: proc fslist fileref='.prog2.rawdata(visits)'; run; */
proc fslist fileref='visits.csv';
run;



/* Alternate SAS9 solution. */

/* Windows users: Remember to save file, rather than open, if 
   prompted by requestor window, then open outside SAS using 
   Excel. */ 

ods csvall file='visits.csv';
/* z/OS: ods csvall file='.prog2.rawdata(visits)'; */

title1;
footnote1 'Data: PROG2.VISITS';
proc print noobs data=prog2.visits;
	format Date mmddyy10.;
run;

ods csvall close;

/* UNIX: proc fslist fileref='visits.csv'; run; */
/* z/OS: proc fslist fileref='.prog2.rawdata(visits)'; run; */ 
