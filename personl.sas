libname data1 'X:\PSTAT 130\airlines one';


proc print data=data1.personl;
run;


proc contents data=data1.personl;
run;
