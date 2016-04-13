libname data1 'X:\PSTAT 130\airlines one';


proc sort data=data1.empdata out=work.s_empdata;
	by jobcode lastname;
run;


proc print data=work.s_empdata;
	by jobcode;
	sum salary;
	format salary dollar15.2;
run;
