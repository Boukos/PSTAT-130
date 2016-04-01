libname data1 "X:\PSTAT 130\airlines one";
title 'Silly Program';
footnote 'End of Page';

*defining titles and footnotes;
*gerneral form of the title statement;



proc print data=data1.empdata, label;
*	var jobcode empid salary;
	label empid = "Employee ID";
*JobCode = "Joob Coode";
run;

