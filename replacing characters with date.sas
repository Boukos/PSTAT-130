data have;
infile cards;
informat date $10.;
input date ;
cards;
05/21/2010
07/01/2010
03/01/2011
;
data want;
set have;
format _date mmddyy10.;
_date=input(trim(date),MMDDYY10.);
run;
proc print;

run;
