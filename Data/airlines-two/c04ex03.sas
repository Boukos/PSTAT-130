  /* z/OS: proc fslist fileref='.prog2.rawdata(aromasf)'; */
proc fslist fileref='aromasf.dat';
run;


  /* The PAD option handles the problem by adding spaces to 
     shorter records. */
data aromasf;
  /* z/OS: infile '.prog2.rawdata(aromasf)' pad; */
   infile 'aromasf.dat' pad;
   input @ 1 Condition $10. 
		 @11 Cure1 $11. 
         @22 Cure2 $11. 
	 	 @33 Cure3 $11.;
run;

title1 'Results from PAD Option';
proc print data=aromasf;
run;


  /* The TRUNCOVER option tells SAS not to read from the next 
     line   when it runs out of data, but to assign whatever it 
     has read to the variable. */
data aromasf;
  /* z/OS: infile '.prog2.rawdata(aromasf)' truncover; */
   infile 'aromasf.dat' truncover;
   input @ 1 Condition $10. 
		 @11 Cure1 $11.  
         @22 Cure2 $11. 
		 @33 Cure3 $11.;
run;

title1 'Results from TRUNCOVER Option';
proc print data=aromasf;
run;


