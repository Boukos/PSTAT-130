proc sql;
   select EmpID, FirstName, LastName, 
          JobCode, FltID, SchDate
   from prog2.rduschedule, prog2.fltspts
   where EmpID=ID /*SQL does not require same-name BY variables*/
   ;
quit;