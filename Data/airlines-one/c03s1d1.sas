libname ia '.';
options nodate nonumber ls=64;
proc contents data=ia._all_ nods;
run;

proc contents data=ia.crew;
run;