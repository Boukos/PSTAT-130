data statepop;
input state $12. @13 pop comma10.0;
datalines;
California  36,961,664
Texas       24,782,302
New York    19,541,453
Florida     18,537,969
Illinois    12,910,409
;
run;

proc print data=statepop;
format pop comma10.;
run;
