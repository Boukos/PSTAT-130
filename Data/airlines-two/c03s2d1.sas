  /*Sort data set to prepare to summarize*/
proc sort data=prog2.empsals out=salsort;
   by Div;
run;

  /*Summarize Salaries by Division*/
data divsals(keep=Div DivSal);
   set SalSort;
   by Div;
   if First.Div then DivSal=0;
   DivSal+Salary;
   if Last.Div;
run;

proc print data=divsals noobs;
   title 'Employee Salaries by Division';
run;