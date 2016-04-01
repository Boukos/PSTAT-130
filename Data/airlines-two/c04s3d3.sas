options nocenter nodate nonumber;

data HierStep1;
   drop DepName;  /*We have to read DepName */
                  /* because this is list input, */
                  /*but we do not need it to summarize*/
   length Type $ 1 ID $ 6 DepName $ 20 Relation $ 1;
   retain ID;
   infile 'dependants2.dat' dlm=':';
   input Type $ @;
   if Type='E' then
      input ID $;
   else input DepName $ Relation $;
run;

proc print data=hierstep1;
   title 'First Step in Summarizing a Hierarchical File';
run;

data Hierstep2;
  drop Type Relation;
  set Hierstep1;
  by ID notsorted;
    /*The notsorted option indicates that the */
    /*data is grouped by the By variable but that*/
    /*the values of the variable are not necessarily*/
    /*in sort order.  This creates First. and Last.*/
  if First.ID then Deduct=0;
  if Relation='C' then Deduct+25;
  else if Relation='S' then Deduct+50;
         /*Must make sure Relation='S' and not missing*/
  if Last.ID;
run;

proc print data=hierstep2;
  title 'Deductions for All Employees';
run;
