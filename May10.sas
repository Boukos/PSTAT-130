libname temp 'W:\TemporaryStorage\PStat 130';

proc print data=temp.admit;
run;

proc means data = temp.admit;
class sex;
var weight height;
run;

proc freq data = temp.admit;
	tables sex*actlevel;
run;

proc tabulate data = temp.admit;
class sex actlevel;
var weight;
table sex all, actlevel all;
run;

proc report data = temp.admit;
run;
