data retire;
   length EmpID $ 6;
   infile 'retire.dat'; * PC and Unix;
   *infile '.prog2.rawdata(retire)'; * z/OS;
   input EmpID $ Contrib @@;
run;

proc print data=retire noobs;
   title 'Contributions to Retirement Plan';
run;