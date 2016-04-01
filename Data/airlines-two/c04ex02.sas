  /* z/OS: proc fslist fileref='.prog2.rawdata(aromas)'; */
proc fslist fileref='aromas.dat';
run;

data aromas;   
   length Condition Cure1-Cure3 $ 11;
  /* z/OS: The combination of DSD and DLM=' ' treats the 
     trailing blanks in fixed-length records as explicit missing 
     values, so MISSOVER is not needed under z/OS.
   infile '.prog2.rawdata(aromas)' dsd dlm=' '; */
   infile 'aromas.dat' dsd dlm=' ' missover;
   input Condition $ Cure1 $ Cure2 $ Cure3 $;
run;

title1 'Aromatherapy Data Set';
proc print data=aromas;
run;
