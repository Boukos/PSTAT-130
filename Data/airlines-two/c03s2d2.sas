  /*Sort data set to prepare to summarize*/
proc sort data=prog2.regsals out=regsort;
  by Region Div;
run;

  /*Summarize Salaries by Division*/
data regdivsals(keep= Region Div DivSal NumEmps);
   set RegSort;
   by Region Div;
   if First.Div then do;
      DivSal=0;
      NumEmps=0;
   end;
   DivSal+Salary;
   NumEmps+1;
   if Last.Div;
run;

proc print data=regdivsals noobs;
  title 'Employee Salaries by Region and Division';
run;
