data dependants(drop=Type);
   length type $1 EmpLName EmpFName DepName $ 20 Relation $ 1;
   retain EmpLName EmpFName ;
   infile 'dependants.dat' dlm=':';
   input Type $ @;
   if Type='E' then input EmpLName $ EmpFName $;
   else do;
      input DepName $ Relation $;
      output;
   end;
run;

proc print data=dependants noobs;
   title 'Employees and Dependant Names';
run;