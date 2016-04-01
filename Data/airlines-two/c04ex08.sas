  /* z/OS: proc fslist fileref='.prog2.rawdata(transact)'; */
proc fslist fileref='transact.dat';
run;

data credits debits;
   length Type $ 1;
  /* z/OS: infile '.prog2.rawdata(transact)'; */
   infile 'transact.dat';
   input Date : date9. 
		 Type 
		 Amount : comma9. @@; 
   if Type='C' then 
		output credits; 
   else if Type='D' then 
		output debits;
run;

title1 'Credits to Account';
proc print data=credits;
   var date type amount;
run;

title1 'Debits to Account';
proc print data=debits;
   var date type amount;
run;
