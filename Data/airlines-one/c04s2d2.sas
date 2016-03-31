options nodate number pageno=1 ls=64;
proc print data=work.empdata;
   by JobCode;
   pageby JobCode;
   sum Salary;
run;   