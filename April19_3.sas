data people;
input name $12. +(-1) age; 
datalines; 
john smith 25
jane doe   29 
; 
run; 
proc print data=people; 
run;
