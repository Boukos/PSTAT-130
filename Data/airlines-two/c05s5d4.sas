data birth(drop=Date);
   set prog2.born;
   Birthday=input(Date,date7.);
   Age=int(yrdif(Birthday,'3may2008'd,
      	'ACT/ACT'));
run;

proc print data=birth noobs;
   title 'Converting Character Dates to SAS Dates';
run;

