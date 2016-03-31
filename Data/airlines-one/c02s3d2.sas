 /* Create work.staff data set */
data work.staff;
   infile 'emplist.dat';
   input LastName $ 1-20 FirstName $ 21-30
         JobTitle $ 36-43 Salary 54-59;
run;

 /* Produce listing report of work.staff */
proc print data=work.staff;
run;
