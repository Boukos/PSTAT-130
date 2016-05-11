libname temp 'W:\TemporaryStorage\PStat 130';

proc print data=temp.admit;
run;

proc means data = temp.admit;
class sex;
var weight height;
run;

proc freq data = temp.admit;
run;
