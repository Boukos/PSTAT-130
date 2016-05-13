libname pstat 'W:\TemporaryStorage\PStat 130';

proc freq data = pstat.admit;
tables sex*actlevel;
run;



*this is a presentation procedure;
proc tabulate data=pstat.admit;
class actlevel;
var weight;
table actlevel, weight*mean;
run;



/*

Proc freq is doing a little bit more, you can do those things in tabulate. more modification needs to be dobe.


freq can do lots of statistical test and algorithm. it does complicative algorithms. 

proc tabulate is presenting statistics. 


proc freq 
*/

*this is a analysis procedure;
proc means data=pstat.admit;
class actlevel;
var weight;

run;



proc gchart data=pstat.admit;
hbar weight;
run;

proc gchart data=pstat.admit;
pie sex;
run;


proc gchart data=pstat.admit;
vbar actlevel;
run;

*Gplot is more flexible as you can just plot data on x-y axes; 

proc gplot data=pstat.admit;
*	symbol value = dot width = 2 color = red i=spline;

	plot weight * height /regegn;

	symbol value = dot width = 2 color = red i=i=rlCLM95;
run;
quit;
