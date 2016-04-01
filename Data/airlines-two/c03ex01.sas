data usarea;
   set prog2.states;
   TotArea+Size;
   NumStates+1;
    /*sum statements create TotArea and Numstates, retains, sets
       initial value to 0, and ignores missing values of size*/
run;

proc print data=usarea;
run;