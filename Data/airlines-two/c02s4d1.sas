ods csvall file='export.dat'; * PC and Unix;
*ods csvall file='.prog2.rawdata(export)'; * z/OS;
footnote1 'data: prog2.maysales';
proc print noobs data=prog2.maysales;
   format ListDate
          SellDate date9.;
run;
ods csvall close;
