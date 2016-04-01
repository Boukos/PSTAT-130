  /* z/OS: proc fslist fileref='.prog2.rawdata(transact)'; */
proc fslist fileref='transact.dat';
run;

data transactions;
   length Type $ 1;
  /* z/OS: infile '.prog2.rawdata(transact)'; */
   infile 'transact.dat';
   input Date: date9. 
            Type 
           Amount : comma9. @@; 
run;

title1 'Transactions on Account';
proc print data=transactions;
   var date type amount;
run;
