  /* z/OS: proc fslist fileref='.prog2.rawdata(states)'; */
proc fslist fileref='states.dat';
run;

data states;
  /* z/OS: infile '.prog2.rawdata(states)' dlm='!'; */
   infile 'states.dat' dlm='!'; 
   length State $16;
   input State $ 
		 Population : comma9. 
		 Size 
		 EnterDate : date9.;
run;

title1 'State Names and Facts';
proc print data=states;
   format EnterDate date9.;
run;

