data insur1(drop=Type DepName);
   length ID $ 6 DepName $ 20 Relation $ 1;
   retain ID;
   infile 'dependants2.dat' dlm=':';
   input Type $ @;
   if Type='E' then input ID $;
   else input DepName $ Relation $;
run;

proc print data=insur1 noobs;
   title 'Alternate Summarize: Step 1';
run;

data insurance(drop=Relation);
   set Insur1;
   by ID notsorted;
   if First.ID then Deduct=0;
   if Relation='C' then Deduct+25;
   else if Relation='S' then Deduct+50;
   if Last.ID;
run;

proc print data=insurance noobs;
   title 'Alternate Summarize: Step 2';
run;
